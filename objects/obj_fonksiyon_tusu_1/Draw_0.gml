if opaklik == 1 && !duraklatmak{
		draw_set_halign(fa_center);
		draw_set_valign(fa_center);
		draw_set_color(c_white);
		var sprite_genislik = sprite_width;
		var sprite_yukseklik = sprite_height;
		draw_set_colour(c_white);
		kendini_ciz(cizim_rengi);
		draw_text_transformed(x + sprite_genislik / 2, y + sprite_yukseklik / 2 + 0.5, yazicik, global.craft_tus_scale, global.craft_tus_scale, 0); //DÜzenle
	}