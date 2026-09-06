
	opaklik = global.envanter_ekrani_gorunme && global.envanter_sekme == global.sekme_numara_ayarlar;
	depth = -10000;
	image_xscale = 13.3;
	image_yscale = 2;
	
	temel_xscale = image_xscale;
	temel_yscale = image_yscale;
	
	var cam = view_camera[0];
    var cam_x = camera_get_view_x(cam);
    var cam_y = camera_get_view_y(cam);
	var cam_w = camera_get_view_width(cam);
	var cam_h = camera_get_view_height(cam);
	
	x = cam_x + global.craft_baslangic_x;
	y = cam_y + global.craft_baslangic_y;
	
	temel_konum_x = x;
	temel_konum_y = y;
	
	buton_isim = object_get_name(object_index);
	sira = string_digits(buton_isim);
	aralik = 25;
	cizim_rengi = global.gui_renk;
	
	if sira == 1 {
		yazicik = global.genel_yazilar[104] + " - " + string(global.ses_seviyesi + 0.05);
		if global.ses_seviyesi == 0 yazicik = global.genel_yazilar[104] + " - " + string(global.ses_seviyesi);
	}
	if sira == 2 {
		yazicik = global.genel_yazilar[106] + " - " + string(global.muzik_seviyesi + 0.05);
		if global.muzik_seviyesi == 0 yazicik = global.genel_yazilar[106] + " - " + string(global.muzik_seviyesi);	
	}
	if sira == 3 {
		yazicik = global.genel_yazilar[107];
		if global.tablet_modu cizim_rengi = hex_to_color("88c153");
		if !global.tablet_modu cizim_rengi = hex_to_color("f05948");
		if !global.android && !global.klavye_kontrolleri {
			cizim_rengi = hex_to_color("7d7972");
			opaklik = 0.4;
		}
	}
	
	if sira == 4 {
		yazicik = global.genel_yazilar[113];	
	}
	if sira == 5 {
		yazicik = global.genel_yazilar[115];	
	}
	
	
	
	