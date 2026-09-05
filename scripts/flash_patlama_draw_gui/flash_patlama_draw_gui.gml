function flash_patlama_draw_gui() {
	draw_set_colour(c_white);
	draw_set_alpha(global.flash_patlama);
	draw_rectangle(-100, -100, 2000, 2000, false);
	global.flash_patlama -= 0.02;
	draw_set_alpha(1);
}