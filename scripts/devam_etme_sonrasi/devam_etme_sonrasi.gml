function devam_etme_sonrasi(){
	if global.devam_etme {
		global.cikolata.x = global.json_karakter_x;
		global.cikolata.y = global.json_karakter_y;	
		
		global.devam_etme = false;
	}
}

function esya_konum_yerlestirme() { //Her odanın başında çalışacak
	var oda_ismi = room_get_name(room);
	var oda_listi = global.esya_olusum_map[? oda_ismi];
	if oda_listi != undefined {
		for (var i = 0; i < ds_list_size(oda_listi); i++) {
			var referans = oda_listi[| i];
			var olusacak_id = asset_get_index(referans[? "obje_isim"]);
			var konum_x = referans[? "konum_x"];
			var konum_y = referans[? "konum_y"];
			var saglamlik = referans[? "saglamlik"];
			var mevcut_adet = referans[? "mevcut_adet"];
			var objem = instance_create_layer(konum_x, konum_y, "esyalar", olusacak_id);
			if saglamlik != undefined objem.saglamlik = saglamlik;
			if mevcut_adet != undefined objem.mevcut_adet = mevcut_adet;
			if !is_undefined(referans[? "faz"]) {
				objem.faz = referans[? "faz"];
			}
			else {
				objem.dinamik = true;
			}
		}
	}
}

function esya_konum_kaydetme() {
    var oda_ismi = room_get_name(room);
    var oda_listi = global.esya_olusum_map[? oda_ismi];
    
    // --- DÜZELTME BURADA ---
    // Eğer bu oda için henüz bir liste oluşturulmamışsa:
    if (is_undefined(oda_listi)) {
        oda_listi = ds_list_create(); // Yeni liste oluştur
        
        // Bu listeyi ana map'e "LISTE" olarak ekle.
        // (ds_map_add kullanırsan sadece ID ekler, JSON bozulur)
        ds_map_add_list(global.esya_olusum_map, oda_ismi, oda_listi);
    }
    
    // Artık oda_listi'nin var olduğundan %100 eminiz, temizleyebiliriz.
    ds_list_clear(oda_listi);
    // -----------------------
    
    with (all) {
        // "dinamik" değişkeni varsa kaydet
        if variable_instance_exists(id, "dinamik") || variable_instance_exists(id, "faz") {
            // HER SEFERINDE YENİ MAP OLUŞTUR!
            var temp_map = ds_map_create();
            
            // object_get_name object_index alır, id değil
            ds_map_add(temp_map, "obje_isim", object_get_name(object_index));
            ds_map_add(temp_map, "oda_isim", room_get_name(room));
            ds_map_add(temp_map, "konum_x", x);
            ds_map_add(temp_map, "konum_y", y);
            
            var sag_1 = 100;
            if (variable_instance_exists(id, "saglamlik")) {
                sag_1 = saglamlik;
            }
            ds_map_add(temp_map, "saglamlik", sag_1);
            
            var mevcut_1 = 1;
            if (variable_instance_exists(id, "mevcut_adet")) {
                mevcut_1 = mevcut_adet;
            }
			
			
            ds_map_add(temp_map, "mevcut_adet", mevcut_1);
			
            if variable_instance_exists(id, "faz") {
				var fazim = faz;
				ds_map_add(temp_map, "faz", fazim);
			}
            // Yeni map'i listeye ekle
            ds_list_add(oda_listi, temp_map);
            
            // Map olarak işaretle (önemli!)
            ds_list_mark_as_map(oda_listi, ds_list_size(oda_listi) - 1);
        }
    }
}