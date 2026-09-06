if global.yagmur_yagiyor {	
	if image_index >= image_number - 1 {
		var x_konum = irandom_range(global.cikolata.x - genislik, global.cikolata.x + genislik);
		var y_konum = irandom_range(global.cikolata.y - (genislik / 2.5), global.cikolata.y + (genislik / 2));
	
		x = x_konum;
		y = y_konum;
	
		derinlik(id);
		image_index = 0;
	}
}

else {
	instance_destroy();	
}