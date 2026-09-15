function konum_tanimlamalari(){
	//konumlar
	global.konum_x_sekme = (room_width / 2) - sprite_get_width(spr_menu) - (global.kareler_kenar_bosluklari * 1.5);
	
	global.secenek_scale = 2.56;
	global.secenek_wrap = 400;
	global.konum_x_secenek = ((room_width / 2) + global.konum_x_sekme) / 2 + (global.kareler_kenar_bosluklari * 3);
	
	global.konum_x_sohbet_bas = (room_width / 2) - sprite_get_width(spr_menu) + (global.kareler_kenar_bosluklari * 4);
	global.konum_x_sohbet_son = (room_width / 2) - global.kareler_kenar_bosluklari;
	
	global.tabula_cizim_x = room_width / 1.5;
	global.tabula_cizim_y = room_height / 2;
}