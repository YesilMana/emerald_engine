scale = global.envanter_scale;
opaklik = global.envanter_ekrani_gorunme && global.envanter_sekme == global.sekme_numara_ates;
image_alpha = opaklik;
if point_distance(x, y, mouse_x, mouse_y) < mouse_yakinlik && opaklik && !duraklatmak && global.atese_yakin && global.en_yakin_ates.yaniyor <= 0 {
	scale = global.envanter_scale + 0.1;
	if mouse_check_button_pressed(mb_left) {
		//show_message(string(global.sayfa_bitisi));
		if sprite_index = spr_ok_sag {
			if global.ates_ekrani_secim < global.ates_ekrani_son {
				global.ates_ekrani_secim += 1;	
			}
			
			else {
				global.ates_ekrani_secim = 1;	
			}
		}
		
		if sprite_index = spr_ok_sol {
			if global.ates_ekrani_secim > 1 {
				global.ates_ekrani_secim -= 1;	
			}
			
			else {
				global.ates_ekrani_secim = global.ates_ekrani_son;	
			}
		}
		
	}
}

image_xscale = scale;
image_yscale = scale;

	var cam = view_camera[0];
    var cam_x = camera_get_view_x(cam);
    var cam_y = camera_get_view_y(cam);

if sprite_index == spr_ok_sag {
	x = cam_x + global.craft_baslangic_x + (sprite_get_width(spr_hasta_ekrani_temel)) / 2 - 2;
	y = cam_y + global.craft_baslangic_y + 150;
}

else if sprite_index == spr_ok_sol {
	x = cam_x + global.craft_baslangic_x + (sprite_get_width(spr_hasta_ekrani_temel)) / 2 - 94;
	y = cam_y + global.craft_baslangic_y + 150;
}

if global.atese_yakin && global.en_yakin_ates.yaniyor > 0 {
	global.ates_ekrani_secim = 1;	
	opaklik = 0;
}
