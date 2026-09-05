function npc_create(animasyon){
	takip_ediliyor = false;
	karakter_animasyon = variable_global_get(animasyon);
	sprite_index = karakter_animasyon.On;
	takip_sirasi = 0;
	//derinlik(id);
	gidiyor = false;
	scalem = image_xscale;
	index_hareket_et = false;
	duracak_index = -1;
	ziplatiliyor = false;
	zipla_x = 0;
	zipla_y = 0;
	derinligi_manuel_degistir = false;
}