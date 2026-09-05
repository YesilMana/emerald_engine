function ates_tus_draw(){
	if global.ates_mekanigi {
		if !duraklatmak {
			var atese_yakin = global.atese_yakin;
			var en_yakin_ates = global.en_yakin_ates;
			//Ateş yakabilir mi çizme
	
			if atese_yakin == false {//Ateşe yakın değilsek
				var sonuc = global.genel_yazilar[19];
				kendini_ciz(c_white);
			}
		
			if atese_yakin != false {

				if en_yakin_ates.yaniyor <= 0 && global.ates_kibrit_secilmis == "" && global.ates_yakacak_secilmis == "" {
					var sonuc = global.genel_yazilar[122];
					kendini_ciz(c_white);	
				}
				if en_yakin_ates.yaniyor <= 0 && global.ates_kibrit_secilmis != "" && global.ates_yakacak_secilmis == "" {
					var sonuc = global.genel_yazilar[21];
					kendini_ciz(c_white);	
				}
			
				if en_yakin_ates.yaniyor <= 0 && global.ates_kibrit_secilmis == "" && global.ates_yakacak_secilmis != "" {
					var sonuc = global.genel_yazilar[23];
					kendini_ciz(c_white);	
				}
			
				if en_yakin_ates.yaniyor <= 0 && global.ates_kibrit_secilmis != "" && global.ates_yakacak_secilmis != "" {
					var sonuc = global.genel_yazilar[18];
					kendini_ciz(global.gui_renk);
				}
			
				if en_yakin_ates.yaniyor > 0 {
					var sonuc = global.genel_yazilar[21];
					kendini_ciz(c_white);	
				}
			
				if en_yakin_ates.yaniyor > 0 && global.ates_yakacak_secilmis != "" {
					var sonuc = global.genel_yazilar[20];
					kendini_ciz(global.gui_renk);	
				}
			
			}
	
			if opaklik == 1 {
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
}