function ates_create(){
	yaniyor = false;
	sayac = 0;
	tetik = false;
	sicaklik = 0;
	yanacak_temel = spr_ates_temel;
	yanacak_ates = spr_ates_1;
	if variable_instance_exists(id, "ates_temel") {
		yanacak_temel = ates_temel;	
		sprite_index = yanacak_temel;
	}
	
	if variable_instance_exists(id, "ates_yanacak") {
		yanacak_ates = ates_yanacak;	
	}
	
}