function hayvan_faz_degisimi(){
	hayvan_sprite();
	if hareket_sureci == hayvan_hareket.idle {
		hayvan_idle();
	}
	else if hareket_sureci == hayvan_hareket.hareket {
		hayvan_hareket_etme();
	}
	else if hareket_sureci == hayvan_hareket.kovalama {
		hayvan_kovalama();	
	}
	else if hareket_sureci == hayvan_hareket.saldiri {
		hayvan_saldiri();	
	}
	else if hareket_sureci == hayvan_hareket.kacis {
		hayvan_kacis();	
	}
	else if hareket_sureci == hayvan_hareket.hasar_yeme {
		hayvan_hasar_yeme();	
	}
	else if hareket_sureci == hayvan_hareket.olum {
		hayvan_olum();	
	}
	else if hareket_sureci == hayvan_hareket.degisik_noktaya_ilerleme {
		rastgele_hareket();	
	}

	hayvan_algilama();
	hayvan_ic_ice_gecme_engelleme();
	hayvan_hasar_alma_surekli();
	hayvan_can_kontrol();
	image_xscale = xscale;
	image_yscale = scale_temel
}	