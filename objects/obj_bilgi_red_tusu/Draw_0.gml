if opaklik == 1 && !duraklatmak{
		draw_set_halign(fa_center);
		draw_set_valign(fa_center);
		draw_set_color(c_white);
		var sprite_genislik = sprite_width;
		var sprite_yukseklik = sprite_height;
		
		kendini_ciz(global.gui_renk);
		
		var yazi_x = x + (sprite_width / 2);
		var yazi_y = y + (sprite_height / 2);
		draw_text_transformed(yazi_x, yazi_y, global.bilgi_red_metin, global.envanter_yazi_scale, global.envanter_yazi_scale, 0);
	}