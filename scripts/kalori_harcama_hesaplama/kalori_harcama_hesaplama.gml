function kalori_harcama_hesaplama(){
	kullanilan_kalori();
	global.kullanilacak_kalori = global.kullanilan_kalori * global.uretilecek;
	
	if global.kullanilacak_kalori > global.kalori {
		global.kalori_sinirini_asiyor = true;
	}
	
	else {
		global.kalori_sinirini_asiyor = false;	
	}
}