function stat_degisim(stat_globali, artma, azalma, her_zaman_dusebilir = false){
	if artma != undefined {
		var temel_global = variable_global_get(stat_globali);
		temel_global += artma;
		variable_global_set(stat_globali, temel_global);
	}
	if azalma != undefined {
		var temel_global = variable_global_get(stat_globali);
		temel_global -= azalma;
		if !her_zaman_dusebilir {
			if !karakter_yuruyemez variable_global_set(stat_globali, temel_global);
		}
		else {
			variable_global_set(stat_globali, temel_global);
		}
	}
}