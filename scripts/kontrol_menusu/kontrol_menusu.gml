function kontrol_menusu() constructor {
    x = room_width / 2;
    kapali_y = room_height + 100;
    y = kapali_y;
    scale = 2.3;
    kontrol_menusu_tepe = global.kontrol_menusu_sabit_y;
    menu_acilma_basla = false;
    tablet_kapali_opaklik = 1;
	gecme_tusu_boyut_normal = 1;
	gecme_tusu_boyut_buyuk = 1.2;
	gecme_tusu_boyut = gecme_tusu_boyut_normal;

    // Tuş koordinatları ve boyutları için değişkenler
    tus_x = 0;
    tus_y = 0;
    tus_genislik = sprite_get_width(spr_tus_gecis);
    tus_yukseklik = sprite_get_height(spr_tus_gecis);
    tus_hover = false;

    menu_acil_tetikleme = function() {
        if (keyboard_check_pressed(ord("F"))) {
            menu_acilma_basla = !menu_acilma_basla;
			room_goto(Room1);
        }
    };

    menu_acil = function() {
        if (menu_acilma_basla) {
            var yumusama_orani = 0.2;
            y += (kontrol_menusu_tepe - y) * yumusama_orani;

            if (abs(kontrol_menusu_tepe - y) <= 5) {
                y = kontrol_menusu_tepe;
                global.kontrol_menusu_acik = true;
                tablet_kapali_opaklik = 0;
            }
        }
    };
    
    menu_kapan = function() {
        if (!menu_acilma_basla && y < kapali_y) {
            var yumusama_orani = 0.1;
            y += (kapali_y - y) * yumusama_orani;
            global.kontrol_menusu_acik = false;
            tablet_kapali_opaklik = 1;
            if (abs(kapali_y - y) <= 2) {
                y = kapali_y;
            }
        }    
    };
    tus_etkilesim = function() {
		if global.sekme != 1 return;
        if (y >= kapali_y - 10) return;
		if global.secenekler_aktif return;

        var mx = mouse_x;
        var my = mouse_y;
		
        tus_hover = point_in_rectangle(mx, my, tus_x - (tus_genislik / 2), tus_y - (tus_yukseklik / 2), tus_x + (tus_genislik / 2), tus_y + (tus_yukseklik / 2));

        if (tus_hover && mouse_check_button_released(mb_left)) {
			global.satir_atla = true;
        }
    };

    menu_temel_cizim = function() {
        if (y >= kapali_y - 10) return;
        
        draw_sprite_ext(spr_menu, 0, x, y, scale, scale, 0, c_white, 1);
        draw_sprite_ext(spr_menu_2, 0, x, y, scale, scale, 0, c_white, tablet_kapali_opaklik);
        draw_sprite_ext(spr_menu_kir, 0, x, y, scale, scale, 0, c_white, 1);
        
		if !global.secenekler_aktif && global.sekme == 1 {
	        tus_x = sprite_get_width(spr_menu) - (global.kareler_kenar_bosluklari * 6) - sprite_get_width(spr_tus_gecis) + (room_width / 2);
			tus_y = sprite_get_height(spr_menu) - (global.kareler_kenar_bosluklari * 6) - sprite_get_height(spr_tus_gecis) + (room_height / 2);

	        var tus_renk = c_white;
			
			if tus_hover {
				tus_renk = c_white;
				if gecme_tusu_boyut < gecme_tusu_boyut_buyuk {
					gecme_tusu_boyut += 0.1;	
				}
			}	
			else {
				tus_renk = c_gray;
				if gecme_tusu_boyut > gecme_tusu_boyut_normal {
					gecme_tusu_boyut -= 0.1;	
				}
			}
	        if menu_acilma_basla && tablet_kapali_opaklik == 0 draw_sprite_ext(spr_tus_gecis, global.timer / 10, tus_x, tus_y, gecme_tusu_boyut, gecme_tusu_boyut, 0, tus_renk, 1);
		}
    };
	
	menu_gec_tusu_aktiflik_sorgula = function() {
		var secenek_sayisi = ChatterboxGetOptionCount(global.chatterbox_dosyasi);
		if secenek_sayisi == 0 global.secenekler_aktif = false;
		else global.secenekler_aktif = true;
	}
	
	menu_sekme_cizim = function() {
		if tablet_kapali_opaklik == 1 return;
		var cizim_renk = c_gray;
		var temel_y = global.kontrol_menusu_sabit_y + (global.kareler_kenar_bosluklari);
		var y_artis = 160;
		for (var i = 1; i <= global.maksimum_sekme; i++) {
			if global.sekme == i cizim_renk = c_white;
			var _x = global.konum_x_sekme;
			var _y = temel_y + (y_artis * i);
			draw_sprite_ext(spr_sekme_alt, global.sekme_image_index[i], _x, _y, 1, 1, 0, cizim_renk, 1);
			cizim_renk = c_gray;
			//draw_sprite_ext(global.sekme_sprite[i], 0, _x, _y, 2, 2, 0, c_white, cizim_alpha);	
			global.sekme_konumlar[i] = [_x, _y];
			cizim_alpha = 0.2;
		}
	}	
	
	menu_sekme_secimi = function() {
		if tablet_kapali_opaklik == 1 return;
		for (var i = 1; i <= global.maksimum_sekme; i++) {
			var _x = global.sekme_konumlar[i][0];
			var _y = global.sekme_konumlar[i][1];
			var tolerans = 60;
			global.sekme_image_index[i] = 0;
			if point_in_rectangle(mouse_x, mouse_y, _x - tolerans, _y - tolerans, _x + tolerans, _y + tolerans) {
				if mouse_check_button(mb_left) {
					global.sekme_image_index[i] = 1;
				}
				if mouse_check_button_released(mb_left) {
					global.sekme = i;
					global.sekme_image_index[i] = 0;
				}
			}
		}	
	}
}