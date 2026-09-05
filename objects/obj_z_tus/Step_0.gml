	opaklik = image_alpha;
	var cam = view_camera[0]; // 0. kamera varsayılıyor
	var cam_x = camera_get_view_x(cam);
	var cam_y = camera_get_view_y(cam);
	var cam_w = camera_get_view_width(cam);
	var cam_h = camera_get_view_height(cam);

	// Nesneyi sol alt köşeye yerleştir
	x = cam_x + cam_w + _x;
	y = cam_y + cam_h + _y;
	
	depth = global.tus_depth;
	
	if z_tus_yok_olma {
		opaklik = 0;	
	}
	
	if !global.joystick_dokunma && global.android {
		opaklik = 0.4;	
	}
	
	if sprite_index == spr_menu_tus {
		if global.envanter_ekrani_gorunme {
			image_xscale = global.tus_scale	* 2;
			image_yscale = global.tus_scale	* 2;
			x = cam_x + cam_w + _x - 50;
			y = cam_y + cam_h + _y - 50;
		}
		else {
			image_xscale = global.tus_scale;
			image_yscale = global.tus_scale;	
		}
	}
	
	if sprite_index == spr_harita_tus {
		if harita_uzaklasacak_odalar {
			if global.harita_uzaklasti && global.android {
				image_xscale = global.tus_scale	* 4;
				image_yscale = global.tus_scale	* 4;
				x = cam_x + cam_w + _x - 80;
				y = cam_y + cam_h + _y - 80;	
				opaklik = 1;
			}
			else {
				image_xscale = global.tus_scale;
				image_yscale = global.tus_scale;
			}	
		}
		else {
			opaklik = 0;	
		}
	}
	
	if sprite_index == spr_z_tus {
		if !global.z_renklendi && !global.z_renklendi_android {
			opaklik = 0;	
		}
	}