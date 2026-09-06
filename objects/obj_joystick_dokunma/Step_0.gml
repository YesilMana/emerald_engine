joystick_dokunma_yok_kontrol();

if !global.joystick_dokunma {
	x = obj_joystick_temel.x;	
	y = obj_joystick_temel.y;	
	opakizm = 0.3;
}

else {
	opakizm = 1;
	x = mouse_x;
	y = mouse_y;
}
if global.konusma_basladi || oyun_disi_odalar || global.envanter_ekrani_gorunme || global.hikaye_kontrolleri_120 opakizm = 0;
opaklik = opakizm;
image_alpha = opakizm;

if !global.android instance_destroy();