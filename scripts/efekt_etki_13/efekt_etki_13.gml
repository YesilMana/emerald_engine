function efekt_etki_13(){
	global.kalori = 100;
	global.su = 100;
	if global.karakter_enerji < global.karakter_enerji_full {
		global.karakter_enerji += global.karakter_enerji_dolma * 3;
	}
}