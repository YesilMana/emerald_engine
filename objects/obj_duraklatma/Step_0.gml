if global.android {
	if global.harita_uzaklasti || room == rm_ayarlar {
		image_alpha = 0;	
	}
	
	else {
		image_alpha = 0.7;	
	}
    for (var i = 0; i < 5; i++) { // Aynı anda 5 dokunmayı kontrol eder
        var mx = device_mouse_x(i);
        var my = device_mouse_y(i);

        if point_distance(mx, my, x, y) <= sprite_height / 2 + 20 {
            if device_mouse_check_button_released(i, mb_left) {				
				if touching == false && image_alpha != 0 {
					touching = true;
					global.karakter_isinla_x = obj_cikolata.x;
					global.karakter_isinla_y = obj_cikolata.y;
					global.son_oda = room;
					if room != rm_duraklatma {
						room_goto(rm_duraklatma);
						image_xscale = 1;
						image_yscale = 1;
						
					}
				}
				
				else {
					touching = false;	
					room_goto(global.son_oda);
					image_xscale = 1;
					image_yscale = 1;
				}
				image_index = 0;
            }
        }
		
		
    }
	
	if point_distance(mouse_x, mouse_y, x, y) <= sprite_height / 2 + 20 {
		/*if mouse_check_button_pressed(mb_left) {
			if touching == false {
					touching = true;
					global.karakter_isinla_x = obj_cikolata.x;
					global.karakter_isinla_y = obj_cikolata.y;
					global.son_oda = room;
					if room != rm_duraklatma {
						room = rm_duraklatma;
					}
				}
				
				else {
					touching = false;	
					room_goto(global.son_oda);
				}
				image_index = 0;
		}*/
	}
	

    // Eğer dokunma varsa shift_basis aktif, yoksa pasif
    global.duraklatma = touching;

    // Kamera bilgilerini al
    var cam = view_camera[0]; // 0. kamera varsayılıyor
    var cam_x = camera_get_view_x(cam);
    var cam_y = camera_get_view_y(cam);
    var cam_w = camera_get_view_width(cam);
    var cam_h = camera_get_view_height(cam);

    // Nesneyi uygun konuma yerleştir
    if !global.tab_basildi {
        x = cam_x + cam_w / 2;
        if room != rm_duraklatma {y = cam_y + 15; image_xscale = 1; image_yscale = 1;}
		else {y = cam_y + 65; x = cam_x + cam_w / 2 + 8; image_xscale = 2; image_yscale = 2;}
    } 
}

if room == rm_ayarlar || room == rm_opening || room == rm_ana_menu {
	x = 4000;	
}
