temel_x = 0;
temel_y = 0;
yeni_x = 0;
yeni_y = 0;
cam_fark_x = 0;
cam_fark_y = 0;
opakizm = 0.2;
opaklik = opakizm
if !global.android {
	instance_destroy();	
}

depth = global.tus_depth;
image_xscale = global.tus_scale;
image_yscale = global.tus_scale;