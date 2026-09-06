function envanter_ekrani_create(){
	image_xscale = 0.9;
	image_yscale = 0.9;
	var gui_yukseklik = display_get_gui_height();
	var gui_genislik = display_get_gui_width();
	x = gui_genislik / 2;
	y = gui_yukseklik / 2;
	karincalanma = spr_hasta_ekrani_karincalanma;
	karinca_rengi = c_black;
	opaklik = global.envanter_ekrani_gorunme;
	image_alpha = 0;
	depth = -9900;
	oda_olusum_kodlari();
}