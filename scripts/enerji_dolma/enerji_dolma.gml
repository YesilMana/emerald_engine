function enerji_dolma(){
	//Enerjinin zamanla dolması (Dokunulması önerilmez)
	if global.karakter_enerji < global.karakter_enerji_full {
		global.karakter_enerji += global.karakter_enerji_dolma * 99;	//Enerji artık düşmüyor
	}
	
	if global.karakter_enerji <= 0 && global.hizlanma_basildi && !yurume_tusuna_basilmiyor {
		global.karakter_enerji = -1;
	}
	
	if global.karakter_enerji < -1 {
		global.karakter_enerji = -1;	
	}
}