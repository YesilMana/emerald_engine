function ates_yakim_globalleri(){
	global.ates_yakim_suresi_tekil = 5;
	global.ates_yakim_suresi_temel = global.ates_yakim_suresi_tekil * room_speed;
	global.ates_yakim_suresi = global.ates_yakim_suresi_temel;
	global.ates_tetiklenme = false;
	global.ates_sayac = 0;
	global.ates_yakim_basladi = false;
}