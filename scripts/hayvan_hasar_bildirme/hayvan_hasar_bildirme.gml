function hayvan_hasar_bildirme() { //Draw eventi için
	var cizim_aci = random_range(-20, 20);
	
	cizim_y -= 0.4;
	var scale = 0.15;
	draw_set_halign(fa_center);
	draw_set_valign(fa_center);
	draw_set_color(hex_to_color("f59e98"));
	
	draw_text_transformed(cizim_x, cizim_y, string(round(alacagi_hasar)), scale, scale, cizim_aci);
}