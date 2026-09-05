function faz_degistirme_tetikleme(_id){
	if karakter_yuruyemez return false;
	var tiklama = false;

	if global.android {
		if point_distance(global.cikolata.x, global.cikolata.y, _id.x, _id.y) < 35 { 
			if variable_instance_exists(_id, "faz") && faz != 1 return 0;
			global.z_renklendi = true;
			if global.z_basildi tiklama = true;	
		}
	}
	
	else {
		if point_distance(mouse_x, mouse_y, _id.x, _id.y - 15) < 15 && mouse_check_button(mb_left) && point_distance(global.cikolata.x, global.cikolata.y, _id.x, _id.y) < 35 {
			tiklama = true;	
		}
	}
	
	return tiklama;
}