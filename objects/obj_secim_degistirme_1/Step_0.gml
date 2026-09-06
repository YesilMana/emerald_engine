 	depth = obj_ok_sag.depth;
	opaklik = global.envanter_ekrani_gorunme;
	image_alpha = opaklik;
	
	var sayi = string_digits(object_get_name(object_index));
	if global.envanter_ekrani_gorunme {
		if !global.sandiga_yakin && sayi == global.sekme_numara_sandik opaklik = 0.4;
		if !global.atese_yakin && sayi == global.sekme_numara_ates opaklik = 0.4;
	}
	var cam = view_camera[0];
    var cam_x = camera_get_view_x(cam);
    var cam_y = camera_get_view_y(cam);
	
	
	
	var belemediko = string_digits(object_get_name(object_index));
	var belemedik = real(belemediko);
	if !global.android var yan_atlama = 25;
	else var yan_atlama = 30;
	var atlama_2 = yan_atlama * (belemedik - 1);
	if global.android && !global.tablet_modu var x_artis = global.craft_baslangic_x + atlama_2 - 143;
	else var x_artis = global.craft_baslangic_x + atlama_2 - 73;
	y = cam_y + global.craft_baslangic_y - 32;
	x = cam_x + global.craft_baslangic_x + x_artis - 25;


if !global.android var mouse_yakinlik = 10;
else var mouse_yakinlik = 15;


image_xscale = scale;
image_yscale = scale;

if point_distance(x, y, mouse_x, mouse_y) < mouse_yakinlik && opaklik && !duraklatmak {
	scale = 1.2;
	
	
	if mouse_check_button_pressed(mb_left) {
		yenile();
		sandik_yakinlik_kontrol();
		ates_yakinlik_kontrol();
		/*if sayi == 2 {
			global.craft_ekrani_gosterilen_sinif = variable_global_get("s_" + string(1));	
		}*/
		
		
		global.envanter_sekme = real(sayi);
	}
	
	/*if mouse_check_button_released(mb_left) {
		yenile();
		if sayi == 3 {
			global.ates_ekrani_acildi = true;
		}
	}*/
}

else {
	scale = 1;	
}