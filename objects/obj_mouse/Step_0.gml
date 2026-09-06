x = mouse_x;
y = mouse_y;
opaklik = 0;//mouse_acik;

if mouse_check_button(mb_left) {
	scale = scale_buyuk;
	x = mouse_x + 0.5;
	y = mouse_y + 0.5;
}

else {
	scale = scale_temel;	
}

if global.android {
	opaklik = 0;
}

sprite_index = global.mouse_sprite;

image_alpha = opaklik;
image_xscale = scale;
image_yscale = scale;