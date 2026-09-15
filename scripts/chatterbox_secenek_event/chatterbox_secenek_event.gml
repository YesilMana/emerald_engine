// =======================================================================
// ANA EVENT FONKSİYONLARI (Objenin içinden çağırılacak olanlar)
// =======================================================================

function secenek_create() {
    secenek_baslangic_degerleri();
    secenek_scroll_sifirla_ve_temizle();
}

function secenek_step() {
    if (!global.kontrol_menusu_acik || global.sekme != 1) exit;
    if (opaklik == 0) exit;
    if (!variable_instance_exists(id, "secenek_metni") || !variable_instance_exists(id, "secenek_numarasi")) exit;
    
    // 1. Seçeneğin listedeki (alt alta) temel koordinatlarını belirle
    secenek_temel_pozisyon_hesapla();
    
    // 2. Yukarı/Aşağı kaydırma (scroll) ve hafif titreme efektini uygula
    secenek_titreme_ve_scroll_uygula();
    
    // 3. Mouse ile üzerine gelme ve tıklama işlemlerini dinle
    secenek_mouse_etkilesimi();
    
    // 4. Panelin üst/alt sınırlarına yaklaşınca solma (fade) efektini hesapla
    secenek_sinirda_solma_hesapla();
}

function secenek_draw() {
    if (!global.kontrol_menusu_acik || global.sekme != 1) exit;
    if (opaklik == 0) exit;
    if (!variable_instance_exists(id, "secenek_metni") || !variable_instance_exists(id, "secenek_numarasi")) exit;
    if (cizim_alphasi <= 0) exit; // Tamamen görünmezse performanstan tasarruf et, çizme
    
    // 1. Çizimlerin panel dışına taşmasını engellemek için kırpma (scissor) aç
    var _scissor_aktif = secenek_kirpma_alani_ayarla();
    
    // 2. Kutuyu, hover efektini ve yazıyı ekrana çiz
    secenek_arkaplan_ve_metin_ciz();
    
    // 3. Eğer kırpma açıldıysa, oyunun geri kalanı bozulmasın diye kapat
    if (_scissor_aktif) {
        gpu_set_scissor(0, 0, display_get_gui_width(), display_get_gui_height());
    }
}



function secenek_baslangic_degerleri() {
    secenek_metni = "Gelecek Sene buralarda olmayacağım malesef";
    secenek_numarasi = 0;
    renk = c_gray;
    temel_x = 0;
    temel_y = 0;
    opaklik = 1;
    cizim_alphasi = 1;
    mouse_geldi = false;
    metin_yuksekligi = 0; // Gerçek yazı yüksekliğini cache'lemek için
    depth = -100;
    global.chatterbox_verileri.secenek_yukseklik = {};
}

function secenek_scroll_sifirla_ve_temizle() {
    if (instance_exists(obj_secenek_kaydirma)) {
        with (obj_secenek_kaydirma) {
            hedef_scroll = 0;
            gercek_scroll = 0;
            momentum = 0;
            surukleniyor = false;
        }
    }
}


// --- STEP YARDIMCILARI ---

function secenek_temel_pozisyon_hesapla() {
    x = global.konum_x_secenek;
    var _temel_yukseklik = display_get_gui_height() - global.secenekler_kismi_aciklik + (sprite_height / 2) + 10 + global.kareler_kenar_bosluklari;
    
    // İlk seçenekse temel yüksekliğe koy, değilse bir öncekinin altına hizala
    if (secenek_numarasi == 0) {
        y = _temel_yukseklik;
    } else {
        var _onceki_y = global.chatterbox_verileri.secenek_yukseklik[$ string(secenek_numarasi - 1)];
        if (!is_undefined(_onceki_y)) {
            y = _onceki_y + (sprite_height / 2) + 10;
        } else {
            y = _temel_yukseklik + (secenek_numarasi * 100);
        }
    }
    
    // Diğer seçeneklerin hizalanabilmesi için kendi alt sınırımızı (bbox_bottom) kaydediyoruz
    // (Bu işlem scroll ve titreme eklenmeden ÖNCE yapılmalı ki dizilim bozulmasın)
    global.chatterbox_verileri.secenek_yukseklik[$ string(secenek_numarasi)] = bbox_bottom;
    
    temel_x = x;
    temel_y = y;
}

function secenek_titreme_ve_scroll_uygula() {
    var _scroll = variable_global_exists("secenek_scroll") ? global.secenek_scroll : 0;
    
    // Kaydırma miktarını ve hafif rastgele titremeyi ekle
    x = temel_x + random_range(-1, 1);
    y = temel_y - _scroll + random_range(-1, 1);
}

function secenek_mouse_etkilesimi() {
    mouse_geldi = false;
    
    if (position_meeting(mouse_x, mouse_y, id)) {
        mouse_geldi = true;
        
        // Sadece görünür durumdayken (alpha == 1) tıklamaya izin ver
        if (mouse_check_button_pressed(mb_left) && cizim_alphasi == 1) {
            ChatterboxSelect(global.chatterbox_dosyasi, secenek_numarasi);    
            global.secenek_etiketleri = {};
            
            with (obj_secenekler) {
                instance_destroy();
                hk_duzenle("hk_1", 0);
            }
            
            // Yeni sorular gelirken eski verileri temizle
            if (variable_global_exists("chatterbox_verileri")) {
                global.chatterbox_verileri.secenek_yukseklik = {};
            }
            
            // Scroll'u sıfırla ki yeni sorular en yukarıdan başlasın
            secenek_scroll_sifirla_ve_temizle();
        }
    } else {
        renk = c_black;
    }
}

function secenek_sinirda_solma_hesapla() {
    // Yazının tam kapladığı yüksekliği Scribble ile ölç
    var _yazi_olcum = scribble(secenek_metni)
        .wrap(global.secenek_wrap)
        .line_height(35, 40);
    metin_yuksekligi = _yazi_olcum.get_height();
    
    var _fade_mesafesi = 80;
    
    // ÜST SINIR HESAPLAMASI
    var _ust_sinir = variable_global_exists("secenek_panel_ust_sinir") ? global.secenek_panel_ust_sinir : 0;
    var _yazi_ustu = y - (metin_yuksekligi / 2);
    var _ust_alpha = 1;
    
    if (_yazi_ustu < _ust_sinir) {
        var _uzaklik_ust = _ust_sinir - _yazi_ustu;
        _ust_alpha = clamp(1 - (_uzaklik_ust / _fade_mesafesi), 0, 1);
    }
    
    // ALT SINIR HESAPLAMASI (Gerçek yazı yüksekliği kullanılarak)
    var _alt_sinir = (room_height / 2) + sprite_get_height(spr_menu) - global.kareler_kenar_bosluklari * 2.5;
    var _yazi_alti = y + (metin_yuksekligi / 2);
    var _alt_alpha = 1;
    
    if (_yazi_alti > _alt_sinir) {
        var _uzaklik_alt = _yazi_alti - _alt_sinir;
        _alt_alpha = clamp(1 - (_uzaklik_alt / _fade_mesafesi), 0, 1);
    }
    
    // Hem alttan hem üstten hangisi daha şeffaf olmasını gerektiriyorsa onu uygula
    cizim_alphasi = min(_ust_alpha, _alt_alpha);
    global.secenek_alt_sinir = _alt_sinir;
}

// Boş bile olsa event'in hata vermemesi için yer tutucu
function mouse_tekerlegi_kullanma() {
    // İleride mouse tekerleği eklenecekse burası kullanılacak
}


// --- DRAW YARDIMCILARI ---

function secenek_kirpma_alani_ayarla() {
    var _ust_sinir = variable_global_exists("secenek_panel_ust_sinir") ? global.secenek_panel_ust_sinir : 0;
    var _alt_sinir = variable_global_exists("secenek_alt_sinir") ? global.secenek_alt_sinir : display_get_gui_height();
    
    // Eğer sınırlar mantıklıysa fiziksel kesme (scissor) alanını başlat
    if (_ust_sinir >= 0 && _alt_sinir > _ust_sinir && _alt_sinir <= display_get_gui_height()) {
        gpu_set_scissor(
            0,
            _ust_sinir,
            display_get_gui_width(),
            _alt_sinir - _ust_sinir
        );
        return true; // Kırpma açıldı
    }
    return false; // Kırpma açılmadı
}

function secenek_arkaplan_ve_metin_ciz() {
    var _yazilar = scribble(secenek_metni)
        .starting_format("fnt_iovan", c_white)
        .wrap(global.secenek_wrap)
        .line_height(35, 40)
        .align(fa_center, fa_middle);
        
    var yukseklik = _yazilar.get_height();
    var genislik = _yazilar.get_width();
    
    // Kutunun (sprite) ölçeğini yazı boyutuna göre ayarla
    if (sprite_index != -1) {
        var tolerans = 1.9;
        image_xscale = (genislik / sprite_get_width(sprite_index)) * tolerans;
        image_yscale = (yukseklik / sprite_get_height(sprite_index)) * tolerans;
        image_xscale = global.secenek_scale;
    }
    
    // Kutu çizimi (Eğer özel kod çalıştırılması istenmişse farklı bir işlem yap)
    if (variable_instance_exists(id, "deger") && deger == undefined) {
        draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, renk, cizim_alphasi);
    } else {
        secenek_ozel_kod(deger); // Harici tanımlı özel fonksiyon
    }    
    
    // Mouse üzerindeyse parlama/vurgu katmanını çiz
    if (mouse_geldi) {
        draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, c_white, cizim_alphasi / 1.3);    
    }
    
    // Scribble metnini en üste çizdir
    _yazilar.alpha = cizim_alphasi;
    _yazilar.draw(x, y);
}