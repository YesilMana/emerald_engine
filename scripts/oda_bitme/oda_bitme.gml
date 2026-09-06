function oda_bitme(){
	npc_oda_cikma();
	esya_konum_kaydetme();
	sira_sifirlama();
}

function sira_sifirlama() {
	global.sira[0] = 0;
	global.sira[1] = 0;
	global.sira[2] = 0;
	global.sira[3] = 0;
	global.sira[4] = 0;	
}

function npc_oda_cikma() {
	npc_konum_kaydetme();
}

function npc_konum_kaydetme() {
    var simdiki_oda = room_get_name(room);
    
    var oda_listi = global.takipci_konumlari_list[? simdiki_oda];
    
    if (is_undefined(oda_listi)) {
        oda_listi = ds_list_create(); 

        ds_map_add_list(global.takipci_konumlari_list, simdiki_oda, oda_listi);
    }
    
    ds_list_clear(oda_listi);
    
    with (all) {
        if (variable_instance_exists(id, "npc")) {
			if variable_instance_exists(id, "takip_ediliyor") && takip_ediliyor == true continue; 
            var temp_map = ds_map_create();
            
            var obje_ismi = object_get_name(object_index);
            var bulunan_oda = room_get_name(room);
            
            ds_map_add(temp_map, "npc_isim", obje_ismi);
            ds_map_add(temp_map, "npc_oda", bulunan_oda);
            ds_map_add(temp_map, "npc_konum_x", x);
            ds_map_add(temp_map, "npc_konum_y", y);
            
            if (variable_instance_exists(id, "ilk_x") && variable_instance_exists(id, "ilk_y")) {
                ds_map_add(temp_map, "ilk_x", ilk_x);
                ds_map_add(temp_map, "ilk_y", ilk_y);
            }
            
            ds_list_add(oda_listi, temp_map);
            ds_list_mark_as_map(oda_listi, ds_list_size(oda_listi) - 1);
        }
    }   
}

function npc_konum_kaydetme_ozel(hedef_obje_index, hedef_oda, yeni_x, yeni_y, kaybol = false, eski_oda = noone, dogurmak = false, oraya_isinla = false, her_odadan_sil = false) {
    // 1. Hedef odanın ismini al
    var hedef_oda_ismi = room_get_name(hedef_oda);
    
    // 2. Odaya ait listeyi al veya yoksa oluştur
    var oda_listi = global.takipci_konumlari_list[? hedef_oda_ismi];
    
    if (is_undefined(oda_listi)) {
        oda_listi = ds_list_create(); 
        ds_map_add_list(global.takipci_konumlari_list, hedef_oda_ismi, oda_listi);
    }
    
    // 3. Obje ismini string olarak al (Kaydedilecek kimlik)
    // Not: Buraya obje indeksi (örn: obj_koylu) girdiğini varsayıyorum.
    var kaydedilecek_isim = object_get_name(hedef_obje_index);
	
	if her_odadan_sil {
	    var oda_key = ds_map_find_first(global.takipci_konumlari_list);
	    var herhangi_bulundu = false;
    
	    while (!is_undefined(oda_key)) {
	        var tarama_listi = global.takipci_konumlari_list[? oda_key];
        
	        if (!is_undefined(tarama_listi)) {
	            for (var i = ds_list_size(tarama_listi) - 1; i >= 0; i--) {
	                var mevcut_map = tarama_listi[| i];
                
	                if (!is_undefined(mevcut_map) && mevcut_map[? "npc_isim"] == kaydedilecek_isim) {
	                    ds_list_delete(tarama_listi, i);
	                    herhangi_bulundu = true;
	                    show_debug_message(kaydedilecek_isim + " -> [" + oda_key + "] odasindan silindi.");
	                    // break yok, çünkü aynı odada birden fazla kayıt olabilir
	                }
	            }
	        }
        
	        oda_key = ds_map_find_next(global.takipci_konumlari_list, oda_key);
	    }
    
	    if (!herhangi_bulundu) {
	        show_debug_message(kaydedilecek_isim + " -> hicbir odada bulunamadi.");
	    }
	}
    
    // 4. Listeyi tara: Bu NPC daha önce bu odaya kaydedilmiş mi?
    var kayit_bulundu = false;
    
    for (var i = 0; i < ds_list_size(oda_listi); i++) {
        var mevcut_map = oda_listi[| i];
        
        // Eğer listedeki isim bizim kaydettiğimiz isimle aynıysa güncelle
        if (mevcut_map[? "npc_isim"] == kaydedilecek_isim) {
            mevcut_map[? "npc_oda"] = hedef_oda_ismi;
            mevcut_map[? "npc_konum_x"] = yeni_x;
            mevcut_map[? "npc_konum_y"] = yeni_y;
            kayit_bulundu = true;
            break; // Bulduk ve güncelledik, döngüden çık
        }
    }
	
	if room == hedef_oda && dogurmak {
		var dogur = instance_create_depth(yeni_x, yeni_y, 0, hedef_obje_index);
		dogur.npc = true;
	}
    
    // 5. Eğer listede yoksa, yeni bir kayıt oluşturup ekle
    if (!kayit_bulundu) {
        var temp_map = ds_map_create();
        
        ds_map_add(temp_map, "npc_isim", kaydedilecek_isim);
        ds_map_add(temp_map, "npc_oda", hedef_oda_ismi);
        ds_map_add(temp_map, "npc_konum_x", yeni_x);
        ds_map_add(temp_map, "npc_konum_y", yeni_y);
        
        // İsteğe bağlı: "ilk_x" gibi değerleri burada manuel eklemek zor olabilir,
        // çünkü "with" kullanmıyoruz. Gerekirse varsayılan değer atanabilir.
        
        ds_list_add(oda_listi, temp_map);
        ds_list_mark_as_map(oda_listi, ds_list_size(oda_listi) - 1);
    }
	
	if kaybol {
		if eski_oda != noone {
			var hedef_oda_ismi_1 = room_get_name(eski_oda);
    
			// 2. Odaya ait listeyi al veya yoksa oluştur
			var oda_listi_1 = global.takipci_konumlari_list[? hedef_oda_ismi_1];
			for (var i = 0; i < ds_list_size(oda_listi_1); i++) {
		        var mevcut_map = oda_listi_1[| i];
                
		        if (mevcut_map[? "npc_isim"] == kaydedilecek_isim) {
					ds_list_delete(oda_listi_1, i);
		            break; // Bulduk ve güncelledik, döngüden çık
		        }
		    }
		}
			instance_destroy(hedef_obje_index);
	}
	
	if eski_oda != noone && !her_odadan_sil {
		var hedef_oda_ismi_1 = room_get_name(eski_oda);
    
		// 2. Odaya ait listeyi al veya yoksa oluştur
		var oda_listi_1 = global.takipci_konumlari_list[? hedef_oda_ismi_1];
		for (var i = 0; i < ds_list_size(oda_listi_1); i++) {
	        var mevcut_map = oda_listi_1[| i];
            
	        if (mevcut_map[? "npc_isim"] == kaydedilecek_isim) {
				ds_list_delete(oda_listi_1, i);
	            break; // Bulduk ve güncelledik, döngüden çık
	        }
	    }
	}
	
	if oraya_isinla {
		hedef_obje_index.x = yeni_x;
		hedef_obje_index.y = yeni_y;
	}
}