function secenek_ozel_kod(deger) {
	switch (deger) {
		case "otorite": 
			draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, hex_to_color("7a0a00"), cizim_alphasi);
			break;
		case "sefkat": 
			draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, hex_to_color("237a32"), cizim_alphasi);
			break;
		case "empati": 
			draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, hex_to_color("003d7a"), cizim_alphasi);
			break;
		case "sabir": 
			draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, hex_to_color("a88d07"), cizim_alphasi);
			break;
	}
}