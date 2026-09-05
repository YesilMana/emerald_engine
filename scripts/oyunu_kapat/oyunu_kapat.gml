function oyunu_kapat(tus){
	static artis = 0;
	if keyboard_check(tus) {
		artis += 1;
	}
	
	if keyboard_check_released(tus) {
		artis = 0;	
	}
	
	if artis > 60 {
		audio_stop_all();
		game_end();		
	}
}