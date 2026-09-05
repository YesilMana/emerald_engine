if global.android == true {
	for (var i = 0; i < 5; i++) { // Aynı anda 5 dokunmayı kontrol eder
    var mx = device_mouse_x(i);
    var my = device_mouse_y(i);

    if point_distance(mx, my, x, y) <= sprite_height / 2 + 12 {
        if device_mouse_check_button_pressed(i, mb_left) {
            if global.tab_basildi == false {
				if mahalleler || room == rm_training_room {
	                image_xscale = 7.5;
	                image_yscale = 7.5;
				}
				
				else if room == rm_labirent_1 {
					image_xscale = 3.75;
	                image_yscale = 3.75;
				}
                global.tab_basildi = true;
				global.kopek_kovalama = false;
            } else {
                image_xscale = 1;
                image_yscale = 1;
                global.tab_basildi = false;
				global.kopek_kovalama = true;
            }
        } 
    }
}

// Eğer hiçbir dokunuş yoksa değişkenleri sıfırlama (gerekiyorsa)
if !(device_mouse_check_button(0, mb_left) || 
     device_mouse_check_button(1, mb_left) || 
     device_mouse_check_button(2, mb_left) || 
     device_mouse_check_button(3, mb_left) || 
     device_mouse_check_button(4, mb_left)) {
    // Burada global.tab_basildi kontrolünü sıfırlayabiliriz
}


	else {
		//global.tab_basildi = false;
	}
		// Aktif kameranın görünüm koordinatlarını al
		var cam = view_camera[0]; // 0. kamera varsayılıyor
		var cam_x = camera_get_view_x(cam);
		var cam_y = camera_get_view_y(cam);
		var cam_w = camera_get_view_width(cam);
		var cam_h = camera_get_view_height(cam);

		// Nesneyi sol alt köşeye yerleştir
		if global.tab_basildi == false {
			x = cam_x + cam_w - 25;
			y = cam_y + 40;
		}
	
		else {
			x = cam_x + cam_w - 200;
			y = cam_y + 320;	
		}
		//image_xscale = 1;
		//image_yscale = 1;

}

duraklatma_ekraninda_gorunmez_olma();