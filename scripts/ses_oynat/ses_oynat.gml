function ses_oynat(ses, tur, tekrarlayacak_mi, oynatirken_calmayak, ne_kadar_eksik){
	//Sesleri oynatmayı kolaylaştıran fonksiyon
	var kontrol = 1;
	if oynatirken_calmayak != undefined kontrol = oynatirken_calmayak;
	
	if kontrol == 1 {
		if !audio_is_playing(ses) {
			audio_play_sound(ses, 1, tekrarlayacak_mi);
			var ses_seviyesi = 1;
			if tur == 1 ses_seviyesi = global.ses_seviyesi;
			if tur == 2 ses_seviyesi = global.muzik_seviyesi;
			if ne_kadar_eksik != undefined {
				var bolum_1 = ses_seviyesi / 100;
				var bolum_2 = bolum_1 * ne_kadar_eksik;
				ses_seviyesi -= bolum_2;
			}
			audio_sound_gain(ses, ses_seviyesi, 0);
		}
	}
	
	else {
		audio_play_sound(ses, 1, tekrarlayacak_mi);
		var ses_seviyesi = 1;
		if tur == 1 ses_seviyesi = global.ses_seviyesi;
		if tur == 2 ses_seviyesi = global.muzik_seviyesi;
		if ne_kadar_eksik != undefined {
			var bolum_1 = ses_seviyesi / 100;
			var bolum_2 = bolum_1 * ne_kadar_eksik;
			ses_seviyesi -= bolum_2;
		}
		audio_sound_gain(ses, ses_seviyesi, 0);	
	}
}