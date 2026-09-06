if !audio_is_playing(global.sfx_kapi_tiklama) {
	if sayac == 0 {
		bekleme -= 1;
		image_alpha = 0;
	}
	if sayac == 1 {
		instance_destroy();
		global.hikaye_kontrolleri_82 = false;
		konusma_baslat(127);	
	}
}

if bekleme <= 0 {
	sayac = 1;
	bekleme = 240;
	audio_play_sound(global.sfx_kapi_tiklama, 1, false, global.ses_seviyesi);
	image_alpha = 1;
}