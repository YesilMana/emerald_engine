function odaya_isinlan(oda_ismi, konum_x, konum_y){
	room_goto(oda_ismi);
	her_oda_degistirince_yasanacaklar();
	global.karakter_dogur_x = konum_x;
	global.karakter_dogur_y = konum_y;
}