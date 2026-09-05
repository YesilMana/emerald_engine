function kendini_ciz(renk, her_zaman_gorunur){
	var kontrol = gui_yok_olma;
	if her_zaman_gorunur != undefined && her_zaman_gorunur == 1 {
		kontrol = false;	
	}
	if !kontrol {
		var c_renk = c_white;
		if renk != undefined {
			c_renk = renk;	
		}
	
		draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, c_renk, opaklik);
	}
}