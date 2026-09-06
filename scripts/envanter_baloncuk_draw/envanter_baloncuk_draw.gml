function envanter_baloncuk_draw(){
	if !gui_yok_olma {
		if global.envanter_ekrani_gorunme && global.envanter_sekme == global.sekme_numara_ayarlar exit;
		draw_sprite_ext(sprite_index, 0, x, y, image_xscale, image_yscale, 0, global.gui_renk, opaklik);
		var yazi_scale = global.baloncuk_scale;
		draw_set_font(global.konusma_font);
		draw_set_alpha(opaklik);
		draw_set_color(c_black);
		draw_set_halign(fa_left);
		draw_set_valign(fa_left);
		draw_set_color(c_white);
		sayfa_yaz(x + 5, y - sprite_height + 7, string(global.baloncuk_baslik), yazi_scale, ,global.baslik);
		if global.baloncuk_mesaj != undefined {
			draw_set_color(c_black);
			draw_set_color(c_white);
			sayfa_yaz(x + 5, y - sprite_height + 30, metin, yazi_scale, , global.alt_baslik);
		}
		draw_set_alpha(1);
	}
}