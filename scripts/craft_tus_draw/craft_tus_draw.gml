function craft_tus_draw(){
	if !gui_yok_olma {
		if !duraklatmak {
			//Craftlanabilir mi çizme
			if !craft_secim_yapildi {
				var sonuc = global.genel_yazilar[122];
				kendini_ciz(c_white);
			}
			if global.craft_sonuc == 0 && craft_secim_yapildi { 
				var sonuc = global.genel_yazilar[2];
				kendini_ciz(c_white);
			}
	
			if global.craft_sonuc == 1 && craft_secim_yapildi {
				var sonuc = global.genel_yazilar[1];
				kendini_ciz(global.gui_renk);
			}
	
			if global.envanter_analizi == 999 {
				var sonuc = global.genel_yazilar[4];
				kendini_ciz(c_white);
			}
		
			if !global.ates_isleme_musait && craft_secim_yapildi {
				var sonuc = global.genel_yazilar[2];
				kendini_ciz(c_white);
			}
		
			/*if global.kalori_sinirini_asiyor && craft_secim_yapildi {
				var sonuc = global.genel_yazilar[32];
				kendini_ciz(c_white);	
			}
			
			if global.sicaklik < 20 && craft_secim_yapildi {
				var sonuc = global.genel_yazilar[62];
				kendini_ciz(c_white);	
			}*/
		}
	
		if opaklik == 1 && !duraklatmak{
			draw_set_halign(fa_center);
			draw_set_valign(fa_center);
			draw_set_color(c_white);
			var sprite_genislik = sprite_width;
			var sprite_yukseklik = sprite_height;
			var yazicik = string(sonuc);
			draw_text_transformed(x + sprite_genislik / 2, y + sprite_yukseklik / 2 + 0.5, yazicik, global.craft_tus_scale, global.craft_tus_scale, 0); //DÜzenle
		}
	}

}