function ates_step(){
	if variable_instance_exists(id, "ates_temel") {
		yanacak_temel = ates_temel;	
	}
	
	if variable_instance_exists(id, "ates_yanacak") {
		yanacak_ates = ates_yanacak;	
	}
	if instance_exists(global.cikolata) && point_distance(x, y, global.cikolata.x, global.cikolata.y) < global.atese_maksimum_uzaklik {
		stat_degisim("sicaklik", global.ates_sicaklik, 0);
	}
	if variable_instance_exists(id, "ates_no") {
		var yaniyor_0 = global.ates_map[? string(ates_no)];
		if is_undefined(yaniyor_0) {
			var gecici_map = ds_map_create();
			ds_map_add(gecici_map, "sure", 0);
			ds_map_add(gecici_map, "sicaklik", 0);
			ds_map_add_map(global.ates_map, string(ates_no), gecici_map);
			yaniyor_0 = global.ates_map[? string(ates_no)];
		}
		yaniyor = yaniyor_0[? "sure"];
		sicaklik = yaniyor_0[? "sicaklik"];
	}
	ates_mouse_tiklama();
}

function ates_mouse_tiklama() {
	if !duraklatmak && !global.envanter_ekrani_gorunme && !zaman_dur {
		if point_distance(x, y, mouse_x, mouse_y) < 20 && point_distance(x, y, global.cikolata.x, global.cikolata.y) < global.atese_maksimum_uzaklik {
			envanter_analiz_et();
			ates_yakacak_kontrol();
			global.isleme_tetik = true;
			if mouse_check_button_released(mb_left) {
				global.ates_ekrani_acildi = true;
				global.envanter_ekrani_gorunme = true;
				global.envanter_sekme = global.sekme_numara_ates;
			}
		}
	}
}

function ates_sure_hesaplama() {
	if zaman_dur exit;
	for (var i = 1; i < global.son_ates + 1; i++) { 
		var key_1 = global.ates_map[? string(i)];
		if is_undefined(key_1) {
			var gecici_map = ds_map_create();
			ds_map_add(gecici_map, "sure", 0);
			ds_map_add(gecici_map, "sicaklik", 0);
			ds_map_add_map(global.ates_map, string(i), gecici_map);
			key_1 = global.ates_map[? string(i)];
		}
		if key_1[? "sure"] != false {
			if (global.timer % room_speed) == 0 {
				key_1[? "sure"] -= 1;	
			}
		}
	
		else { //Ateş yanmıyor
			key_1[? "sicaklik"] = 0;
		}
	}
}