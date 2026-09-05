scale = global.envanter_scale * 2;
opaklik = 1
image_alpha = opaklik;
if point_distance(x, y, mouse_x, mouse_y) < mouse_yakinlik && opaklik && !duraklatmak {
	scale = global.envanter_scale + 0.1;
	if mouse_check_button_pressed(mb_left) {
		var degisti = false;
		//show_message(string(global.sayfa_bitisi));
		if sprite_index = spr_ok_sag {
			if global.son_kayit < global.ini_3 {
				global.son_kayit += 5;	
				degisti = true;
			}
		}
		if sprite_index = spr_ok_sol  {
			if global.son_kayit > 5 {
				 global.son_kayit -= 5;
				 degisti = true;
			}
		}
		if degisti {
			if global.ini_3 >= 5 && global.son_kayit < 5 global.son_kayit = 5;
			else if global.ini_3 < 5 global.son_kayit = global.ini_3;
			if global.son_kayit > global.ini_3 global.son_kayit = global.ini_3;
			room_restart();
		}
		
	}
}

image_xscale = scale;
image_yscale = scale;
var cam = view_camera[0];
var cam_x = camera_get_view_x(cam);
var cam_y = camera_get_view_y(cam);

