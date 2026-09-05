function hayvan_hasar_alma_surekli(){
	if zaman_dur {
		image_index = 0;
	}
	if !hasar_aldi {
		if instance_exists(obj_kilic_savurma) && instance_place(x, y, obj_kilic_savurma) && hareket_sureci != hayvan_hareket.olum {
			var almasi_gerenen_hasar = global.kilic_hasar;
			
			var secilen_ses_1 = irandom_range(1, 2);
			var secilen_ses_2 = variable_global_get("sfx_hasar_verme_" + string(secilen_ses_1));
			if !audio_is_playing(secilen_ses_2) {
				audio_play_sound(secilen_ses_2, 1, false);
				audio_sound_gain(secilen_ses_2, global.ses_seviyesi);
			}
			
			audio_play_sound_on(yayici, hayvan_ses_ismi(obje_ismi, "hasar_yeme"), false, 1, global.ses_seviyesi, , random_range(0.9, 1.1));
			
			var direnc = variable_global_get(obje_ismi + "_direnc_" + global.silah_hasar_turu);
			var son_hasar = almasi_gerenen_hasar * (1 - direnc);
			if son_hasar > 0 {
				if global.zorluk == 2 alacagi_hasar = son_hasar;
				else alacagi_hasar = 999;
				hareket_sureci = hayvan_hareket.hasar_yeme;
				image_index = 0;
				dayanliklilik_dus(global.kilic_dayanliklilik_azalma);
				ekran_titret(2, 15);
				hayvan_hasar_efekt();	
				hayvan_can_dusme(alacagi_hasar);
			}
		}
	}
	if (flash > 0) {
		flash -= flash_hizi;
	}
}

