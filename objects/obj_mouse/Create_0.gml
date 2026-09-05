if global.android {
	image_alpha = 0;
}
else {	
	window_set_cursor(cr_arrow);
}
depth = -1000000;

opaklik = 0;//mouse_acik;
scale_temel = 0.3;
scale_buyuk = 0.23;
scale = scale_temel
image_xscale = scale;
image_yscale = scale;