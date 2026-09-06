function host_tus_draw(){
	if global.tus_sekmesi_acik {
		var envanter_dolum_kontrolu = false;
		var baslangic_y = global.craft_baslangic_y + global.craft_yatay_atlama;
		var baslangic_x = global.craft_baslangic_x + 38;
		var yatay_atlama = global.craft_yatay_atlama;
		var dikey_atlama = global.craft_dikey_atlama;
		var asagi_satira_gecis = 3;
		var sayfa_bitisi = global.craft_sayfa_bitis_satiri;
		var sprite_boyut = global.envanter_scale;
		var sprite_boyut_secili = global.envanter_scale + 0.05;
		var yazi_boyutu = global.envanter_yazi_scale;
		var sayfa_baslangic = 0;
		var sayfa_bitis = 13;
	
	
		if sayfa_baslangic == 0 sayfa_baslangic = 1;

		var goruntu_boyutu_x = camera_get_view_width(view_camera[0]); // GUI yerine view genişliği
		var toplam_uzunluk = yatay_atlama * (asagi_satira_gecis - 1);
		var baslangic_x = (goruntu_boyutu_x / 2) - (toplam_uzunluk / 2); //Eğer ortalamak istersen
	
		var cam = view_camera[0];
		var cam_x = camera_get_view_x(cam);
		var cam_y = camera_get_view_y(cam);
		var cam_w = camera_get_view_width(cam);
		var cam_h = camera_get_view_height(cam);
	
		var sprite_scale = 1;
		var yazi_scale = 0.57;
	
		draw_set_halign(fa_center);
		draw_set_valign(fa_center);
		draw_set_color(c_white);
			
		draw_sprite_ext(spr_host_tus_temel, 0, cam_x + baslangic_x + (yatay_atlama * 1), baslangic_y + cam_y - global.craft_yatay_atlama, 1 * 3.37, 1, 0, c_white, 1);
		draw_text_transformed(cam_x + baslangic_x + (yatay_atlama * 1), baslangic_y + cam_y - global.craft_yatay_atlama, global.host_sayilar, yazi_scale, yazi_scale, 0);
	
		for (var i = 0; i < sayfa_bitis; i++) {
			if i != 0 {
				var col = (i - 1) mod asagi_satira_gecis;
		        var row = (i - 1) div asagi_satira_gecis;
		        var x_cizim = cam_x + baslangic_x + (yatay_atlama * col); 
		        var y_cizim = cam_y + baslangic_y + (dikey_atlama * row);
			
			
				var sprite_scale = 1;
				var yazi_scale = 0.57;
			
				if point_distance(mouse_x, mouse_y, x_cizim, y_cizim) < 15 {
					if mouse_check_button(mb_left) {
						sprite_scale = 0.8;	
						var yazi_scale = 0.45;
					}
				
					if mouse_check_button_released(mb_left) {
						if i < 10 && string_length(global.host_sayilar) < 6 {
							global.host_sayilar += string(i);
						}
						
						if i == 10 {
							global.host_sayilar += "0";	
						}
					
						if i == 11 {
							// Önce stringin uzunluğunu alıyoruz
						    var _uzunluk = string_length(global.host_sayilar);
    
						    // Eğer string boş değilse silme işlemi yap (Hata almamak için)
						    if (_uzunluk > 0) {
						        // Değişkeni kendisine eşitlemeyi unutma!
						        // Mantık: (String, Başlangıç_Yeri, Kaç_Tane_Silinecek)
						        global.host_sayilar = string_delete(global.host_sayilar, _uzunluk, 1);
						    }		
						}
						
						if i == 12 {
							var sonuc_numara = 0;
							if global.host_sayilar != "" sonuc_numara = real(global.host_sayilar);
							if sonuc_numara == 123456 {//Buraya özel kod kısmında yazılacak numarayı gir
								//Buraya o kod girilince olacak şeyler yazılacak
							}
							global.tus_sekmesi_acik = false;
						}
						
					}
				}
			
			
				draw_sprite_ext(spr_host_tus_temel, 0, x_cizim, y_cizim, sprite_scale, sprite_scale, 0, c_white, 1);
			
			
				if i < 10 {
					draw_text_transformed(x_cizim, y_cizim, string(i), yazi_scale, yazi_scale, 0);
				}	
				
				if i == 10 {
					draw_text_transformed(x_cizim, y_cizim, "0", yazi_scale, yazi_scale, 0);
				}
			
				if (i == 11) {
				    draw_sprite_ext(spr_host_tus_silme, 0, x_cizim, y_cizim, sprite_scale, sprite_scale, 0, c_white, 1);    
				}
			
				if i == 12 {
					draw_sprite_ext(spr_host_tus_enter, 0, x_cizim, y_cizim, sprite_scale, sprite_scale, 0, c_white, 1);	
				}
			}
		}
	}
}