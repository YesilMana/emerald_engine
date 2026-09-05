if point_distance(x, y, 800, 410) < 40 {
	instance_destroy();
	instance_create_depth(874, 417, 0, obj_tugla_yigini);
	karart(1);
	gorev_sil(42);
}

if itme_sayaci >= ittirmek {
	itme_sayaci = 0;
	karart(0.6);
	if x <= 780 x += 35;
	else y -= 35;
}

if itme_sayaci >= 1 {
	titreme_sayaci -= 1;	
}

if titreme {
	image_angle += (random_range(-3, 3));	
	titreme -= 1;
	
}

if titreme <= 0 {
	image_angle = 0;
}

if titreme_sayaci <= 0 {
	itme_sayaci = 0;
}
