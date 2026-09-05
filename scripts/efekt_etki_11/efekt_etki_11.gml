function efekt_etki_11(){
	if global.karakter_enerji < global.karakter_enerji_full {
		global.karakter_enerji += global.karakter_enerji_dolma;
	}
}