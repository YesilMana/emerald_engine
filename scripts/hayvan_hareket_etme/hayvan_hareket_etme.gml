function hayvan_hareket_etme(){
	
	if !audio_is_playing(hareket_ses) {
		hareket_ses = audio_play_sound_on(yayici, hayvan_ses_ismi(obje_ismi, "hareket"), false, 1, global.ses_seviyesi, , random_range(0.9, 1.1));
	}
	var mesafe = point_distance(x, y, hedef_x, hedef_y);
	
	if mesafe < 5 || kontrol_suresi <= 1 {
		hareket_sureci = hayvan_hareket.idle;
	}
	
	else {
		//mp_potential_step(hedef_x, hedef_y, anlik_hiz, false);
		hayvan_git(hedef_x, hedef_y, anlik_hiz);
		kontrol_suresi -= 1;
	}
	
	if carpisildi {
		devriye_noktasi_belirle();
	}	
}

function hayvan_idle() {
	if varinca_bekleme_suresi > 1 {
		varinca_bekleme_suresi -= 1;
	}
	
	if varinca_bekleme_suresi == 1 {
		varinca_bekleme_suresi = irandom_range(variable_global_get(obje_ismi + "_varinca_bekleme_suresi_1") * room_speed, variable_global_get(obje_ismi + "_varinca_bekleme_suresi_2") * room_speed);
		devriye_noktasi_belirle();
		kontrol_suresi = room_speed * 12;
		hareket_sureci = hayvan_hareket.hareket;
	}
}

function rastgele_hareket() {
	if farkli_kontrol {
		rast_x = irandom_range(ilk_x - devriye_yaricapi, ilk_x + devriye_yaricapi);
		rast_y = irandom_range(ilk_y - devriye_yaricapi, ilk_y + devriye_yaricapi);	
		farkli_kontrol = false;
	}
	
	//mp_potential_step(rast_x, rast_y, anlik_hiz, false);
	hayvan_git(rast_x, rast_y, anlik_hiz);
	var uzaklik = point_distance(x, y, rast_x, rast_y)
	if (hayvan_rastgele_sayac % farkli_noktalara_hareket) == 0 || uzaklik < 10 {
		hareket_sureci = hayvan_hareket.idle;
		farkli_noktalara_hareket = irandom_range(300, 1200);
	}
}