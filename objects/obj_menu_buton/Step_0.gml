if variable_instance_exists(id, "eylem") {
	islev = eylem;	
	
	var bolum = display_get_gui_width() / 4;
    var cam = view_camera[0];
	var cam_x = camera_get_view_x(cam);
	var cam_y = camera_get_view_y(cam);
	
    x = ((bolum * (islev - 1)) + (bolum / 2)) + cam_x;
    y = display_get_gui_height() - 60;
}

if global.android {
	if point_distance(x, y, mouse_x, mouse_y) < 30 {
		
		if !mouse_check_button_released(mb_left) exit;
		isleve_gore(islev);
		uzerine_geldi = true;
	}

	else {
		
		uzerine_geldi = false;
	}
}

else {
	if instance_place(x, y, obj_mouse) {
		uzerine_geldi = true;
		if !mouse_check_button_released(mb_left) exit;
		isleve_gore(islev);
	}

	else {
		uzerine_geldi = false;
	}	
}

if uzerine_geldi {
	if scale < buyuk_scale {
		scale += scale_buyume_hizi;
	}	
	if uzerine_gelme_alpha < 1 {
		uzerine_gelme_alpha += uzerine_gelme_alpha_buyume_hizi;
	}
}	

else {
	if scale > temel_scale {
		scale -= scale_buyume_hizi;
	}		
	if uzerine_gelme_alpha > 0 {
		uzerine_gelme_alpha -= uzerine_gelme_alpha_buyume_hizi;
	}
}

//image_xscale = scale;
image_yscale = scale;