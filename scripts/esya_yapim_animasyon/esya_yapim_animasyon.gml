function esya_yapim_animasyon(){ //Oyun boyunca çalışacak bir nesnenin step eventine konulacak
	var yapim_suresi = global.yapim_suresi * room_speed;
	
	if global.craft_tetiklenme && global.craft_basladi == false {
		global.craft_sayac = yapim_suresi;
		global.craft_basladi = true;
		global.craft_tetiklenme = false;
	}
	
	if global.craft_basladi && global.craft_suresi > 0 {
		global.craft_suresi -= 1;
		yapim_malzeme_sesleri();
	}
	
	if global.craft_suresi == 0 && global.craft_basladi {
		global.craft_basladi = false;
		yenile();
		global.craft_tus_tiklandi = false;
	}
}