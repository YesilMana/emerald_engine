function efekt_draw(){
	if global.envanter_ekrani_gorunme && global.envanter_sekme == global.sekme_numara_stats {
		var cam = view_camera[0];
		var cam_x = camera_get_view_x(cam);
		var cam_y = camera_get_view_y(cam);
		var cam_w = camera_get_view_width(cam);
		var cam_h = camera_get_view_height(cam);
		var sayac = 0;
	
		var x_cizim = cam_x + global.craft_baslangic_x - 36;
		var y_cizim = cam_y + global.craft_baslangic_y;
		draw_set_halign(fa_right);
		draw_set_valign(fa_left);
		
		for (var i = 0; i < array_length(global.aktif_efektler); i++) {
			if global.aktif_efektler[i] > 0 {
				y_cizim = cam_y + global.craft_baslangic_y + ((sayac - 1) * 36);
				var yazilacak = wrap_text(global.efekt_isimler[? string(global.aktif_efektler[i])], 16);
				var yazilacak_2 = yazilacak + "\n" + string(global.efekt_timer[i]);
				draw_sprite_ext(spr_efekt_arkaplan, 0, x_cizim, y_cizim, 2, 1.1, 0, global.gui_renk, 1);
				sayfa_yaz(x_cizim - 4, y_cizim - 12, yazilacak_2, global.envanter_yazi_scale, , hex_to_color("59351b"));
				sayac += 1;
			}
		}
	}
}