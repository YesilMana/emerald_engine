function kalori_draw(){/*
	var cam = view_camera[0];
	var cam_x = camera_get_view_x(cam);
	var cam_y = camera_get_view_y(cam);
	var cam_w = camera_get_view_width(cam);
	var cam_h = camera_get_view_height(cam);*/
}

function kalori_kullanim() {
	global.kalori -= global.kullanilacak_kalori;
	global.su -= global.kullanilan_su;
}

function kalori_temel_cizim(temel_x_cizim, temel_y_cizim) {
	draw_sprite_ext(spr_kalori_temel, 0, temel_x_cizim, temel_y_cizim, 1, 1, 0, global.gui_renk, 1);
}

function kalori_icerik_cizim(icerik_x_cizim, icerik_y_cizim) {	
	var renk = global.gui_renk;
	var alpha = 1;
	if global.kalori < 20 {
		renk = hex_to_color("c67878");
	}
	
	else if global.kalori < 50 {
		renk = hex_to_color("f5d271");
	}
	
	else {
		renk = hex_to_color("b8f573");
		alpha = 0.5;
	}
	
	var scale_y = clamp((global.kalori / 5.05), 1, 58);
	
	draw_sprite_ext(spr_kalori_gosterim, global.timer / 5, icerik_x_cizim, icerik_y_cizim, 1, scale_y, 0, renk, alpha);
}