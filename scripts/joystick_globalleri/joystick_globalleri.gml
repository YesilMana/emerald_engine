function joystick_globalleri(){ //Oyun başında çalışacak objenin create eventine konulacak
	global.joystick_dokunma = false;
	global.joystick_tiklama = false;
	global.joystick_yukari_tiklama = false;
	global.joystick_asagi_tiklama = false;
	global.secenek_kayit = 1;
	global.yukari_cekildi = false;
	global.asagi_cekildi = false;
	global.sol_cekildi = false;
	global.sag_cekildi = false;
	
	// Create Event
	global.sag_tiklandi = false;
	global.sol_tiklandi = false;
	global.yukari_tiklandi = false;
	global.asagi_tiklandi = false;
	global.joystick_acisi = 0;
}