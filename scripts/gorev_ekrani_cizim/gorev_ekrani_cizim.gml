function gorev_ekrani_cizim(){
    if (global.envanter_icerigi_gorunme && global.envanter_sekme == global.sekme_numara_gorevler) {
        global.bakilan_bildirim = global.guncel_bildirim;
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
    
        var toplam_sayi = 8; 
        var list_boyutu = ds_list_size(global.gorevler);
        
        var okuma_baslangic_indexi = max(0, list_boyutu - toplam_sayi);
    
     
        draw_set_halign(fa_left);
        draw_set_valign(fa_top); 

        var ekrana_cizim_sirasi = 0; 
		
		draw_set_color(global.baslik);

		var bilgi_tolerans = 15;
		draw_sprite_ext(spr_craft_bilgi_menusu, 0, baslangic_x + cam_x - bilgi_tolerans, global.craft_baslangic_y + cam_y - (bilgi_tolerans / 2), 2.2, 0.77, 0, global.gui_renk, 1);
		draw_text_transformed(baslangic_x + cam_x, baslangic_y + cam_y, global.genel_yazilar[63], yazi_boyutu, yazi_boyutu, 0);
		
        for (var i = okuma_baslangic_indexi; i < list_boyutu; i++) {
            
            var satir_y = baslangic_y + ((ekrana_cizim_sirasi + 1) * dikey_atlama);
            
            // Listeden metni al
            var gorev_metni = global.gorevler[| i];
			var gorev_aciklamasi = global.gorev_aciklamalari[| i];
			var bosluk = 10;
            
            // Metni çizdir
			draw_set_color(global.baslik);
            draw_text_transformed(baslangic_x + cam_x, satir_y + cam_y, "- " + string(gorev_metni), yazi_boyutu, yazi_boyutu, 0);
            draw_set_color(global.alt_baslik);
			if gorev_aciklamasi != "" draw_text_transformed(baslangic_x + cam_x, satir_y + cam_y + bosluk, "(" + string(gorev_aciklamasi) + ")", aciklama_boyutu, aciklama_boyutu, 0);
            
            // Bir sonraki satıra geçmek için sayacı artır
            ekrana_cizim_sirasi++;
        }
    }
}