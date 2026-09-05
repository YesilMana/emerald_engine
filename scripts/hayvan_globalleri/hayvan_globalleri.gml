function hayvan_globalleri(){
	enum hayvan_hareket {
		idle = 1,
		hareket = 2,
		saldiri = 3,
		kacis = 4,
		olum = 5,
		kovalama = 6,
		hasar_yeme = 7,
		degisik_noktaya_ilerleme = 8
	}
	
}

function sprite_string_donus(surec){
	if surec == hayvan_hareket.idle {
		return "idle";	
	}
	if surec == hayvan_hareket.hareket {
		return "hareket";	
	}
	if surec == hayvan_hareket.kacis {
		return "hareket";	
	}
	if surec == hayvan_hareket.saldiri {
		return "saldiri_" + string(kullanilan_saldiri);	
	}
	if surec == hayvan_hareket.olum {
		return "olum";	
	}
	if surec == hayvan_hareket.kovalama {
		return "hareket";	
	}
	if surec == hayvan_hareket.hasar_yeme {
		return "hasar_yeme";	
	}
	if surec == hayvan_hareket.degisik_noktaya_ilerleme {
		return "hareket";
	}
}