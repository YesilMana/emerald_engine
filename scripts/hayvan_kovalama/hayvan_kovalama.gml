function hayvan_kovalama(){
	if oyuncu_uzaklik > en_uzak_menzil {
		//mp_potential_step(global.cikolata.x, global.cikolata.y, anlik_hiz, false);
		hayvan_git(global.cikolata.x, global.cikolata.y, anlik_hiz);
		if ilk_hareket_noktasi_uzaklik > maksimum_kovalama {
			hareket_sureci = hayvan_hareket.idle;	
		}
		if (hayvan_rastgele_sayac % farkli_noktalara_hareket) == 0 {
			farkli_kontrol = true;
			hareket_sureci = hayvan_hareket.degisik_noktaya_ilerleme;
			farkli_noktalara_hareket = irandom_range(60, 300);
		}
	}
	
	else {
		if karakter_yuruyemez {
			hareket_sureci = hayvan_hareket.idle;
			exit;
		}
		audio_play_sound_on(yayici, hayvan_ses_ismi(obje_ismi, "saldiri"), false, 1, global.ses_seviyesi);
		hareket_sureci = hayvan_hareket.saldiri;
		image_index = 0;
		hayvan_en_uzak_menzil_ayarlama();
	}
}