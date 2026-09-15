if !global.kontrol_menusu_acik exit;
panel_ust_sinir = room_height - global.secenekler_kismi_aciklik;

// --- DÜZELTİLDİ: alt kenar boşluğunu da hesaba kat ---
var _alt_sinir =  (room_height / 2) + sprite_get_height(spr_menu) - (global.kareler_kenar_bosluklari * 3.5);
gorunur_alan_yuksekligi = _alt_sinir - panel_ust_sinir;



if point_in_rectangle(mouse_x, mouse_y, (room_width / 2) - sprite_get_width(spr_menu), global.secenekler_kismi_aciklik, (room_width / 2) + sprite_get_width(spr_menu), (room_height / 2) + (sprite_get_height(spr_menu))) {
	if (mouse_wheel_up()) {
	    hedef_scroll -= scroll_hizi;
	    momentum = 0; // tekerlek kullanılırken momentumu sıfırla
	}
	if (mouse_wheel_down()) {
	    hedef_scroll += scroll_hizi;
	    momentum = 0;
	}
}
if global.android {
	// --- Dokunma / sürükleme (Android + masaüstü mouse ile de çalışır) ---
	var _dokunma_y = device_mouse_y_to_gui(0);

	if (device_mouse_check_button_pressed(0, mb_left)) {
	    // Parmak/mouse ekrana yeni değdi
	    surukleniyor = true;
	    surukleme_baslangic_y = _dokunma_y;
	    onceki_dokunma_y = _dokunma_y;
	    surukleme_hizi = 0;
	    momentum = 0; // yeni dokunuşta önceki momentumu iptal et
	}
	else if (device_mouse_check_button(0, mb_left) && surukleniyor) {
	    // Parmak/mouse basılı tutularak hareket ediyor
	    var _fark = _dokunma_y - onceki_dokunma_y;
    
	    // Aşağı sürüklersen (_fark pozitif) içerik aşağı inmeli -> hedef_scroll azalmalı
	    hedef_scroll -= _fark;
    
	    surukleme_hizi = _fark; // momentum için son hızı sakla
	    onceki_dokunma_y = _dokunma_y;
	}
	else if (device_mouse_check_button_released(0, mb_left) && surukleniyor) {
	    // Parmak/mouse kaldırıldı -> momentum devreye girsin
	    surukleniyor = false;
	    momentum = -surukleme_hizi; // bırakılırken son hız yönünde kaymaya devam etsin
	}

	// --- Sürüklenmiyorken momentum ile doğal yavaşlama ---
	if (!surukleniyor && abs(momentum) > 0.1) {
	    hedef_scroll += momentum;
	    momentum *= momentum_surtunme;
	} 
	else if (!surukleniyor) {
	    momentum = 0;
	}
}

// --- Sahnedeki aktif seçenek sayısını struct'tan bul ---
toplam_secenek_sayisi = 0;
if (variable_global_exists("chatterbox_verileri")
    && variable_struct_exists(global.chatterbox_verileri, "secenek_yukseklik")) {
    toplam_secenek_sayisi = array_length(struct_get_names(global.chatterbox_verileri.secenek_yukseklik));
}

// --- Toplam içerik yüksekliğini bul ---
var _toplam_icerik = 0;
if (variable_global_exists("chatterbox_verileri")
    && variable_struct_exists(global.chatterbox_verileri, "secenek_yukseklik")) {
    var _son_index = toplam_secenek_sayisi - 1;
    if (_son_index >= 0) {
        var _son_y = global.chatterbox_verileri.secenek_yukseklik[$ string(_son_index)];
        if (!is_undefined(_son_y)) {
            _toplam_icerik = _son_y - panel_ust_sinir;
        }
    }
}

// --- Kaydırma sınırlarını hesapla ---
var _max_scroll = max(0, _toplam_icerik - gorunur_alan_yuksekligi);

// --- Sınırın dışına taşınca "lastik gibi" yumuşak direnç (elastic bounce) ---
if (hedef_scroll < 0) {
    hedef_scroll = hedef_scroll * 0.5; // sınırın dışında hafif direnç hissi
    momentum = 0;
}
else if (hedef_scroll > _max_scroll) {
    hedef_scroll = _max_scroll + (hedef_scroll - _max_scroll) * 0.5;
    momentum = 0;
}

// Bırakıldığında kesin sınırlara emniyetli şekilde geri çek
if (!surukleniyor) {
    hedef_scroll = clamp(hedef_scroll, 0, _max_scroll);
}

// --- Doğal, yumuşak geçiş ---
gercek_scroll = lerp(gercek_scroll, hedef_scroll, yumusatma);

global.secenek_scroll = gercek_scroll;
global.secenek_panel_ust_sinir = panel_ust_sinir;