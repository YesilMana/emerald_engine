function efekt_uygula(){
	for (var i = 0; i < array_length(global.aktif_efektler); i++) {
		if global.aktif_efektler[i] > 0 {
			if global.efekt_timer[i] > 0 {
				efekt_etkile(global.aktif_efektler[i]);
			}
			else {
				global.aktif_efektler[i] = 0;	
			}
		}
	}
}