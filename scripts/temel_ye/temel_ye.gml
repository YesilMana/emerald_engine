function temel_ye(kod){
	audio_play_sound(global.sfx_ye, 1, false);
	audio_sound_gain(global.sfx_ye, global.ses_seviyesi);
	envanterden_azalt(kod, 1);
	stat_degisim("kalori", global.kaloriler[? "esya_" + string(kod)], 0);
	if global.sular[? "esya_" + string(kod)] != -1 {
		stat_degisim("su", global.sular[? "esya_" + string(kod)], 0);	
	}
	global.genel_tetiklenme = true;
	global.stat_minik_opaklik[2] = 8;
	global.stat_minik_opaklik[3] = 8;
}