function konusana_donme(){
	if !instance_exists(global.konusulan_kisi) || global.sprite_serbest {
		global.sprite_serbest = false;
		exit;
	}
	var yonelim_cikolata = point_direction(global.cikolata.x, global.cikolata.y, global.konusulan_kisi.x, global.konusulan_kisi.y);
	var yonelim_diger = point_direction(global.konusulan_kisi.x, global.konusulan_kisi.y, global.cikolata.x, global.cikolata.y);
	
	donme_iceri(yonelim_cikolata, global.cikolata);
	donme_iceri(yonelim_diger, global.konusulan_kisi);
}


function donme_iceri(deger, kisi) {
    // Matematik gayet güzel
    var yon = floor(((deger + 45) % 360) / 90);

    // 0 -> Sağ
    // 1 -> Yukarı
    // 2 -> Sol
    // 3 -> Aşağı
    
    // SAĞ
    if (yon == 0) { 
        kisi.sprite_index = kisi.karakter_animasyon.Yan; 
        kisi.image_xscale = 1; 
    }
    
    // YUKARI (Buraya xscale = 1 ekledik)
    if (yon == 1) { 
        kisi.sprite_index = kisi.karakter_animasyon.Arka; 
        kisi.image_xscale = 1; 
    }
    
    // SOL
    if (yon == 2) { 
        kisi.sprite_index = kisi.karakter_animasyon.Yan; 
        kisi.image_xscale = -1; 
    }
    
    // AŞAĞI (Buraya xscale = 1 ekledik)
    if (yon == 3) { 
        kisi.sprite_index = kisi.karakter_animasyon.On; 
        kisi.image_xscale = 1; 
    }
	
	//show_debug_message("Kişi: " + object_get_name(kisi) + "/n" + "Yön: " + string(yon) + " --- " + "Sprite: " + sprite_get_name(kisi.sprite_index));
}