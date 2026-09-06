function esya_yapim_draw_gui(){ //Oyun boyu çalışacak nesnenin draw gui eventine yazılacak
	if global.craft_basladi {
		draw_set_color(c_black);
		draw_set_alpha(0.5);
		draw_rectangle(0, 0, 1000, 1000, false);
		draw_set_color(c_white);
		
		var goruntu_genislik = display_get_gui_width();
		var goruntu_yukseklik = display_get_gui_height();
		var yapilan_nesne_id = global.craft_kontrol_id;
		var yapilan_nesne_isim = global.item_names[? "esya_" + string(yapilan_nesne_id)];
		draw_set_halign(fa_center);
		draw_set_valign(fa_center);
		draw_set_color(c_white);
		draw_set_alpha(0.7);
		var yazi_scale = 0.2;
		draw_text_transformed(goruntu_genislik / 2, (goruntu_yukseklik / 2) - 20, global.genel_yazilar[13] + "\n" + yapilan_nesne_isim, yazi_scale, yazi_scale, 0);
		draw_sprite_ext(spr_esya_yapim_animasyon, global.timer, goruntu_genislik / 2, goruntu_yukseklik / 2, 1, 1, 0, c_white, 1);
		draw_set_alpha(1);
	}
}