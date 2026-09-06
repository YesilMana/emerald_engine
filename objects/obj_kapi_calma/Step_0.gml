if !audio_is_playing(global.sfx_kapi_tiklama) {
	if sayac == 0 {
		bekleme -= 1;
		image_alpha = 0;
	}
	if sayac == 1 {
		instance_destroy();
		konusma_baslat(96);
		global.hikaye_kontrolleri_53 = false;
		global.hikaye_kontrolleri_55 = false;
	}
}

if bekleme <= 0 {
	sayac = 1;
	bekleme = 360;
	audio_play_sound(global.sfx_kapi_tiklama, 1, false, global.ses_seviyesi);
	image_alpha = 1;
}