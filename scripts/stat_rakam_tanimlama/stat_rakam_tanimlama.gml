function stat_rakam_tanimlama(degisen_stat_no) {
	var globalim = "can";
	if degisen_stat_no == 2 {
		globalim = "kalori";
	}
	if degisen_stat_no == 3 {
		globalim = "su";
	}
	if degisen_stat_no == 4 {
		globalim = "sicaklik";
	}
	if degisen_stat_no == 5 {
		globalim = "yorgunluk";
	}
	
	var donus = variable_global_get(globalim);
	return donus;
}

function stat_rakam_tanimlama_isim_donus(degisen_stat_no) {
	var globalim = "can";
	if degisen_stat_no == 2 {
		globalim = "kalori";
	}
	if degisen_stat_no == 3 {
		globalim = "su";
	}
	if degisen_stat_no == 4 {
		globalim = "sicaklik";
	}
	if degisen_stat_no == 5 {
		globalim = "yorgunluk";
	}
	
	var donus = globalim;
	return donus;
}

function stat_maksimum_tanimlama(degisen_stat_no) {
	var globalim = "can_maksimum";
	if degisen_stat_no == 2 {
		globalim = "kalori_maksimum";
	}
	if degisen_stat_no == 3 {
		globalim = "su_maksimum";
	}
	if degisen_stat_no == 4 {
		globalim = "sicaklik_maksimum";
	}
	if degisen_stat_no == 5 {
		globalim = "yorgunluk_maksimum";
	}
	
	var donus = globalim;
	return donus;
}