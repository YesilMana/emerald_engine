function joystick_dokunma_kontrol(){
		var cam = view_camera[0];
		var cam_x = camera_get_view_x(cam);
		var cam_y = camera_get_view_y(cam);
		var cam_h = camera_get_view_height(cam);
		var cam_w = camera_get_view_width(cam);
		var uzaklik_algilama = 80;
		if point_distance(x, y, mouse_x, mouse_y) < uzaklik_algilama && !joystick_kapali {
		if mouse_check_button_pressed(mb_left) {
			yeni_x = mouse_x;
			yeni_y = mouse_y;
			
			cam_fark_x = yeni_x - cam_x;
			cam_fark_y = yeni_y - cam_y;
			global.joystick_tiklama = true;
		}
		
	
		
		
	}
	
	opakizm = 0.05;
	
	if global.joystick_tiklama {
		x = cam_fark_x + cam_x;
		y = cam_fark_y + cam_y;
		if mouse_check_button(mb_left) {
			opakizm = 0.3;
			global.joystick_dokunma = true;
		}
		else {
			opakizm = 0.1;
			global.joystick_dokunma = false;
			global.joystick_tiklama = false;
		}
	}
	
	if global.konusma_basladi opakizm = 0;
	
}