function stats_temel_cizim(temel_x_cizim, temel_y_cizim) {
	draw_sprite_ext(spr_kalori_temel, 0, temel_x_cizim, temel_y_cizim, 1, 1, 0, global.gui_renk, 1);
}

function stats_icerik_cizim(icerik_x_cizim, icerik_y_cizim, globali) {
	var renk = global.gui_renk;
	var alpha = 1;
	if globali < 20 {
		renk = hex_to_color("c67878");
	}
	
	else if globali < 50 {
		renk = hex_to_color("f5d271");
	}
	
	else {
		renk = hex_to_color("b8f573");
		alpha = 0.5;
	}
	
	var scale_y = clamp((globali / 5.05), 1, 58);
	
	draw_sprite_ext(spr_kalori_gosterim, global.timer / 5, icerik_x_cizim, icerik_y_cizim, 1, scale_y, 0, renk, alpha);
}