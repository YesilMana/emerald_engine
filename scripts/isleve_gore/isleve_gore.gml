function isleve_gore(islev){
	if islev == 1 {
		menu_devam_et();
	}	
	
	if islev == 2 {
		onay_ekrani_goster(global.genel_yazilar[149], global.genel_yazilar[150], , 7);	
	}
	
	if islev == 3 {
		room_goto(rm_menu_2);
	}
	
	if islev == 4 {
		audio_stop_all();
		game_end();	
	}
	
	if islev == 5 {
		ini_kaydet();	
		room_goto(rm_menu);
	}
	
	if islev == 6 {
		if global.ses_seviyesi < 1 {
			global.ses_seviyesi += 0.05;
		}
		
		if global.ses_seviyesi >= 1 {
			global.ses_seviyesi = 0;
		}
		ini_kaydet();	
	}
	
	if islev == 7 {
		if global.muzik_seviyesi < 1 {
			global.muzik_seviyesi += 0.05;
		}
	
		if global.muzik_seviyesi >= 1 {
			global.muzik_seviyesi = 0;
		}
		ini_kaydet();
	}	
	if islev == 9 {
		//room_goto(rm_menu_5);
	}	
	if islev == 10 {
		json_kopyala("kayit_1.json", "kullanici.json");
		ini_open("settings.ini");
		ini_write_real("ayarlar", "devam", 1);
		ini_close();
		game_restart();
	}	
	if islev == 11 {
		json_kopyala("kayit_2.json", "kullanici.json");
		ini_open("settings.ini");
		ini_write_real("ayarlar", "devam", 1);
		ini_close();
		game_restart();
	}	
	if islev == 12 {
		json_kopyala("kayit_3.json", "kullanici.json");
		ini_open("settings.ini");
		ini_write_real("ayarlar", "devam", 1);
		ini_close();
		game_restart();
	}	
	if islev == 13 {
		json_kopyala("kayit_4.json", "kullanici.json");
		ini_open("settings.ini");
		ini_write_real("ayarlar", "devam", 1);
		ini_close();
		game_restart();
	}	
	if islev == 14 {
		json_kopyala("kayit_5.json", "kullanici.json");
		ini_open("settings.ini");
		ini_write_real("ayarlar", "devam", 1);
		ini_close();
		game_restart();
	}
	if islev == 15 {
		json_kopyala("kayit_6.json", "kullanici.json");
		ini_open("settings.ini");
		ini_write_real("ayarlar", "devam", 1);
		ini_close();
		game_restart();
	}
	if islev == 16 {
		json_kopyala("kayit_7.json", "kullanici.json");
		ini_open("settings.ini");
		ini_write_real("ayarlar", "devam", 1);
		ini_close();
		game_restart();
	}
	if islev == 17 {
		json_kopyala("kayit_8.json", "kullanici.json");
		ini_open("settings.ini");
		ini_write_real("ayarlar", "devam", 1);
		ini_close();
		game_restart();
	}
	if islev == 18 {
		json_kopyala("kayit_9.json", "kullanici.json");
		ini_open("settings.ini");
		ini_write_real("ayarlar", "devam", 1);
		ini_close();
		game_restart();
	}
	if islev == 19 {
		//room_goto(rm_menu_4);
	}
	if islev == 20 {
		onay_ekrani_goster(global.genel_yazilar[197] + " " + "Turkish" + " " + global.genel_yazilar[198], , , 17);
	}
	if islev == 21 {
		onay_ekrani_goster(global.genel_yazilar[197] + " " + "English" + " " + global.genel_yazilar[198], , , 18);
	}
	if islev == 22 {
		onay_ekrani_goster(global.genel_yazilar[197] + " " + "German" + " " + global.genel_yazilar[198], , , 19);
	}
	if islev == 23 {
		//room_goto(rm_menu_3);
	}
	if islev == 24 {
		//room_goto(rm_menu_8);
	}
	if islev == 27 {
		global.tus_sekmesi_acik = true;	
	}
	if islev == 28 {
		room_goto(rm_menu_6);
	}
	if islev == 29 {
		room_goto(rm_menu_7);
	}
	if islev == 30 {
		json_kopyala("kayit_10.json", "kullanici.json");
		ini_open("settings.ini");
		ini_write_real("ayarlar", "devam", 1);
		ini_close();
		game_restart();
	}
	if islev == 31 {
		json_kopyala("kayit_11.json", "kullanici.json");
		ini_open("settings.ini");
		ini_write_real("ayarlar", "devam", 1);
		ini_close();
		game_restart();
	}
	if islev == 32 {
		json_kopyala("kayit_12.json", "kullanici.json");
		ini_open("settings.ini");
		ini_write_real("ayarlar", "devam", 1);
		ini_close();
		game_restart();
	}
	if islev == 33 {
		json_kopyala("kayit_13.json", "kullanici.json");
		ini_open("settings.ini");
		ini_write_real("ayarlar", "devam", 1);
		ini_close();
		game_restart();
	}
	if islev == 34 {
		json_kopyala("kayit_14.json", "kullanici.json");
		ini_open("settings.ini");
		ini_write_real("ayarlar", "devam", 1);
		ini_close();
		game_restart();
	}
	if islev == 35 {
		json_kopyala("kayit_15.json", "kullanici.json");
		ini_open("settings.ini");
		ini_write_real("ayarlar", "devam", 1);
		ini_close();
		game_restart();
	}
	if islev == 36 {
		json_kopyala("kayit_16.json", "kullanici.json");
		ini_open("settings.ini");
		ini_write_real("ayarlar", "devam", 1);
		ini_close();
		game_restart();
	}
	if islev == 37 {
		json_kopyala("kayit_17.json", "kullanici.json");
		ini_open("settings.ini");
		ini_write_real("ayarlar", "devam", 1);
		ini_close();
		game_restart();
	}
	if islev == 38 {
		json_kopyala("kayit_18.json", "kullanici.json");
		ini_open("settings.ini");
		ini_write_real("ayarlar", "devam", 1);
		ini_close();
		game_restart();
	}
	if islev == 39 {
		json_kopyala("kayit_19.json", "kullanici.json");
		ini_open("settings.ini");
		ini_write_real("ayarlar", "devam", 1);
		ini_close();
		game_restart();
	}
	if islev == 40 {
		//room_goto(rm_menu_10);
	}
	if islev == 41 {
		json_kopyala("kayit_20.json", "kullanici.json");
		ini_open("settings.ini");
		ini_write_real("ayarlar", "devam", 1);
		ini_close();
		game_restart();
	}
	if islev == 42 {
		json_kopyala("kayit_21.json", "kullanici.json");
		ini_open("settings.ini");
		ini_write_real("ayarlar", "devam", 1);
		ini_close();
		game_restart();
	}
	if islev == 43 {
		json_kopyala("kayit_22.json", "kullanici.json");
		ini_open("settings.ini");
		ini_write_real("ayarlar", "devam", 1);
		ini_close();
		game_restart();
	}
	if islev == 44 {
		json_kopyala("kayit_23.json", "kullanici.json");
		ini_open("settings.ini");
		ini_write_real("ayarlar", "devam", 1);
		ini_close();
		game_restart();
	}
	if islev == 45 {
		json_kopyala("kayit_24.json", "kullanici.json");
		ini_open("settings.ini");
		ini_write_real("ayarlar", "devam", 1);
		ini_close();
		game_restart();
	}
	if islev == 46 {
		obj_tam_surum_satin_al.satin_al = true;
	}
	if islev == 47 {
		obj_destek_ol.satin_al = true;
	}
	if islev == 48 {
		onay_ekrani_goster(global.genel_yazilar[197] + " " + "Spanish" + " " + global.genel_yazilar[198], , , 35);
	}
	if islev == 49 {
		onay_ekrani_goster(global.genel_yazilar[197] + " " + "Polish" + " " + global.genel_yazilar[198], , , 36);
	}
	if islev == 50 {
		onay_ekrani_goster(global.genel_yazilar[197] + " " + "Russian" + " " + global.genel_yazilar[198], , , 37);
	}
	if islev == 51 {
		onay_ekrani_goster(global.genel_yazilar[197] + " " + "Portuguese" + " " + global.genel_yazilar[198], , , 38);
	}
	if islev == 52 {
		onay_ekrani_goster(global.genel_yazilar[197] + " " + "Italian" + " " + global.genel_yazilar[198], , , 39);
	}
	if islev == 53 {
		onay_ekrani_goster(global.genel_yazilar[197] + " " + "French" + " " + global.genel_yazilar[198], , , 40);
	}
	if islev == 54 {
		url_open("https://play.google.com/store/apps/details?id=com.trashmen.zumrutcicegi&hl=tr");
		global.ini_10 = true;
		ini_kaydet();
	}
	if islev == 55 {
		ini_kaydet();	
		room_goto(rm_menu);
	}
	if islev == 56 {
		
	}
}
function isleve_gore_yazi(islev) {
	
	draw_set_halign(fa_center);
	draw_set_valign(fa_center);
	draw_set_colour(global.baslik);

	var scale = global.envanter_yazi_scale * 1.6;
	var y_ = y + 1;

	if islev == 1 {
		draw_text_transformed(x, y_, global.genel_yazilar[145], scale, scale, 0);
	}	

	if islev == 2 {
		draw_text_transformed(x, y_, global.genel_yazilar[146], scale, scale, 0);
	}	

	if islev == 3 {
		draw_text_transformed(x, y_, global.genel_yazilar[147], scale, scale, 0);
	}	

	if islev == 4 {
		draw_text_transformed(x, y_, global.genel_yazilar[148], scale, scale, 0);
	}	
	
	if islev == 5 {
		draw_text_transformed(x, y_, global.genel_yazilar[113], scale, scale, 0);
	}	
	
	if islev == 6 {
		var yazicik = global.genel_yazilar[104] + " - " + string(round((global.ses_seviyesi + 0.05) * 100));
		if global.ses_seviyesi == 0 yazicik = global.genel_yazilar[104] + " - " + string(int64(global.ses_seviyesi * 100));
		draw_text_transformed(x, y_, yazicik, scale, scale, 0);
	}	
	
	if islev == 7 {
		var yazicik = global.genel_yazilar[106] + " - " + string(round((global.muzik_seviyesi + 0.05) * 100));
		if global.muzik_seviyesi == 0 yazicik = global.genel_yazilar[106] + " - " + string(int64(global.muzik_seviyesi * 100));	
		draw_text_transformed(x, y_, yazicik, scale, scale, 0);
	}
	
	if islev == 8 {
		draw_text_transformed(x, y_, global.genel_yazilar[174], scale, scale, 0);	
	}
	if islev == 9 {
		draw_text_transformed(x, y_, global.genel_yazilar[182], scale, scale, 0);	
	}
	if islev == 10 {
		draw_text_transformed(x, y_, global.genel_yazilar[183], scale, scale, 0);	
	}
	if islev == 11 {
		draw_text_transformed(x, y_, global.genel_yazilar[185], scale, scale, 0);	
	}
	if islev == 12 {
		draw_text_transformed(x, y_, global.genel_yazilar[186], scale, scale, 0);	
	}
	if islev == 13 {
		draw_text_transformed(x, y_, global.genel_yazilar[187], scale, scale, 0);	
	}
	if islev == 14 {
		draw_text_transformed(x, y_, global.genel_yazilar[188], scale, scale, 0);	
	}
	if islev == 15 {
		draw_text_transformed(x, y_, global.genel_yazilar[189], scale, scale, 0);	
	}
	if islev == 16 {
		draw_text_transformed(x, y_, global.genel_yazilar[190], scale, scale, 0);	
	}
	if islev == 17 {
		draw_text_transformed(x, y_, global.genel_yazilar[191], scale, scale, 0);	
	}
	if islev == 18 {
		draw_text_transformed(x, y_, global.genel_yazilar[192], scale, scale, 0);	
	}
	if islev == 19 {
		draw_text_transformed(x, y_, global.genel_yazilar[194], scale, scale, 0);	
	}
	if islev == 20 {
		draw_text_transformed(x, y_, "Turkish", scale, scale, 0);	
	}
	if islev == 21 {
		draw_text_transformed(x, y_, "English", scale, scale, 0);	
	}
	if islev == 22 {
		draw_text_transformed(x, y_, "German", scale, scale, 0);	
	}
	if islev == 23 {
		draw_text_transformed(x, y_, global.genel_yazilar[199], scale, scale, 0);	
	}
	if islev == 24 {
		draw_text_transformed(x, y_, global.genel_yazilar[274], scale, scale, 0);	
	}
	if islev == 25 {
		draw_text_transformed(x, y_, global.genel_yazilar[201], scale, scale, 0);	
	}
	if islev == 26 {
		draw_text_transformed(x, y_, global.genel_yazilar[202], scale, scale, 0);	
	}
	if islev == 27 {
		draw_text_transformed(x, y_, global.genel_yazilar[203], scale, scale, 0);		
	}
	if islev == 28 {
		draw_text_transformed(x, y_, global.genel_yazilar[145], scale, scale, 0);	
	}
	if islev == 29 {
		draw_text_transformed(x, y_, global.genel_yazilar[210], scale, scale, 0);	
	}
	if islev == 30 {
		draw_text_transformed(x, y_, global.genel_yazilar[211], scale, scale, 0);	
	}
	if islev == 31 {
		draw_text_transformed(x, y_, global.genel_yazilar[229], scale, scale, 0);	
	}
	if islev == 32 {
		draw_text_transformed(x, y_, global.genel_yazilar[230], scale, scale, 0);	
	}
	if islev == 33 {
		draw_text_transformed(x, y_, global.genel_yazilar[231], scale, scale, 0);	
	}
	if islev == 34 {
		draw_text_transformed(x, y_, global.genel_yazilar[254], scale, scale, 0);	
	}
	if islev == 35 {
		draw_text_transformed(x, y_, global.genel_yazilar[255], scale, scale, 0);	
	}
	if islev == 36 {
		draw_text_transformed(x, y_, global.genel_yazilar[256], scale, scale, 0);	
	}
	if islev == 37 {
		draw_text_transformed(x, y_, global.genel_yazilar[259], scale, scale, 0);	
	}
	if islev == 38 {
		draw_text_transformed(x, y_, global.genel_yazilar[269], scale, scale, 0);	
	}
	if islev == 39 {
		draw_text_transformed(x, y_, global.genel_yazilar[273], scale, scale, 0);	
	}
	if islev == 40 {
		draw_text_transformed(x, y_, global.genel_yazilar[275], scale, scale, 0);	
	}
	if islev == 41 {
		draw_text_transformed(x, y_, global.genel_yazilar[298], scale, scale, 0);	
	}
	if islev == 42 {
		draw_text_transformed(x, y_, global.genel_yazilar[299], scale, scale, 0);	
	}
	if islev == 43 {
		draw_text_transformed(x, y_, global.genel_yazilar[300], scale, scale, 0);	
	}
	if islev == 44 {
		draw_text_transformed(x, y_, global.genel_yazilar[301], scale, scale, 0);	
	}
	if islev == 45 {
		draw_text_transformed(x, y_, global.genel_yazilar[302], scale, scale, 0);	
	}
	if islev == 46 {
		draw_text_transformed(x, y_, global.genel_yazilar[304], scale, scale, 0);	
	}
	if islev == 47 {
		draw_text_transformed(x, y_, global.genel_yazilar[309], scale, scale, 0);	
	}
	if islev == 48 {
		draw_text_transformed(x, y_, "Spanish", scale, scale, 0);		
	}
	if islev == 49 {
		draw_text_transformed(x, y_, "Polish", scale, scale, 0);		
	}
	if islev == 50 {
		draw_text_transformed(x, y_, "Russian", scale, scale, 0);		
	}
	if islev == 51 {
		draw_text_transformed(x, y_, "Portuguese", scale, scale, 0);		
	}
	if islev == 52 {
		draw_text_transformed(x, y_, "Italian", scale, scale, 0);		
	}
	if islev == 53 {
		draw_text_transformed(x, y_, "French", scale, scale, 0);		
	}
	if islev == 54 {
		draw_text_transformed(x, y_, global.genel_yazilar[314], scale, scale, 0);		
	}
	if islev == 55 {
		draw_text_transformed(x, y_, global.genel_yazilar[316], scale, scale, 0);		
	}
	if islev == 56 {
		
	}	
}
