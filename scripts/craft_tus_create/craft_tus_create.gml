function craft_tus_create(){
	opaklik = global.envanter_ekrani_gorunme;
	depth = -10003;
	image_xscale = 13.3;
	image_yscale = 2;
	
	temel_xscale = image_xscale;
	temel_yscale = image_yscale;
	
	var cam = view_camera[0];
    var cam_x = camera_get_view_x(cam);
    var cam_y = camera_get_view_y(cam);
	var cam_w = camera_get_view_width(cam);
	var cam_h = camera_get_view_height(cam);
	
	x = cam_x + 280;
	y = cam_y + 180;
	
	temel_konum_x = x;
	temel_konum_y = y;
}