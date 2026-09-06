function sprite_degisimi(){
	var secili_sprite = global.secili_karakter;
	//Karakter çizimlerini değiştiren script (Değişimler globallere farklı atamalar yapılarak kolatca yapılabilir)
	if global.sol_basildi {
		global.kilic_yon = "sol";
		global.cikolata.sprite_index = secili_sprite.Yan;
		global.cikolata.image_xscale = -global.cikolata_scale;
	}
	
	else if global.sag_basildi {
		global.kilic_yon = "sag";
		global.cikolata.sprite_index = secili_sprite.Yan;
		global.cikolata.image_xscale = global.cikolata_scale;
	}

	else if global.yukari_basildi {
		global.kilic_yon = "yukari";
		global.cikolata.sprite_index = secili_sprite.Arka;
	}
	
	else if global.asagi_basildi {
		global.kilic_yon = "asagi";
		global.cikolata.sprite_index = secili_sprite.On;
	}
	

}
	
	