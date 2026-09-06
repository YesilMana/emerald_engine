function json_okuma() {
	randomize();
	if global.sifirla {
		dosya_sil("kullanici.json");
		dosya_sil("craft_" + global.dil + ".json");
	}
	var file = file_text_open_read("craft_" + global.dil + ".json"); //global.dil yerine istenilen dil ingilizce küçük harfle yazılabilir -0-

	var craft_json = "";
	while (!file_text_eof(file)) {
	    craft_json += file_text_readln(file);
	}
	file_text_close(file);

	// JSON'u çöz -> ds_map oluşturur
	global.envanter_craft_bilgi = json_decode(craft_json);

	// İçindeki "item_names" ve "craft_bilgi" ayrı ayrı çekelim
	global.item_names  = global.envanter_craft_bilgi[? "item_names"];
	global.craft_bilgi = global.envanter_craft_bilgi[? "craft_bilgi"];
	global.kaloriler = global.envanter_craft_bilgi[? "kalori_miktari"];
	global.sular = global.envanter_craft_bilgi[? "su_miktari"];
	global.stat_bilgilendirme = global.envanter_craft_bilgi[? "stat_baslik"];
	global.stat_listesi = global.envanter_craft_bilgi[? "stat_bilgi"];
	global.envanter_son_oge = global.envanter_craft_bilgi[? "envanter_son_oge"];
	global.envanter_bilgilendirme = global.envanter_craft_bilgi[? "envanter_bilgilendirme"];
	global.s_1 = ds_list_create();
	ds_list_add(global.s_1, 0);
	global.s_2 = ds_list_create();
	ds_list_add(global.s_2, 0);
	global.s_3 = ds_list_create();
	ds_list_add(global.s_3, 0);
	global.s_4 = ds_list_create();
	ds_list_add(global.s_4, 0);
	global.s_5 = ds_list_create();
	ds_list_add(global.s_5, 0);
	global.s_6 = ds_list_create();
	ds_list_add(global.s_6, 0);
	global.s_7 = ds_list_create();
	ds_list_add(global.s_7, 0);
	var giris_1 = global.envanter_craft_bilgi[? "esya_oznitelikler"];
	global.craft_edilme_kontrol = giris_1[? "craftlanma_degeri"];
	var giris_2 = global.envanter_craft_bilgi[? "esya_oznitelikler"];
	var giris_3 = giris_2[? "yuzdeye_gore_degisen_basliklar"];
	
	var giris_4 = giris_2[? "esya_siniflari"];
	global.siniflandirma_yakacak_1 = giris_4[? "yanacaklar"];
	global.siniflandirma_kibrit_1 = giris_4[? "yakacaklar"];
	global.siniflandirma_yiyecek = giris_4[? "yiyecekler"];
	global.siniflandirma_esyalar = giris_4[? "esyalar"];
	global.referans_map = ds_map_create();
	global.siniflandirma_yakacak = ds_list_create();
	global.siniflandirma_kibrit = ds_list_create();
	global.esya_bilgilendirme_metinleri = [];
	global.hava_durum_degerleri = global.envanter_craft_bilgi[? "hava_durumlari"];
	global.efektlerim = global.envanter_craft_bilgi[? "efekt_bilgiler"];
	global.efekt_isimler = global.efektlerim[? "isimler"];
	
	
	
	global.esyalar_saglamlik = giris_3[? "esyalar"];
	global.craft_edilebilir_mi = [];
	global.craft_index = ds_list_create(); //Oyunda craftlanabilir tüm itemleri buluyor
	for (var i = 0; i < global.envanter_son_oge; i++) {
		global.esya_bilgilendirme_metinleri[i] = "";
		if global.envanter_bilgilendirme[? "esya_" + string(i)] != undefined {
			global.esya_bilgilendirme_metinleri[i] += global.envanter_bilgilendirme[? "esya_" + string(i)];
		}
		
		if global.kaloriler[? "esya_" + string(i)] != undefined {
			if global.esya_bilgilendirme_metinleri[i] != "" global.esya_bilgilendirme_metinleri[i] += "\n";
			global.esya_bilgilendirme_metinleri[i] += global.genel_yazilar[49] + ": " + string(global.kaloriler[? "esya_" + string(i)] * 20) + " " + global.genel_yazilar[36];
		}
		
		if global.sular[? "esya_" + string(i)] != undefined {
			if global.esya_bilgilendirme_metinleri[i] != "" global.esya_bilgilendirme_metinleri[i] += "\n";
			global.esya_bilgilendirme_metinleri[i] += global.genel_yazilar[50] + ": " + string(global.sular[? "esya_" + string(i)] * 20) + " " + global.genel_yazilar[35];
		}
		
		var arama = ds_map_find_value(global.siniflandirma_yakacak_1, "esya_" + string(i));
		if arama != undefined {
			ds_list_add(global.siniflandirma_yakacak, "esya_" + string(i));
		}
		
		var arama_1 = ds_map_find_value(global.siniflandirma_yakacak_1, "son_oge");
		if arama_1 != undefined {
			global.ates_yakacak_son = arama_1;
		}
		
		var arama_1 = ds_map_find_value(global.siniflandirma_kibrit_1, "son_oge");
		if arama_1 != undefined {
			global.ates_kibrit_son = arama_1;
		}
		
		var arama = ds_map_find_value(global.siniflandirma_kibrit_1, "esya_" + string(i));
		if arama != undefined {
			ds_list_add(global.siniflandirma_kibrit, "esya_" + string(i));
		}
		
		
		
		global.craft_edilebilir_mi[i] = 0;
	    var key = "esya_" + string(i);
	    var malzemeler = global.craft_edilme_kontrol[? key];
		var craft_bilgisi = global.craft_bilgi[? key];
		

	    if (craft_bilgisi != undefined) {
			var sinif = craft_bilgisi[? "siniflama"];
	        if (malzemeler == 1) {
				if sinif != undefined && sinif != -1 {
					for (var g = 0; g < ds_list_size(sinif); g++) {
						if variable_global_exists("s_" + string(sinif[| g])) {
							var key_5 = variable_global_get("s_" + string(sinif[| g]));
							var key_tumu = variable_global_get("s_" + "1");
							ds_list_add(key_5, key);
							if ds_list_find_index(key_tumu, key) == -1 {
								ds_list_add(key_tumu, key);
							}
						}
					}
				}
	            ds_list_add(global.craft_index, key);  
	        } 
	    }
	}
	
	var file = file_text_open_read("kullanici.json");
	var str = "";
	while (!file_text_eof(file)) {    // dosya sonuna kadar oku
	    str += file_text_readln(file);
	}
	file_text_close(file);
	
	
	// JSON'u decode et. Beklenen yapı genelde bir ds_map olup içinde "envanter" anahtarı bir ds_list tutar.
	global.envanter_json_1 = json_decode(str); // ds_map örneği: { "envanter": [ {...}, {...} ] }
	global.envanter_json = global.envanter_json_1[? "envanter_temel"];
	global.envanter_list = global.envanter_json[? "envanter"]; // ds_list (slotların listesi)
	global.envanter_kapasite = global.envanter_json[? "kapasite"];
	var kalori_1 = global.envanter_json_1[? "stats"];
	global.kalori = kalori_1[? "kalori"];
	global.su = kalori_1[? "su"];
	global.can = kalori_1[? "can"];
	global.sicaklik = kalori_1[? "sicaklik"];
	global.yorgunluk = kalori_1[? "yorgunluk"];
	global.karakter_kontrol_sayisi = kalori_1[? "toplam"];
	global.karakter_bilgileri = global.envanter_json_1[? "karakter_bilgiler"];
	global.json_karakter_x = global.karakter_bilgileri[? "konum_x"];
	global.json_karakter_y = global.karakter_bilgileri[? "konum_y"];
	global.json_oda_isim = asset_get_index(global.karakter_bilgileri[? "oda_isim"]);
	global.craft_gerekenler_id = [];  
	global.craft_gerekenler_adet = [];
	global.eksik_esyalar = [];
	global.gereken_esyalar_bulunabilirlik = [];
	global.ates_yakacaklar = [];
	global.devam_etme = false;
	global.esya_olusum_map= global.envanter_json_1[? "esya_konumlari"];
	global.takipciler_list = global.envanter_json_1[? "takipciler"];
	global.takipci_global_isimleri = ds_map_create();
	global.ates_kibritler = [];
	var patik_1 = global.envanter_json_1[? "ates_yakim"];
	global.ates_map = patik_1[? "atesler"];
	global.hava_gorunum = global.envanter_json_1[? "hava_gorunum"];
	global.shader_1 = global.hava_gorunum[? "color_tint_1"];
	global.shader_2 = global.hava_gorunum[? "color_tint_2"];
	global.shader_3 = global.hava_gorunum[? "color_tint_3"];
	global.shader_4 = global.hava_gorunum[? "tint_strength"];
	global.shader_5 = global.hava_gorunum[? "contrast"];
	global.shader_6 = global.hava_gorunum[? "saturation" ];
	var efektlerim_1 = global.envanter_json_1[? "efektler"];
	global.efekt_timerim = efektlerim_1[? "sayac"];
	global.efekt_etkim = efektlerim_1[? "etki"];
	for (var i = 0; i < 16; i++) {
		global.efekt_timer[i] = global.efekt_timerim[| i];
		global.aktif_efektler[i] = global.efekt_etkim[| i];
	}
	
	
	var saat_json = global.envanter_json_1[? "saatler"];
	global.saat = saat_json[? "saat"];
	global.dakika = saat_json[? "dakika"];


	
	for (var i = 1; i <= global.karakter_kontrol_sayisi; i++) {
		variable_global_set("stat_list_" + string(i), global.stat_listesi[? "stat_" + string(i)]);
		variable_global_set("stat_degisim_kontrol_" + string(i), 0);
	}
  

}

function dosya_sil(isim) {
	var path = isim;
	var full_path = working_directory + "/" + path;

	if (file_exists(full_path)) {
	    file_delete(full_path);
	    show_debug_message("Yerel dosya silindi: " + full_path);
	}		
}

/*
	Envanteri, ateşi kaydeder
*/


function hangisi_gerekli(sayi) {
    var malzemeler = global.envanter_craft_bilgi[? "esya_" + string(sayi)];
    
    var item_name = global.item_names[? "esya_" + string(sayi)]; 
    
    var msg = item_name + " için gereken malzemeler:\n";
    
    var key = ds_map_find_first(malzemeler);
    

    while (key != undefined) {
        var miktar = malzemeler[? key];
        var malzeme_ismi = global.item_names[? key];
        msg += malzeme_ismi + " => " + string(miktar) + "\n";
        key = ds_map_find_next(malzemeler, key);
    }
}
