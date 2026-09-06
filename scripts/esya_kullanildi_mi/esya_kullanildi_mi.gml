function esya_kullanildi_mi(numara){
	if global.kullanildi_esya == numara {
		global.kullanildi_esya = noone;
		return true;
	}
	else {
		return false;	
	}
}