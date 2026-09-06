function genel_bekleme_draw_gui(){
	if global.genel_yakim_basladi {
		draw_set_color(c_black);
		draw_set_alpha(0.5);
		draw_rectangle(0, 0, 1000, 1000, false);
		draw_set_color(c_white);
		
		var goruntu_genislik = display_get_gui_width();
		var goruntu_yukseklik = display_get_gui_height();
		draw_set_halign(fa_center);
		draw_set_valign(fa_center);
		draw_set_alpha(0.7);
		var yazi_scale = 0.2;
		var final_yazi = global.genel_yazilar[46];
		if global.kullanim_tek != "" {
			final_yazi = global.kullanim_tek;
		}
		else {
			for (var i = 1; i < 3; i++) {
				if i == 1 {
					var kontrol_1 = global.kaloriler;
					var yazisi = global.genel_yazilar[48];
				}
			
				else if i == 2 {
					var kontrol_1 = global.sular;
					var yazisi = global.genel_yazilar[47];
				}
			
				else {
					var kontrol_1 = undefined;	
				}
			
				if kontrol_1 != undefined {
					var kontrol = kontrol_1[? string(global.kullanilan_esya)];
					if kontrol != undefined {
						final_yazi = yazisi;
						break;
					}
				}
			}
		}
		if global.kullanilan_esya != 1 {
			var sonuc_kullancik_00 = wrap_text(final_yazi, 20);
			var kod_a = kodunu_al(global.kullanilan_esya);
			var sonuc_kullancik = sonuc_kullancik_00 + "\n" + global.item_names[? "esya_" + string(kod_a)];
		}
		else {
			var sonuc_kullancik = wrap_text(final_yazi, 20);
		}
		sayfa_yaz(goruntu_genislik / 2, (goruntu_yukseklik / 2) - 20, sonuc_kullancik, yazi_scale, , global.baslik);
		draw_sprite_ext(spr_esya_yapim_animasyon, global.timer, goruntu_genislik / 2, goruntu_yukseklik / 2, 1, 1, 0, c_white, 1);
		draw_set_alpha(1);
	}
}