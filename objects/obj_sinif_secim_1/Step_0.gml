	depth = obj_ok_sag.depth;
	var sayisi = string_digits(sprite_get_name(sprite_index));
	var aralikta = sayisi > global.craft_sinif_baslangic && sayisi < global.craft_sinif_baslangic + 7;
	opaklik = global.envanter_ekrani_gorunme && global.envanter_sekme == global.sekme_numara_craft && aralikta;
	image_alpha = opaklik;
	global.craft_sinif_bitis = sayisi;
	var cam = view_camera[0];
    var cam_x = camera_get_view_x(cam);
    var cam_y = camera_get_view_y(cam);
	
	x = cam_x + global.craft_baslangic_x - 6;
	
	var belemediko = string_digits(sprite_get_name(sprite_index));
	var belemedik = real(belemediko);
	var asagi_atlama = 32;
	var atlama_2 = asagi_atlama * (belemedik - 1);
	var y_artis = global.craft_baslangic_y + atlama_2 - 32;
	y = cam_y + y_artis - (global.craft_sinif_baslangic * asagi_atlama);


if !global.android var mouse_yakinlik = 10;
else var mouse_yakinlik = 15;

image_xscale = scale;
image_yscale = scale;

if point_distance(x, y, mouse_x, mouse_y) < mouse_yakinlik && opaklik && !duraklatmak {
	scale = 1.2;
	global.baloncuk_gorunurluk = true;
	global.baloncuk_mesaj = undefined;
	if sprite_index == spr_sinif_degistirme_1 global.baloncuk_baslik = global.genel_yazilar[57];
	if sprite_index == spr_sinif_degistirme_2 global.baloncuk_baslik = global.genel_yazilar[10];
	if sprite_index == spr_sinif_degistirme_3 global.baloncuk_baslik = global.genel_yazilar[11];
	if sprite_index == spr_sinif_degistirme_4 global.baloncuk_baslik = global.genel_yazilar[55];
	if sprite_index == spr_sinif_degistirme_5 global.baloncuk_baslik = global.genel_yazilar[56];
	if sprite_index == spr_sinif_degistirme_6 global.baloncuk_baslik = global.genel_yazilar[12];
	if sprite_index == spr_sinif_degistirme_7 global.baloncuk_baslik = global.genel_yazilar[58];
	if mouse_check_button_pressed(mb_left) {
		global.craft_ekrani_sayfasi = 1;
		global.craft_opaklik_kontrol = true;
		global.craft_ekrani_gosterilen_sinif = variable_global_get("s_" + string(sayisi));
	}
}

else {
	scale = 1;	
}