function kilic_surekli_calisma(){
	global.kilic_olusum_x = global.cikolata.x + global.kilic_ekleme_x;
	global.kilic_olusum_y = global.cikolata.y + global.kilic_ekleme_y;

	global.kilic_sallaniyor -= 1;	
	if global.kilic_sallaniyor < 0 {
		global.kilic_sallaniyor = false;	
	}
}