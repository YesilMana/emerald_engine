if !global.android && !global.klavye_kontrolleri{
	instance_destroy();
	exit;	
}
if global.ini_8 {
	instance_destroy();
	exit;
}
elmas_buyume = false;

elmas_buyume_sure = 180;

timer = 0;

scale = 2;

scale_logaritmik = 0.0004;
scale_artis = 0.005;

temel_x = display_get_gui_width() - 50;
temel_y = 30;

opaklik = 1;

