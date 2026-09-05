function json_okuma_buffered() {
    randomize();
    
    if (global.sifirla) {
	    var dosya = file_find_first("*.*", 0);
	    while (dosya != "") {
	        dosya_sil(dosya);
	        dosya = file_find_next();
	    }
	    file_find_close();
	    ini_open("settings.ini");
	    ini_write_real("ayarlar", "sifirla_" + string(global.sifirlama_sayisi), 0);
	    ini_close();
	}
	
	dosya_sil("craft_" + global.dil + ".json");
	dosya_sil("craft_cache_" + global.dil + ".buf");
    
    var craft_cache_file = "craft_cache_" + global.dil + ".buf";
    var craft_json_file = "craft_" + global.dil + ".json";
    
    if (!file_exists(craft_cache_file)) {
        create_buffer_cache(craft_json_file, craft_cache_file);
    }
    
    var buff = buffer_load(craft_cache_file);
    buffer_seek(buff, buffer_seek_start, 0);
    var json_str = buffer_read(buff, buffer_string);
    global.envanter_craft_bilgi = json_decode(json_str);
    buffer_delete(buff);
    
    global.item_names = global.envanter_craft_bilgi[? "item_names"];
    global.craft_bilgi = global.envanter_craft_bilgi[? "craft_bilgi"];
    global.kaloriler = global.envanter_craft_bilgi[? "kalori_miktari"];
    global.sular = global.envanter_craft_bilgi[? "su_miktari"];
    global.stat_bilgilendirme = global.envanter_craft_bilgi[? "stat_baslik"];
    global.stat_listesi = global.envanter_craft_bilgi[? "stat_bilgi"];
    global.envanter_son_oge = ds_map_size(global.item_names);
	global.craft_son_oge = ds_map_size(global.craft_bilgi);
    global.envanter_bilgilendirme = global.envanter_craft_bilgi[? "envanter_bilgilendirme"];
    global.envanter_kullanim_yazilar = global.envanter_craft_bilgi[? "envanter_kullanim_yazilar"];
	global.gorev_json = global.envanter_craft_bilgi[? "gorev_tanimlamalari"];
	global.yurume_map = global.envanter_craft_bilgi[? "yurume_map"];
	yurume_verisini_arraye_cevir();

	global.hayvanlar_tumu = global.envanter_craft_bilgi[? "hayvanlar"];
	global.hayvanlar_bellek = ds_list_create();


	if (!is_undefined(global.hayvanlar_tumu)) {
    
	    var siradaki_hayvan_ismi = ds_map_find_first(global.hayvanlar_tumu);
    
	    for (var i = 0; i < ds_map_size(global.hayvanlar_tumu); i++) {
	        ds_list_add(global.hayvanlar_bellek, siradaki_hayvan_ismi);
	        hayvanlar_bellek_yukleme(siradaki_hayvan_ismi);
	        siradaki_hayvan_ismi = ds_map_find_next(global.hayvanlar_tumu, siradaki_hayvan_ismi);
	    }
	}
	
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
    var giris_2 = global.envanter_craft_bilgi[? "esya_oznitelikler"];
    var giris_3 = giris_2[? "yuzdeye_gore_degisen_basliklar"];
    
    var giris_4 = giris_2[? "esya_siniflari"];
    global.siniflandirma_yakacak_1 = giris_4[? "yanacaklar"];
    global.siniflandirma_kibrit_1 = giris_4[? "yakacaklar"];
    global.siniflandirma_yiyecek = giris_4[? "yiyecekler"];
    global.siniflandirma_esyalar = giris_4[? "esyalar"];
	global.siniflandirma_silahlar = giris_4[? "silahlar"];
	global.siniflandirma_atilamazlar = giris_4[? "atilamazlar"];
    global.referans_map = ds_map_create();
    global.siniflandirma_yakacak = ds_list_create();
    global.siniflandirma_kibrit = ds_list_create();
    global.esya_bilgilendirme_metinleri = [];
    global.hava_durum_degerleri = global.envanter_craft_bilgi[? "hava_durumlari"];
    global.efektlerim = global.envanter_craft_bilgi[? "efekt_bilgiler"];
    global.efekt_isimler = global.efektlerim[? "isimler"];
	
    global.esyalar_saglamlik = giris_3[? "esyalar"];
    global.craft_edilebilir_mi = [];
    global.craft_index = ds_list_create();
	

    
    for (var i = 0; i < global.envanter_son_oge; i++) {
		
        global.esya_bilgilendirme_metinleri[i] = "";
        if (global.envanter_bilgilendirme[? "esya_" + string(i)] != undefined) {
            global.esya_bilgilendirme_metinleri[i] += global.envanter_bilgilendirme[? "esya_" + string(i)];
        }
        
        if (global.kaloriler[? "esya_" + string(i)] != undefined) {
            if (global.esya_bilgilendirme_metinleri[i] != "") global.esya_bilgilendirme_metinleri[i] += "\n";
            global.esya_bilgilendirme_metinleri[i] += global.genel_yazilar[49] + ": " + string(global.kaloriler[? "esya_" + string(i)] * 20) + " " + global.genel_yazilar[36];
        }
        
        if (global.sular[? "esya_" + string(i)] != undefined) {
            if (global.esya_bilgilendirme_metinleri[i] != "") global.esya_bilgilendirme_metinleri[i] += "\n";
            global.esya_bilgilendirme_metinleri[i] += global.genel_yazilar[50] + ": " + string(global.sular[? "esya_" + string(i)] * 20) + " " + global.genel_yazilar[35];
        }
        
        var arama = ds_map_find_value(global.siniflandirma_yakacak_1, "esya_" + string(i));
        if (arama != undefined) {
            ds_list_add(global.siniflandirma_yakacak, "esya_" + string(i));
        }
        
        var arama_1 = ds_map_find_value(global.siniflandirma_yakacak_1, "son_oge");
        if (arama_1 != undefined) {
            global.ates_yakacak_son = arama_1;
        }
        
        var arama_1 = ds_map_find_value(global.siniflandirma_kibrit_1, "son_oge");
        if (arama_1 != undefined) {
            global.ates_kibrit_son = arama_1;
        }
        
        var arama = ds_map_find_value(global.siniflandirma_kibrit_1, "esya_" + string(i));
        if (arama != undefined) {
            ds_list_add(global.siniflandirma_kibrit, "esya_" + string(i));
        }
	}
    
    var user_cache_file = "user_cache.buf";
    var user_json_file = "kullanici.json";
    
    if (!file_exists(user_cache_file)) {
        create_buffer_cache(user_json_file, user_cache_file);
    }
  
    var buff = buffer_load(user_cache_file);
    buffer_seek(buff, buffer_seek_start, 0);
    var json_str = buffer_read(buff, buffer_string);
    global.envanter_json_1 = json_decode(json_str);
    buffer_delete(buff);
    
	guncelleme_yap();
	
	global.takipci_konumlari_map = global.envanter_json_1[? "npc_konumlari_json"];
	
	global.takipci_konumlari_list = global.takipci_konumlari_map[? "npc_konumlari"];
	global.takipci_konumlari_rastgele = global.takipci_konumlari_map[? "rastgele_olusma"];
	global.sandiklar_tumu = global.envanter_json_1[? "sandiklar_json"];
    global.envanter_json = global.envanter_json_1[? "envanter_temel"];
    global.envanter_list = global.envanter_json[? "envanter"];
    global.envanter_kapasite = global.envanter_json[? "kapasite"];
	global.aktif_gorevler = global.envanter_json_1[? "gorevler"];
	global.oyun_ici_veriler = global.envanter_json_1[? "oyun_ici_degiskenler"];
	global.craft_edilme_kontrol = global.envanter_json_1[? "craftlanma_degeri"];
    
    var kalori_1 = global.envanter_json_1[? "stats"];
    global.kalori = kalori_1[? "kalori"];
    global.su = kalori_1[? "su"];
    global.can = kalori_1[? "can"];
    global.sicaklik = kalori_1[? "sicaklik"];
    global.yorgunluk = kalori_1[? "yorgunluk"];
    global.karakter_kontrol_sayisi = kalori_1[? "toplam"];
    global.karakter_bilgileri = global.envanter_json_1[? "karakter_bilgiler"];
	global.atilma_hizi = global.karakter_bilgileri[? "atilma_hizi"];
    global.json_karakter_x = global.karakter_bilgileri[? "konum_x"];
    global.json_karakter_y = global.karakter_bilgileri[? "konum_y"];
    global.json_oda_isim = asset_get_index(global.karakter_bilgileri[? "oda_isim"]);
    
    global.craft_gerekenler_id = [];
    global.craft_gerekenler_adet = [];
    global.eksik_esyalar = [];
    global.gereken_esyalar_bulunabilirlik = [];
    global.ates_yakacaklar = [];
    global.devam_etme = false;
    global.esya_olusum_map = global.envanter_json_1[? "esya_konumlari"];
    global.takipciler_list = global.envanter_json_1[? "takipciler"];
    global.takipci_global_isimleri = ds_map_create();
    global.ates_kibritler = [];
    
    var patik_1 = global.envanter_json_1[? "ates_yakim"];
    global.ates_map = patik_1[? "atesler"];
    global.son_ates = patik_1[? "son_ates"];
    global.hava_gorunum = global.envanter_json_1[? "hava_gorunum"];
    global.shader_1 = global.hava_gorunum[? "color_tint_1"];
    global.shader_2 = global.hava_gorunum[? "color_tint_2"];
    global.shader_3 = global.hava_gorunum[? "color_tint_3"];
    global.shader_4 = global.hava_gorunum[? "tint_strength"];
    global.shader_5 = global.hava_gorunum[? "contrast"];
    global.shader_6 = global.hava_gorunum[? "saturation"];
    
    var efektlerim_1 = global.envanter_json_1[? "efektler"];
    global.efekt_timerim = efektlerim_1[? "sayac"];
    global.efekt_etkim = efektlerim_1[? "etki"];
	global.toplam_efektler = 16;
    for (var i = 0; i < global.toplam_efektler; i++) {
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
	
    global.eklenen_karakterler = ds_list_create();	
	ds_list_add(global.eklenen_karakterler, global.semih_animasyon);
	ds_list_add(global.eklenen_karakterler, global.sati_animasyon);
	ds_list_add(global.eklenen_karakterler, global.kadir_animasyon);
	ds_list_add(global.eklenen_karakterler, global.cikolata_animasyon);
	
	for (var i = 0; i < global.envanter_son_oge; i++) {
        global.craft_edilebilir_mi[i] = 0;
        var key = "esya_" + string(i);
        var malzemeler = global.craft_edilme_kontrol[? key];
        var craft_bilgisi = global.craft_bilgi[? key];
        
        if (craft_bilgisi != undefined) {
            var sinif = craft_bilgisi[? "siniflama"];
            
            if (malzemeler == 1) {
                if (sinif != undefined && sinif != -1) {
                    for (var g = 0; g < ds_list_size(sinif); g++) {
                        if (variable_global_exists("s_" + string(sinif[| g]))) {
                            var key_5 = variable_global_get("s_" + string(sinif[| g]));
                            var key_tumu = variable_global_get("s_" + "1");
                            ds_list_add(key_5, key);
                            if (ds_list_find_index(key_tumu, key) == -1) {
                                ds_list_add(key_tumu, key);
                            }
                        }
                    }
                }
                ds_list_add(global.craft_index, key);
            }
        }
    }
}

function create_buffer_cache(json_file, buffer_file) {
    
    var file = file_text_open_read(json_file);
    var json_str = "";
    while (!file_text_eof(file)) {
        json_str += file_text_readln(file);
    }
    file_text_close(file);
    
    // JSON'u decode et
    var data_map = json_decode(json_str);
    
    // ds_map'i tekrar JSON string'e çevir (ama bu sefer encode edilmiş halde)
    var json_encoded = json_encode(data_map);
    
    // Buffer oluştur ve string'i yaz
    var buff = buffer_create(string_byte_length(json_encoded) + 1, buffer_fixed, 1);
    buffer_write(buff, buffer_string, json_encoded);
    
    // Buffer'ı kaydet
    buffer_save(buff, buffer_file);
    buffer_delete(buff);
    
    // Belleği temizle
    ds_map_destroy(data_map);
}

function envanter_yapiyi_duzelt() {
    // Eski map'i kontrol et
    if (ds_exists(global.envanter_json_1, ds_type_map)) {
        var esya_konumlari = global.envanter_json_1[? "esya_konumlari"];
        
        if (ds_exists(esya_konumlari, ds_type_map)) {
            // Her oda için kontrol
            var key = ds_map_find_first(esya_konumlari);
            
            repeat(ds_map_size(esya_konumlari)) {
                var value = esya_konumlari[? key];
                
                // Eğer list değilse, yenisini oluştur
                if (!ds_exists(value, ds_type_list)) {
                    
                    // Yeni bir list oluştur
                    var yeni_list = ds_list_create();
                    esya_konumlari[? key] = yeni_list;
                }
                
                key = ds_map_find_next(esya_konumlari, key);
            }
        }
    }
}


function yurume_verisini_arraye_cevir() {
    if (!variable_global_exists("yurume_map") || is_undefined(global.yurume_map)) return;

    var _map = global.yurume_map;
    var _key = ds_map_find_first(_map);

    while (!is_undefined(_key)) {
        var _yol_listesi = _map[? _key]; // Örn: "1" numaralı yolun listesi
        
        if (ds_exists(_yol_listesi, ds_type_list)) {
            var _size = ds_list_size(_yol_listesi);
            
            for (var i = 0; i < _size; i++) {
                var _koordinat_list_id = _yol_listesi[| i]; 
                
                if (ds_exists(_koordinat_list_id, ds_type_list)) {
                    var _xx = _koordinat_list_id[| 0];
                    var _yy = _koordinat_list_id[| 1];
                    
                    if ds_list_size(_koordinat_list_id) == 2 var _yeni_array = [_xx, _yy];
                    if ds_list_size(_koordinat_list_id) == 3 var _yeni_array = [_xx, _yy, _koordinat_list_id[| 2]];

                    ds_list_destroy(_koordinat_list_id);
                    
                    _yol_listesi[| i] = _yeni_array;
                }
            }
        }
        _key = ds_map_find_next(_map, _key);
    }
}