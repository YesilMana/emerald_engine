if (variable_instance_exists(id, "faz")) {
	if faz == 1 {
		sprite_index = spr_cali_1_dolu;
	}
	if faz == 2 {
		sprite_index = spr_cali_1;
	}
	
	if faz_degistirme_tetikleme(id) && faz == 1 {
		bekleme_animasyonu_calistir(global.genel_yazilar[152], 0.4, true);
		faz = 2;	
		envantere_ekle(56, irandom_range(3, 7));
		//bilgi_ver(100, 4);
		audio_play_sound(global.sfx_cali_etkilesim, 1, false);
		audio_sound_gain(global.sfx_cali_etkilesim, global.ses_seviyesi);
	}
}



