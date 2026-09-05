if yon = 1 {
	x += hiz;	
	if x > room_width + 300 {
		x = random(room_width);
		y = random(room_height);
		opaklik = 0;
	}
	image_angle += 0.1;
}

if yon = 2 {
	x -= hiz;	
	if x < -300 {
		x = random(room_width);
		y = random(room_height);
		opaklik = 0;
	}
	image_angle -= 0.1;
}

if opaklik < temel_opaklik {
	opaklik += 0.001;
}