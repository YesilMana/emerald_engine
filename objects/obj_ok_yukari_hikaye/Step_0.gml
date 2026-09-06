scale = global.envanter_scale;
opaklik = global.secim_yapiliyor && global.konusma_basladi && global.android;

if point_distance(x, y, mouse_x, mouse_y) < mouse_yakinlik && opaklik && !duraklatmak {
	scale = global.envanter_scale + 0.1;
	if mouse_check_button_pressed(mb_left) {
		//show_message(string(global.sayfa_bitisi));
		if sprite_index = spr_ok_yukari && global.yapilmis_secim > 1 global.yapilmis_secim -= 1;
		if sprite_index = spr_ok_asagi && global.yapilmis_secim < global.maksimum_secenek global.yapilmis_secim += 1; 
	}
}

image_xscale = scale;
image_yscale = scale;

var cam = view_camera[0];
var cam_x = camera_get_view_x(cam);
var cam_y = camera_get_view_y(cam);
if !global.android || (global.android && !global.tablet_modu) var x_konum = global.craft_baslangic_x + cam_x - 180;
if global.android && global.tablet_modu var x_konum = global.craft_baslangic_x + cam_x - 110;
var y_konum = global.craft_baslangic_y + 164 + cam_y;

	
	
	
if sprite_index == spr_ok_yukari {
	x = x_konum;
	y = global.secenek_1_y + cam_y - 20;
}

else if sprite_index == spr_ok_asagi {
	x = x_konum;
	y = global.secenek_2_y + cam_y;
}

image_alpha = opaklik;