function yagmur_efektleri() {
	static zamanlama_dis = 5;
    static zamanlama_ic = 5;
    
    var yag_dis = global.sfx_yagmur_1;
    var sim_dis = global.sfx_thunder;
    
    if (global.yagmur_yagiyor && !yagmur_yagmayacak_odalar) {
        if (!audio_is_playing(yag_dis)) {
            audio_play_sound(yag_dis, 1, true); 
        }
        
        if (global.timer % (zamanlama_dis * 60) == 0) {
            if (!audio_is_playing(sim_dis)) {
                audio_play_sound(sim_dis, 1, false);
                zamanlama_dis = irandom_range(20, 48); 
            }
        }
		
        audio_sound_gain(yag_dis, global.ses_seviyesi / 2, 0);
		audio_sound_gain(sim_dis, global.ses_seviyesi / 2, 0);
    } else {
        audio_stop_sound(yag_dis);
        audio_stop_sound(sim_dis);
    }
    
    var yag_ic = global.sfx_yagmur_iceri;
    var sim_ic = global.sfx_thunder_iceri;
    
    if (global.yagmur_yagiyor && icerideki_odalar) {
        if (!audio_is_playing(yag_ic)) {
            audio_play_sound(yag_ic, 1, true);
        }
        
        if (global.timer % (zamanlama_ic * 60) == 0) {
            if (!audio_is_playing(sim_ic)) {
                audio_play_sound(sim_ic, 1, false);
                zamanlama_ic = irandom_range(20, 48);
            }
        }
		audio_sound_gain(yag_ic, global.ses_seviyesi / 2, 0);
		audio_sound_gain(sim_ic, global.ses_seviyesi / 2, 0);
    } else {	
        audio_stop_sound(yag_ic);
        audio_stop_sound(sim_ic);
    }	
}