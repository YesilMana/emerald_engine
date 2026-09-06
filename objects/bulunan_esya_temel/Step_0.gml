envantere_alma(esya_numarasi, id);
image_xscale = image_scale;
image_yscale = image_scale;


if global.timer % 120 == 0 && instance_exists(global.cikolata) {
	if point_distance(x, y, global.cikolata.x, global.cikolata.y) < 100 {
		depth = global.cikolata.depth + 100;
	}
	
	else {
		depth = -y;	
	}
}