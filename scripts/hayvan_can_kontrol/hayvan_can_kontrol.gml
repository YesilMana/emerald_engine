function hayvan_can_kontrol(){
	if can <= 0 && hareket_sureci != hayvan_hareket.olum {
		audio_play_sound_on(yayici, hayvan_ses_ismi(obje_ismi, "olum"), false, 1, global.ses_seviyesi);
		audio_stop_sound(hareket_ses);
		audio_stop_sound(kacis_ses);
		hareket_sureci = hayvan_hareket.olum;	
	}
	
	if (can < temel_can * kacma_cani) && hareket_sureci != hayvan_hareket.hasar_yeme && hareket_sureci != hayvan_hareket.olum {
		hareket_sureci = hayvan_hareket.kacis;	
	}
}