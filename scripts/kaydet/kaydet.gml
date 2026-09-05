function kaydet(){
	craft_menu_yenile();
	ini_kaydet();
	havayi_kaydet();
	saat_kaydet();
	konum_ve_oda_kaydet();
	stat_kaydet();
	efekt_kaydet();
	takipci_kaydet();
	npc_konum_kaydetme();
	esya_konum_kaydetme();
	gorev_kaydet();
	icerik_kaydet();
	craft_menu_kaydet();
	envanter_kaydet("kullanici.json", "user_cache.buf");
	global.ini_3 += 1;
	ini_open("settings.ini");
	ini_write_real("ayarlar", "ini_3", global.ini_3);
	ini_close();
	kayit_noktasi_kopyala("kullanici.json", "oyuncu_kayit_" + string(global.ini_3) + ".json"); //kayıt noktası oluşturur
	bilgi_ver(global.genel_yazilar[167] + ":");
	bilgi_ver(string(global.ini_3) + " " + global.genel_yazilar[233]);
	
}

function ini_kaydet() {
	ini_open("settings.ini");
	ini_write_real("ayarlar", "sifirla_" + string(global.sifirlama_sayisi), 0);
	ini_write_real("ayarlar", "ses_seviyesi", global.ses_seviyesi);
	ini_write_real("ayarlar", "muzik_seviyesi", global.muzik_seviyesi);
	ini_write_real("ayarlar", "tablet_modu", global.tablet_modu);
	ini_write_real("ayarlar", "demo", global.demo);

	for (var i = 1; i < global.toplam_ini_okuma; i++) {
		ini_write_real("ayarlar", "ini_" + string(i), variable_global_get("ini_" + string(i)));
	}
	for (var i = 1; i < 100; i++) {
		ini_write_real("ayarlar", "hikaye_aktiflik_" + string(i), variable_global_get("hikaye_aktiflik_" + string(i)));
	}
	
	ini_close();	
}

function takipci_kaydet() {
	var liste_uzunluk = ds_list_size(global.takipciler_list);
	for (var i = 0; i < liste_uzunluk; i++) {
		var json_icerik = global.envanter_json_1[? "takipciler"];
		json_icerik[| i] = global.takipciler_list[| i];
	}
}

function efekt_kaydet() {
	var efektlerim_1 = global.envanter_json_1[? "efektler"];
	var efekt_timerim_1 = efektlerim_1[? "sayac"];
	var efekt_etkim_1 = efektlerim_1[? "etki"];
	
	for (var i = 0; i < 10; i++) {
		efekt_timerim_1[| i] = global.efekt_timer[i];
		efekt_etkim_1[| i] = global.aktif_efektler[i];
	}
}

function konum_ve_oda_kaydet() {
	if instance_exists(global.cikolata) {
		global.karakter_bilgileri[? "konum_x"] = global.cikolata.x;	
		global.karakter_bilgileri[? "konum_y"] = global.cikolata.y;	
		global.karakter_bilgileri[? "oda_isim"] = room_get_name(room);	
	}
}

function havayi_kaydet() {
	global.hikaye_kontrolleri_11 = global.hava_durumu;
	var referans = obj_shader_android;
	global.hava_gorunum[? "color_tint_1"] = referans.color_tint[0];
	global.hava_gorunum[? "color_tint_2"] = referans.color_tint[1];
	global.hava_gorunum[? "color_tint_3"] = referans.color_tint[2];
	global.hava_gorunum[? "tint_strength"] = referans.tint_strength;
	global.hava_gorunum[? "contrast"] = referans.contrast;
	global.hava_gorunum[? "saturation"] = referans.saturation;
}

function stat_kaydet() {
	var kalori_1 = global.envanter_json_1[? "stats"];
	kalori_1[? "kalori"] = global.kalori;
	kalori_1[? "su"] = global.su;
	kalori_1[? "can"] = global.can;
	kalori_1[? "sicaklik"] = global.sicaklik;
}


function envanter_kaydet(json_dosyasi_ismi, buffer_ismi) {
    var json_str = json_encode(global.envanter_json_1);
    var f = file_text_open_write(json_dosyasi_ismi);
    file_text_write_string(f, json_str);
    file_text_close(f);
    
    var buffer_file = buffer_ismi;
    var buff = buffer_create(string_byte_length(json_str) + 1, buffer_fixed, 1);
    buffer_write(buff, buffer_string, json_str);
    buffer_save(buff, buffer_file);
    buffer_delete(buff);
    
    show_debug_message("User data saved (JSON + Buffer)");
}

function icerik_kaydet() {
    var icerik = global.envanter_json_1[? "oyun_ici_degiskenler"];
    
    icerik[? "cikolata_spritesi"] = global.cikolata_spritesi; //Burada özel olarak bir kayıt oluşturmak istersen yaz
	
	ds_map_add_map(icerik, "kayit_turuncusu", global.kayit_turuncusu);
	
    var size_karakter = ds_map_size(global.karakter_gitme_map);
    for (var i = 1; i <= size_karakter; i++) {
        var global_degisken_adi = "karakter_gitme_" + string(i);
        var map_anahtar_adi = string(i); 
        global.karakter_gitme_map[? map_anahtar_adi] = variable_global_get(global_degisken_adi);
    }
    ds_map_add_map(icerik, "karakter_gitme_map", global.karakter_gitme_map);

    var size_hikaye = ds_map_size(global.hikaye_kontrolleri_map);
    for (var i = 1; i <= size_hikaye; i++) {
        var global_degisken_adi = "hikaye_kontrolleri_" + string(i);
        var map_anahtar_adi = string(i);
        global.hikaye_kontrolleri_map[? map_anahtar_adi] = variable_global_get(global_degisken_adi);
    }
    ds_map_add_map(icerik, "hikaye_kontrolleri_map", global.hikaye_kontrolleri_map);
}

function craft_menu_kaydet() {
    var json_str = json_encode(global.envanter_craft_bilgi);
    var f = file_text_open_write("craft_" + global.dil + ".json");
    file_text_write_string(f, json_str);
    file_text_close(f);
    
  
    var buffer_file = "craft_cache_" + global.dil + ".buf";
    var buff = buffer_create(string_byte_length(json_str) + 1, buffer_fixed, 1);
    buffer_write(buff, buffer_string, json_str);
    buffer_save(buff, buffer_file);
    buffer_delete(buff);
    
    show_debug_message("Craft data saved (JSON + Buffer)");
}

function saat_kaydet() {
	var saat_json = global.envanter_json_1[? "saatler"];
	saat_json[? "saat"] = global.saat;
	saat_json[? "dakika"] = global.dakika;
}