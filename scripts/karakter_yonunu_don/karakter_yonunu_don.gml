function karakter_yonunu_don(kisi, yon, sprite_serbest = false){
	if sprite_serbest global.sprite_serbest = true;
	if (yon == "sag") { 
	    kisi.sprite_index = kisi.karakter_animasyon.Yan; 
	    kisi.image_xscale = 1; 
	}
    
	if (yon == "arka") { 
	    kisi.sprite_index = kisi.karakter_animasyon.Arka; 
	    kisi.image_xscale = 1; 
	}
    
	if (yon == "sol") { 
	    kisi.sprite_index = kisi.karakter_animasyon.Yan; 
	    kisi.image_xscale = -1; 
	}
    
	if (yon == "on") { 
	    kisi.sprite_index = kisi.karakter_animasyon.On; 
	    kisi.image_xscale = 1; 
	}
}