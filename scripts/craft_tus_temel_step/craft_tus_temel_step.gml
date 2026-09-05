function craft_tus_temel_step(c){
	if opaklik {
		global.craft_edildi = false;
		image_alpha = opaklik;
		var cam = view_camera[0];
	    var cam_x = camera_get_view_x(cam);
	    var cam_y = camera_get_view_y(cam);
	
		x = global.craft_baslangic_x + cam_x + (sprite_get_width(spr_craft_bilgi_menusu) * 2) - 24;
		y = global.craft_baslangic_y + cam_y + sprite_get_height(spr_craft_bilgi_menusu) - global.bilgi_menu_istisna;
	
		temel_konum_x = x;
		temel_konum_y = y;
	
		var mouse_girince_buyume = 0.1;
		var yer_degistirme = 0.5;
		if !global.android var mouse_yaklasma_uzaklik = 20;
		else var mouse_yaklasma_uzaklik = 34;
	
		var yakinlik_kontrol = point_distance(x + sprite_width / 2, y + sprite_height / 2, mouse_x, mouse_y) < mouse_yaklasma_uzaklik;
		static yakinlastim = false;
		if yakinlik_kontrol {
			if mouse_check_button(mb_left) {
				alet_analizi();	
				global.craft_opaklik_kontrol = true;
				global.isleme_tetik = true;
			}
			if mouse_check_button_released(mb_left) {
				alet_analizi();	
				global.craft_opaklik_kontrol = true;
				global.isleme_tetik = true;
			}
			if mouse_check_button_pressed(mb_left) {
				alet_analizi();	
				global.craft_opaklik_kontrol = true;
				global.isleme_tetik = true;
			}	
		}
		
		else {
			yakinlastim = false;	
		}
	
		if (yakinlik_kontrol) && opaklik && !duraklatmak { //Mouse yaklaşma
			if (!yakinlastim) {
				var ses = sfx_button_yakinlasma;
				audio_play_sound(ses, 1, false);
				audio_sound_gain(ses, global.ses_seviyesi);
				yakinlastim = true;
			}
			tus_buyume(temel_xscale, temel_yscale, mouse_girince_buyume, temel_konum_x, temel_konum_y, yer_degistirme)
			script_execute(c);
		}
	
		else {
			x = temel_konum_x;
			y = temel_konum_y;
			image_xscale = temel_xscale;
			image_yscale = temel_yscale;
		}
	}
}