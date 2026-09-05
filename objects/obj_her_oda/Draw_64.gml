her_oda_draw_gui();
if global.timer % 10 == 0 {
	global.gercek_fps = string(floor(fps_real)) + "\n" + string(fps);	
}
if !gui_yok_olma {
	draw_set_color(c_gray);
	draw_set_halign(fa_left);
	draw_set_valign(fa_left);
	if global.fps_goster draw_text_transformed(10, 10, global.gercek_fps, global.envanter_yazi_scale / 2, global.envanter_yazi_scale / 2, 0);
}

draw_set_colour(c_white);