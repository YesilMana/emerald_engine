function global_tanimlamalarim() {
	global.kareler_kenar_bosluklari = 20;
	global.secenekler_kismi_aciklik = 420;
	global.android = false;
	global.konusma_baslangic_x = (display_get_gui_width() / 1.4);
	global.kontrol_menusu_acik = false;
	global.sekme = 1;
	global.kontrol_menusu_sabit_y = 100;
	global.satir_atla = false;
	global.secenekler_aktif = false;
	global.maksimum_sekme = 3;
	global.sekme_sprite = [noone];
	global.sekme_image_index = [noone];
	for (var i = 0; i <= global.maksimum_sekme; i++) {
		global.sekme_sprite[i] = asset_get_index("spr_sekme_" + string(i));	
		global.sekme_image_index[i] = 0;	
	}
	global.sekme_konumlar = [
        [0, 0],
        [0, 0], 
        [0, 0], 
        [0, 0], 
        [0, 0], 
        [0, 0], 
        [0, 0],
        [0, 0], 
        [0, 0] 
    ];
	global.secenek_etiketleri = {};
	global.timer = 0;
	global.genel_dil = dil_dosyasi_yukle("language_turkish.json");
	global.genel_yazilar = global.genel_dil[$ "genel_yazilar"];
	global.saga_yatir = false;
	global.konusan = "tabula";
	global.tabula_cizim_scale = 1;
	global.tabula_cizim_renk = c_white;
	global.tabula_cizim_angle = 0;
	global.tabula_cizim_opaklik = 1;
	global.tabula_cizim_dusuk_opaklik = 0.4;
	global.tabula_cizim_opaklik_dusus_hiz = 0.04;
	global.tabula_cizim_scale_dusus_hiz = 0.04;
	global.tabula_cizim_scale_dusuk = 0.8;
}

function dil_dosyasi_yukle(_dosya_adi) {
    if (!file_exists(_dosya_adi)) {
        show_debug_message("HATA: Dil dosyası bulunamadı -> " + string(_dosya_adi));
        return {};
    }
    var _buffer = buffer_load(_dosya_adi);
    var _json_string = buffer_read(_buffer, buffer_string);
    buffer_delete(_buffer); 

    try {
        var _struct = json_parse(_json_string);
        return _struct;
    } 
    catch (_hata) {
        show_debug_message("JSON Okuma Hatası: " + string(_hata.message));
        return {};
    }
}

global_tanimlamalarim();