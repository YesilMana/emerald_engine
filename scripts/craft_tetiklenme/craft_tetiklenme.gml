function craft_tetiklenme(craft_edilen){
	switch(craft_edilen) {
		case 13:
			audio_play_sound(global.sfx_craft_kibrit, 1, false);
			audio_sound_gain(global.sfx_craft_kibrit, global.ses_seviyesi);
			break;
	}
	
}