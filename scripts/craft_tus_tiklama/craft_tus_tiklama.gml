function craft_tus_tiklama(){
	if global.craft_sonuc == 1 && global.sicaklik >= 20 {
		if mouse_check_button_pressed(mb_left) { //Tıklanma
			var bos_slot = bos_slotu_bul();
			if bos_slot != 999 {
				global.craft_edildi = true;
				global.craft_tus_tiklandi = true;
				var ses = sfx_button_tiklama;
				audio_play_sound(ses, 1, false);
				audio_sound_gain(ses, global.ses_seviyesi);
			}
		}
	}
}