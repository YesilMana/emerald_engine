

if true {
	visible = true;	
	global.gece_karanligi_alpha = 0.9;
}

else {
	visible = false;
	global.gece_karanligi_alpha = 0;
}

if global.harita_uzaklasti {
	image_xscale = 10;
	image_yscale = 10;
	x = -1000;
	y = -1000;
	image_alpha = global.gece_karanligi_alpha / 2;
}

else {
	x = obj_cikolata.x;
	y = obj_cikolata.y - obj_cikolata.sprite_height / 2;
	image_xscale = 1;
	image_yscale = 1;
	image_alpha = global.gece_karanligi_alpha;
}


