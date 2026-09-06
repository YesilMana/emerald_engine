function ayarlar_ekrani_cizim(){
	if (global.envanter_icerigi_gorunme && global.envanter_sekme == global.sekme_numara_ayarlar) {
        
		var baslangic_y = global.craft_baslangic_y;
		var baslangic_x = global.craft_baslangic_x + 38;
		var dikey_atlama = global.craft_dikey_atlama / 2;
		var sprite_boyut = global.envanter_scale;
		var yazi_boyutu = global.envanter_yazi_scale + (global.envanter_yazi_scale / 3);
		var aciklama_boyutu = global.envanter_yazi_scale;
	
		var cam = view_camera[0];
		var cam_x = camera_get_view_x(cam);
		var cam_y = camera_get_view_y(cam);
		var cam_w = camera_get_view_width(cam);
		var cam_h = camera_get_view_height(cam);
	
		envanter_ana_arkaplan_ciz(cam_x, cam_y, cam_w, cam_h, sprite_boyut);
    
     
        draw_set_halign(fa_center);
        draw_set_valign(fa_top); 
		
		draw_set_color(global.baslik);

		var bilgi_tolerans = 15;
		draw_sprite_ext(spr_craft_bilgi_menusu, 0, baslangic_x + cam_x - bilgi_tolerans, global.craft_baslangic_y + cam_y - (bilgi_tolerans / 2), 2.2, 0.77, 0, global.gui_renk, 1);
		draw_text_transformed(cam_x + (cam_w / 2), baslangic_y + cam_y, global.genel_yazilar[105], yazi_boyutu, yazi_boyutu, 0);
		
	}
}	