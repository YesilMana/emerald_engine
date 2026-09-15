function oyun_ici_kontrollerm() {
	switch (global.konusan) {
		case "tabula":
			if global.tabula_cizim_opaklik < 1 {
				global.tabula_cizim_opaklik += global.tabula_cizim_opaklik_dusus_hiz;
			}	
			if global.tabula_cizim_scale < 1 {
				global.tabula_cizim_scale += global.tabula_cizim_scale_dusus_hiz;
			}
			break;
			
		case "oyuncu":
			if global.tabula_cizim_opaklik > global.tabula_cizim_dusuk_opaklik {
				global.tabula_cizim_opaklik -= global.tabula_cizim_opaklik_dusus_hiz;
			}	
			if global.tabula_cizim_scale > global.tabula_cizim_scale_dusuk {
				global.tabula_cizim_scale -= global.tabula_cizim_scale_dusus_hiz;
			}
			break;
	}
}