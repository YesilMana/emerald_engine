function sinirlama(){ //Oyun boyu sürekli çalışacak
	for (var i = 1; i <= global.karakter_kontrol_sayisi; i++) {
		var stat_globali = stat_rakam_tanimlama_isim_donus(i);
		var stat_maksimumu = stat_maksimum_tanimlama(i);
		
		var stat_globali_1 = variable_global_get(stat_globali);
		var stat_maksimumu_1 = variable_global_get(stat_maksimumu);
		
		if stat_globali_1 >= stat_maksimumu_1 {
			variable_global_set(stat_globali, stat_maksimumu_1);	
		}
		
		if stat_globali_1 <= 0 {
			variable_global_set(stat_globali, 0);		
		}
	}
}