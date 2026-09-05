function npc_step(){
	if !takip_ediliyor && object_index != global.cikolata && !gidiyor && !index_hareket_et {
		if duracak_index == -1 image_index = 0;
		else image_index = duracak_index;
	}
	if !derinligi_manuel_degistir derinlik(id);
	
	if ziplatiliyor == 2 {
		x = zipla_x;
		y = zipla_y;
		ziplatiliyor = 0;	
	}
}