function ates_ses_calma(){
	if global.ates_mekanigi {
		if global.yakinlardaki_ates != 0 && instance_exists(global.yakinlardaki_ates) && global.yakinlardaki_ates.yaniyor > 0 && !audio_is_playing(global.sfx_ates_yakim_baslama) {
			ses_cikaran_obje(obj_ates, 400, global.sfx_ates_yanma);
		}
	
		else {
			audio_stop_sound(global.sfx_ates_yanma);	
		}
	}
}