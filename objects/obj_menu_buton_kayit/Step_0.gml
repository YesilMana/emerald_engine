if variable_instance_exists(id, "eylem") {
	islev = eylem;	
}

if variable_instance_exists(id, "aktiflik") {
	aktif_mi = aktiflik;	
}

if islev < global.son_kayit - 4 {
	instance_destroy();	
}

sira = islev;	

if global.son_kayit > 5 {
	sira = islev - (global.son_kayit - 5);
	clamp(sira, 1, 5);
}



if !global.bilgi_onay && aktif_mi && !global.tus_sekmesi_acik {
	if global.android {
		if point_distance(x, y, mouse_x, mouse_y) < 30 {
		
			if mouse_check_button_released(mb_left) {
				json_kopyala("oyuncu_kayit_" + string(islev) + ".json", "kullanici.json");
				ini_open("settings.ini");
				ini_write_real("ayarlar", "devam", 1);
				ini_close();
				game_restart();
				uzerine_geldi = true;
			}
		}

		else {
			uzerine_geldi = false;
		}
	}

	else {
		if instance_place(x, y, obj_mouse) {
			uzerine_geldi = true;
			if mouse_check_button_released(mb_left) {
				json_kopyala("oyuncu_kayit_" + string(islev) + ".json", "kullanici.json");
				ini_open("settings.ini");
				ini_write_real("ayarlar", "devam", 1);
				ini_close();
				game_restart();
			}
		
		}

		if !instance_place(x, y, obj_mouse) {
			uzerine_geldi = false;
		}	
	}
}

if uzerine_geldi {
	if scale < buyuk_scale {
		scale += scale_buyume_hizi;
	}	
	if uzerine_gelme_alpha < 1 {
		uzerine_gelme_alpha += uzerine_gelme_alpha_buyume_hizi;
	}
}	

else {
	if scale > temel_scale {
		scale -= scale_buyume_hizi;
	}		
	if uzerine_gelme_alpha > 0 {
		uzerine_gelme_alpha -= uzerine_gelme_alpha_buyume_hizi;
	}
}


x = room_width / 2;
y = 30 + (sira * 40);



//image_xscale = scale;
//image_yscale = scale;