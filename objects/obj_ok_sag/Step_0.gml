scale = global.envanter_scale;
opaklik = global.envanter_ekrani_gorunme && global.envanter_sekme == global.sekme_numara_craft;
image_alpha = opaklik;
if point_distance(x, y, mouse_x, mouse_y) < mouse_yakinlik && opaklik && !duraklatmak {
	scale = global.envanter_scale + 0.1;
	if mouse_check_button_pressed(mb_left) {
		//show_message(string(global.sayfa_bitisi));
		//if sprite_index = spr_ok_sag && global.craft_ekrani_son_oge < (global.craft_ekrani_sayfasi) * (global.craft_sayfa_bitis_satiri * global.craft_asagi_satira_gecis) && global.sayfa_bitisi < global.envanter_son_oge {
		if sprite_index = spr_ok_sag && global.sayfa_bitisi < global.craft_son_oge {
			global.craft_ekrani_sayfasi += 1;
		}
		
		if sprite_index = spr_ok_sol && global.craft_ekrani_sayfasi > 1 {
			global.craft_ekrani_sayfasi -= 1;
			global.craft_ekrani_son_oge = 0;
		}
	}
}

image_xscale = scale;
image_yscale = scale;

	var cam = view_camera[0];
    var cam_x = camera_get_view_x(cam);
    var cam_y = camera_get_view_y(cam);

if sprite_index == spr_ok_sag {
	x = cam_x + global.craft_baslangic_x + (sprite_get_width(spr_hasta_ekrani_temel)) / 2 - 32;
	y = cam_y + global.craft_baslangic_y + 145;
}

else if sprite_index == spr_ok_sol {
	x = cam_x + global.craft_baslangic_x + (sprite_get_width(spr_hasta_ekrani_temel)) / 2 - 64;
	y = cam_y + global.craft_baslangic_y + 145;
}

