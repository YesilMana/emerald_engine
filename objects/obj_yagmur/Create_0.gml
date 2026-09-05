if global.yagmur_yagiyor {
	genislik = 600;
	if global.android genislik = 700
	var x_konum = irandom_range(global.cikolata.x - genislik, global.cikolata.x + genislik);
	var y_konum = irandom_range(global.cikolata.y - (genislik / 3), global.cikolata.y + (genislik / 3));
	
	x = x_konum;
	y = y_konum;
	
	derinlik(id);
	
	image_index = irandom(22);
	
	image_alpha = 0.7;
}

else {
	instance_destroy();	
}