opaklik = global.envanter_ekrani_gorunme && global.envanter_sekme == global.sekme_numara_ayarlar;
if opaklik {
	
		if !global.android && sira == 3 {
			cizim_rengi = c_gray;
			opaklik = 1;
		}
		
		if sira == 3 {
			if global.tablet_modu cizim_rengi = hex_to_color("88c153");
			if !global.tablet_modu cizim_rengi = hex_to_color("f05948");
			if !global.android && !global.klavye_kontrolleri cizim_rengi = hex_to_color("7d7972");	
		}
		
		image_alpha = opaklik;
		depth = obj_her_oda.depth - 1;
		var cam = view_camera[0];
	    var cam_x = camera_get_view_x(cam);
	    var cam_y = camera_get_view_y(cam);
		var cam_w = camera_get_view_width(cam);
		var cam_h = camera_get_view_height(cam);
		
	
		x =  cam_x + ((cam_w / 2) - ((sprite_get_width(sprite_index) * image_xscale) / 2));
		y = global.craft_baslangic_y + cam_y + ((sira - 1) * aralik) + 15;
	
		temel_konum_x = x;
		temel_konum_y = y;
	
		var mouse_girince_buyume = 0.1;
		var yer_degistirme = 0.5;
		var mouse_yaklasma_uzaklik = 15;
		
		if sira == 1 {
			yazicik = global.genel_yazilar[104] + " - " + string(round((global.ses_seviyesi + 0.05) * 100));
			if global.ses_seviyesi == 0 yazicik = global.genel_yazilar[104] + " - " + string(int64(global.ses_seviyesi * 100));
		}
		if sira == 2 {
			yazicik = global.genel_yazilar[106] + " - " + string(round((global.muzik_seviyesi + 0.05) * 100));
			if global.muzik_seviyesi == 0 yazicik = global.genel_yazilar[106] + " - " + string(int64(global.muzik_seviyesi * 100));	
		}
	
		var yakinlik_kontrol = instance_place(x, y, obj_mouse); //point_distance(x + sprite_width / 2, y + sprite_height / 2, mouse_x, mouse_y) < mouse_yaklasma_uzaklik;
	
		if (yakinlik_kontrol) && opaklik && !duraklatmak && !global.bilgi_onay { //Mouse yaklaşma
			tus_buyume(temel_xscale, temel_yscale, mouse_girince_buyume, temel_konum_x, temel_konum_y, yer_degistirme);
			script_cagir("menu_tus_" + sira);
		}
	
		else {
			x = temel_konum_x;
			y = temel_konum_y;
			image_xscale = temel_xscale;
			image_yscale = temel_yscale;
		}
	}