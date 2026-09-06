timer += 1;

if timer <= elmas_buyume_sure {
	image_index = 0;	
	if scale > 2 {
		scale -= scale_artis;
		scale_artis += scale_logaritmik;
	}
	else {
		scale_artis = 0.001;	
	}
}
else {
	scale += scale_artis;
	
	if image_index >= 8 {
		timer = 0;	
		scale_artis = 0.001;
	}
	scale_artis += scale_logaritmik;
}

depth = -9000;

image_xscale = scale;
image_yscale = scale;


x = temel_x;
y = temel_y + random_range(-0.3, 0.3);
