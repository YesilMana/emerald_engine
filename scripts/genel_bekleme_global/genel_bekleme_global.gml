function genel_bekleme_globalleri(){
	global.genel_bekleme_suresi_tekil = 3;
	global.genel_bekleme_suresi_temel = global.genel_bekleme_suresi_tekil * room_speed;
	global.genel_bekleme_suresi = global.genel_bekleme_suresi_temel;
	global.genel_tetiklenme = false;
	global.genel_sayac = 0;
	global.genel_yakim_basladi = false;
}