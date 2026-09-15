ChatterboxAddFunction("dosyayaGec", function(_dosya_adi, _node_adi) {
    if (!variable_struct_exists(global.chatterbox_dosyalar, _dosya_adi)) {
        show_debug_message("HATA: '" + _dosya_adi + "' yüklü değil!");
        return 0;
    }
    
    // Hem objeyi alıyoruz, hem de ismini metin olarak kaydediyoruz!
    global.chatterbox_dosyasi = global.chatterbox_dosyalar[$ _dosya_adi];
    global.aktif_dosya_ismi = _dosya_adi; // Bize JSON için bu lazım
    
    ChatterboxJump(global.chatterbox_dosyasi, _node_adi);
    return 1;
});

ChatterboxAddFunction("veri_ekle", function(_anahtar, _deger) {
    // global.chatterbox_verileri nesnenin adıysa onu kullan
    global.chatterbox_verileri.veri_ekle(_anahtar, _deger);
});

ChatterboxAddFunction("veri_duzenle", function(_anahtar, _deger) {
    global.chatterbox_verileri.veri_duzen(_anahtar, _deger);
});

ChatterboxAddFunction("cocuk_stat_ekle", function(_anahtar, _deger) {
    global.chatterbox_verileri.cocuk_stat_ekle(_anahtar, _deger);
});
ChatterboxAddFunction("oyuncu_stat_ekle", function(_anahtar, _deger) {
    global.chatterbox_verileri.oyuncu_stat_ekle(_anahtar, _deger);
});
ChatterboxAddFunction("cocuk_stat_cek", function(_anahtar) {
    return global.chatterbox_verileri.cocuk_stat_cek(_anahtar);
});
ChatterboxAddFunction("oyuncu_stat_cek", function(_anahtar) {
   return global.chatterbox_verileri.oyuncu_stat_cek(_anahtar);
});
ChatterboxAddFunction("veri_oku", function(_anahtar, _deger) {
    return global.chatterbox_verileri.veri_oku(_anahtar);
});

ChatterboxAddFunction("secenek_data", secenek_data);

ChatterboxAddFunction("secenek_sifirla", function() {
	global.secenek_etiketleri = {};
});

function secenek_data(secenek_numarasi, veri) {
	global.secenek_etiketleri[$ string(secenek_numarasi)] = veri;
}

function ui_kareler_cizim() {
	draw_rectangle(
		global.kareler_kenar_bosluklari,
		global.kareler_kenar_bosluklari,
		(display_get_gui_width() / 2) - (global.kareler_kenar_bosluklari / 2),
		display_get_gui_height() - global.kareler_kenar_bosluklari,
		true
	);
	
	draw_rectangle(
		20,
		display_get_gui_height() - global.secenekler_kismi_aciklik,
		(display_get_gui_width() / 2) - (global.kareler_kenar_bosluklari / 2),
		display_get_gui_height() - global.kareler_kenar_bosluklari,
		true
	);
	
	draw_rectangle(
		global.konusma_baslangic_x - global.kareler_kenar_bosluklari,
		global.kareler_kenar_bosluklari,
		display_get_gui_width() - global.kareler_kenar_bosluklari,
		display_get_gui_height() - global.kareler_kenar_bosluklari,
		true
	);	
}

function metin_tane_tane_yazma() {
	if (chatterbox_duraklatildi) exit;
	if (chatterbox_gosterilen_karakter >= chatterbox_ayristirma.toplam_karakter) exit;

	var _onceki_karakter = floor(chatterbox_gosterilen_karakter);

	chatterbox_gosterilen_karakter += chatterbox_karakter_hizi;

	if (chatterbox_sonraki_pause_index < array_length(chatterbox_ayristirma.pause_konumlari)
	&& chatterbox_gosterilen_karakter >= chatterbox_ayristirma.pause_konumlari[chatterbox_sonraki_pause_index]) {
	    chatterbox_gosterilen_karakter = chatterbox_ayristirma.pause_konumlari[chatterbox_sonraki_pause_index];
	    chatterbox_duraklatildi = true;
	}

	if (chatterbox_gosterilen_karakter > chatterbox_ayristirma.toplam_karakter) {
	    chatterbox_gosterilen_karakter = chatterbox_ayristirma.toplam_karakter;
	}

	// --- Tık sesi ---
	var _yeni_karakter = min(floor(chatterbox_gosterilen_karakter), chatterbox_ayristirma.toplam_karakter);
	for (var _i = _onceki_karakter + 1; _i <= _yeni_karakter; _i++) {
	    var _harf = chatterbox_ayristirma.gorunur_karakterler[_i - 1];
	    if (_harf != " " && _harf != "\n" && _harf != chr(13)) {
			var konusma_ses = mus_konusma_1;
			switch (global.konusan) {
				case "tabula": 
					konusma_ses = mus_konusma_1;
					break;
					
				case "oyuncu": 
					konusma_ses = mus_konusma_2;
					break;
			}
	        if global.timer % 4 == 0 audio_play_sound(konusma_ses, 10, false);
	    }
	}
}

function chatterbox_metni_ayristir(_ham_metin) {
	var _temiz = "";
	var _pause_konumlari = [];
	var _karakter_konumlari = [0];
	var _gorunur_karakterler = [];
	var _index = 1;
	var _uzunluk = string_length(_ham_metin);
	var _gorunur_sayac = 0;

	while (_index <= _uzunluk) {
		var _karakter = string_char_at(_ham_metin, _index);

		if (_karakter == "[") {
			var _kapanis = string_pos_ext("]", _ham_metin, _index);

			if (_kapanis == 0) {
				_temiz += _karakter;
				_gorunur_sayac++;
				array_push(_karakter_konumlari, string_length(_temiz));
				array_push(_gorunur_karakterler, _karakter);
				_index++;
				continue;
			}

			var _tag_icerigi = string_copy(_ham_metin, _index + 1, _kapanis - _index - 1);

			if (string_lower(_tag_icerigi) == "pause") {
				array_push(_pause_konumlari, _gorunur_sayac);
			} else {
				_temiz += "[" + _tag_icerigi + "]";
			}

			_index = _kapanis + 1;
		} else {
			_temiz += _karakter;
			_gorunur_sayac++;
			array_push(_karakter_konumlari, string_length(_temiz));
			array_push(_gorunur_karakterler, _karakter);
			_index++;
		}
	}

	return {
		temiz_metin: _temiz,
		pause_konumlari: _pause_konumlari,
		karakter_konumlari: _karakter_konumlari,
		gorunur_karakterler: _gorunur_karakterler,
		toplam_karakter: _gorunur_sayac
	};
}

function konusma_degisimi_algilama() {
	var _su_anki_metin = ChatterboxGetContent(global.chatterbox_dosyasi, 0);

	if (_su_anki_metin != son_metin) {  
	    son_metin = _su_anki_metin;  
		global.chatterbox_verileri.tum_stringe_ekle(son_metin);
	}
	secenek_getir();
}

function hk(hikaye_kontrolu) {
	return global.chatterbox_verileri[$ hikaye_kontrolu];	
}

function hk_duzenle(hikaye_kontrolu, veri) {
	global.chatterbox_verileri[$ hikaye_kontrolu] = veri;
}

scribble_anim_shake(0.7, 2);

// --- YENİ: GUI koordinatını gerçek pencere/ekran koordinatına çeviren yardımcı fonksiyon ---
function gui_scissor_ayarla(_gui_x, _gui_y, _gui_genislik, _gui_yukseklik) {
	var _gui_w = display_get_gui_width();
	var _gui_h = display_get_gui_height();
	var _win_w = window_get_width();
	var _win_h = window_get_height();
	
	// "Keep Aspect Ratio" mantığıyla aynı ölçeği hesapla:
	// Genişliğe göre mi yüksekliğe göre mi sığdırılmış, küçük olan ölçek kullanılır
	var _olcek = min(_win_w / _gui_w, _win_h / _gui_h);
	
	// Letterbox nedeniyle oluşan kayma (siyah bantların genişliği)
	var _offset_x = (_win_w - (_gui_w * _olcek)) / 2;
	var _offset_y = (_win_h - (_gui_h * _olcek)) / 2;
	
	// GUI koordinatını gerçek pencere koordinatına çevir
	var _ekran_x = _offset_x + (_gui_x * _olcek);
	var _ekran_y = _offset_y + (_gui_y * _olcek);
	var _ekran_genislik = _gui_genislik * _olcek;
	var _ekran_yukseklik = _gui_yukseklik * _olcek;
	
	gpu_set_scissor(_ekran_x, _ekran_y, _ekran_genislik, _ekran_yukseklik);
}