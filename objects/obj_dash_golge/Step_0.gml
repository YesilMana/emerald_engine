image_alpha = alpha;

var yok_olus = 0.05;

alpha -= yok_olus;

if alpha < 0 {
	instance_destroy();	
}

image_index = duran_index;