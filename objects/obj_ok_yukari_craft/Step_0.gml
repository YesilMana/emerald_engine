scale = global.envanter_scale;
opaklik = global.envanter_ekrani_gorunme && global.envanter_sekme == global.sekme_numara_craft;
image_alpha = opaklik;
renk = global.gui_renk;
var degisken_renk = hex_to_color("6b5f50");
if point_distance(x, y, mouse_x, mouse_y) < mouse_yakinlik && opaklik && !duraklatmak {
	scale = global.envanter_scale + 0.1;
	if mouse_check_button_pressed(mb_left) {
		if sprite_index = spr_ok_yukari {
			if global.craft_ekrani_satir > 1 {
				global.craft_ekrani_satir -= 1;	
			}
		}
		if sprite_index = spr_ok_asagi {
			if global.craft_ekrani_satir < global.craft_malzeme_baslama - 1 {
				global.craft_ekrani_satir += 1;
			}
		}
	}
}

image_xscale = scale;
image_yscale = scale;

	var cam = view_camera[0];
    var cam_x = camera_get_view_x(cam);
    var cam_y = camera_get_view_y(cam);
var x_cizim = cam_x + global.craft_baslangic_x + (sprite_get_width(spr_hasta_ekrani_temel)) - 37.5;
var y_cizim = cam_y + global.craft_baslangic_y + 110;
var atlama = 30;
x = x_cizim;
if sprite_index == spr_ok_yukari {
	y = y_cizim;
	
	if global.craft_ekrani_satir > 1 {
		renk = degisken_renk;
	}
	else {
		opaklik = false;	
	}
}

else if sprite_index == spr_ok_asagi {
	y = y_cizim + atlama;
	if global.craft_malzeme_baslama > 1 && global.craft_ekrani_satir < global.craft_malzeme_baslama -1 {
		renk = degisken_renk;
	}
	else {
		opaklik = false;
	}	
}

