function ara_sahne_ciz(sprite_ismi, boyutlari, duracagi_saniye, index = 0, kararti = 1){
	global.ara_sahne_sprite = sprite_ismi;
	global.ara_sahne_sprite_boyut = boyutlari;
	global.ara_sahne_index = index;
	global.ara_sahne_duracagi_saniye = duracagi_saniye;
	global.ara_sahne_kararti = kararti;
}

function ara_sahne_draw_gui() {
	if global.ara_sahne_duracagi_saniye > 0 {
		draw_sprite_ext(global.ara_sahne_sprite, global.ara_sahne_index, display_get_gui_width() / 2, display_get_gui_height() / 2, global.ara_sahne_sprite_boyut, global.ara_sahne_sprite_boyut, 0, c_white, global.ara_sahne_duracagi_saniye);
		global.ara_sahne_duracagi_saniye -= 0.01;
	}
	if global.ara_sahne_kararti >= 0 {
		draw_set_colour(c_black);
		draw_set_alpha(global.ara_sahne_kararti);
		draw_rectangle(-200, -200, 4000, 4000, false);	
		draw_set_colour(c_white);
		draw_set_alpha(1);
		global.ara_sahne_kararti -= 0.01;
	}
}

function ara_sahne_anlik_ciz(ara_sahne_sprite, opaklik, boyut = 1) {
	draw_sprite_ext(ara_sahne_sprite, 0, display_get_gui_width() / 2, display_get_gui_height() / 2, boyut, boyut, 0, c_white, opaklik);
}

function dandik_ara_sahne_draw_gui() {
	if global.hikaye_kontrolleri_117 {
		static degiskenim_1 = 0;
		static degiskenim_2= 0;
		static degiskenim_3= 0;
		var boyut = 0.3;
		
		if degiskenim_2 == false {
			ara_sahne_anlik_ciz(spr_baslangic_1, degiskenim_3, boyut);
			degiskenim_1 += 1;
			degiskenim_3 += 0.01;
			if degiskenim_1 >= 2 * 60 {
				degiskenim_2 = true;
				degiskenim_1 = 0;
				degiskenim_3 = 0;
			}
		}
		else if degiskenim_2 == 1 {
			ara_sahne_anlik_ciz(spr_baslangic_1, 1, boyut);
			ara_sahne_anlik_ciz(spr_baslangic_2, degiskenim_3, boyut);
			degiskenim_3 += 0.01;
			degiskenim_1 += 1;
			if degiskenim_1 >= 2 * 60 {
				degiskenim_2 = 2;
				degiskenim_1 = 0;
				degiskenim_3 = 0;
			}
		}
		
		else if degiskenim_2 == 2 {
			ara_sahne_anlik_ciz(spr_baslangic_1, 1, boyut);
			ara_sahne_anlik_ciz(spr_baslangic_2, 1, boyut);	
			
			var cizilen_yazi = spr_baslangic_3_tr;
			if global.dil == "english" cizilen_yazi = spr_baslangic_3_ing;
			ara_sahne_anlik_ciz(cizilen_yazi, degiskenim_3, boyut / 2);	
			
			degiskenim_3 += 0.01;
			degiskenim_1 += 1;
			if degiskenim_1 >= 3 * 60 {
				degiskenim_2 = 3;
				degiskenim_1 = 0;
				degiskenim_3 = 1;
			}
		}
		
		else if degiskenim_2 == 3 {
			ara_sahne_anlik_ciz(spr_baslangic_1, degiskenim_3, boyut);
			ara_sahne_anlik_ciz(spr_baslangic_2, degiskenim_3, boyut);
			
			var cizilen_yazi = spr_baslangic_3_tr;
			if global.dil == "english" cizilen_yazi = spr_baslangic_3_ing;
			ara_sahne_anlik_ciz(cizilen_yazi, degiskenim_3, boyut / 2);	
			
			degiskenim_3 -= 0.01;
			if degiskenim_3 <= 0 {
				degiskenim_2 = 0;
				degiskenim_1 = 0;
				degiskenim_3 = 0;
				global.hikaye_kontrolleri_117 = false;
			}
		}
	}	
}