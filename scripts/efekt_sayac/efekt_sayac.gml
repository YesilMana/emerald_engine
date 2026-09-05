function efekt_sayac(){
	efekt_uygula();
	for (var i = 0; i < array_length(global.aktif_efektler); i++) {
		if global.efekt_timer[i] > 0 && !zaman_dur {
			if (global.timer % room_speed) == 0 {
				global.efekt_timer[i] -= 1;	
			}
		}
	}
}

function esya_yere_birak(envanter_id) {
	var slot = global.envanter_list[| envanter_id];
	if slot[? "esya"] != -1 {
		var esya_isim = slot[? "esya"];
		var esya_kodu = kodunu_al(esya_isim);
		var saglamlik = slot[? "saglamlik"];
		var mevcut_adet = slot[? "adet"];
		var konum_x = global.cikolata.x;
		var konum_y = global.cikolata.y;
		var olusacak_id = asset_get_index("obj_bulunan_" + esya_isim)
	
		var objem = instance_create_layer(konum_x, konum_y, "esyalar", olusacak_id);
		if saglamlik != undefined objem.saglamlik = saglamlik;
		if mevcut_adet != undefined {
			objem.mevcut_adet = mevcut_adet;
			slot[? "adet"] -= mevcut_adet;
		}
		else {
			slot[? "adet"] -= 1;	
		}
		objem.dinamik = true;
	
	
		if slot[? "adet"] <= 0 {
			slot[? "esya"] = -1;
		}	
	}
}



function esya_yere_at(envanter_id) {
	var slot = global.ele_alinan_slot;
		var esya_isim = "esya_" + string(global.ele_alinan_id);
		var esya_kodu = envanter_id;
		var saglamlik = global.ele_alinan_saglamlik;
		var mevcut_adet = global.ele_alinan_adet;
		var atma_tolerans = 20;
		var konum_x = global.cikolata.x + random_range(-atma_tolerans, atma_tolerans);
		var konum_y = global.cikolata.y + random_range(-atma_tolerans, atma_tolerans);
		var olusacak_id = asset_get_index("obj_bulunan_" + esya_isim)
	
		var objem = instance_create_layer(konum_x, konum_y, "esyalar", olusacak_id);
		if saglamlik != undefined objem.saglamlik = saglamlik;
		if mevcut_adet != undefined {
			objem.mevcut_adet = mevcut_adet;
		}
		objem.dinamik = true;
		global.ele_alindi = false;
		if mevcut_adet == undefined mevcut_adet = 1; 
		esya_konum_kaydetme();
}

function esya_yerde_olustur(esya_id, adet, yon_x = 0, yon_y = 0, tam_x = 0, tam_y = 0, saglamlik = 100) {
		show_debug_message("Yerde oluştu");
		var esya_isim = "esya_" + string(esya_id);
		var esya_kodu = esya_id;
		var mevcut_adet = adet;
		var atma_tolerans = 20;
		if tam_x == 0 && tam_y == 0 {
			if  yon_x == 0 && yon_y == 0 {
				var konum_x = global.cikolata.x + random_range(-atma_tolerans, atma_tolerans);
				var konum_y = global.cikolata.y + random_range(-atma_tolerans, atma_tolerans);
			}
			else {
				var konum_x = global.cikolata.x + yon_x;
				var konum_y = global.cikolata.y + yon_y;
			}
		}
		else {
			var konum_x = tam_x;
			var konum_y = tam_y;	
		}
		var olusacak_id = asset_get_index("obj_bulunan_" + esya_isim)
	
		var objem = instance_create_layer(konum_x, konum_y, "esyalar", olusacak_id);
		if saglamlik != undefined objem.saglamlik = saglamlik;
		if mevcut_adet != undefined {
			objem.mevcut_adet = mevcut_adet;
		}
		objem.dinamik = true;
		if mevcut_adet == undefined mevcut_adet = 1; 
		esya_konum_kaydetme();
}


