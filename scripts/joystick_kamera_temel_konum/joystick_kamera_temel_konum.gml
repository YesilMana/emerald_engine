function joystick_kamera_temel_konum(){

	var cam = view_camera[0];
    var cam_x = camera_get_view_x(cam);
    var cam_y = camera_get_view_y(cam);
	var cam_h = camera_get_view_height(cam);
	var cam_w = camera_get_view_width(cam);
	
	temel_konum_x = cam_x + 60;
	temel_konum_y = cam_y + cam_h - 70;
	
	
	if !global.joystick_dokunma {
		x = temel_konum_x;
		y = temel_konum_y;
	}
	
	else {
		x = yeni_x;
		y = yeni_y;
	}
	
	depth = -10001;
}