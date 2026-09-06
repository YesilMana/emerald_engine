function global_tanimlamalari() {
	//Oyunun başında tanımlanacak her şey buraya yazılacak
	genel_globaller();
	makrolar();
	
	global_muzik_tanimlamalari();
	karakter_tanimlama();
	array_tanimlama();
	yazi_fontu_tanimlama();
	kamera_globalleri();
	oyun_basi_calisacak_komutlar();
	yazi_animasyonu_globalleri();
	ana_karakter_sprite_tanimlama();
	enerji_global();
	secim_globalleri();
	takipci_global();
	nihai_globaller_1();
	tus_ini();
	joystick_globalleri();
	esya_yapim_globalleri();
	ates_yakim_globalleri();
	genel_bekleme_globalleri();
	esya_enum();
	konusma_tanimlama();
}	

function oyun_basi_calisacak_komutlar() {
	
}

function font_tanimlama() {
	
}

function tus_kontrol(obje, basildi_var, cekildi_var, surekli) {
	    if !instance_exists(obje) return;
		
		//if variable_instance_exists(obje, "opaklik") && obje.opaklik == 0 return;
		
	    var tus = obje;
	    var herhangi_dokunma = false;
    
	    variable_global_set(basildi_var, false);
	    variable_global_set(cekildi_var, false);
    
	    for (var i = 0; i < 5; i++) {
	        var mx = device_mouse_x(i);
	        var my = device_mouse_y(i);
        
	        if point_distance(mx, my, tus.x, tus.y) <= (tus.sprite_height * tus.image_xscale) / 2 + 2{
				if !duraklatmak {
		            if device_mouse_check_button_pressed(i, mb_left) {
		                variable_global_set(basildi_var, true);
		            }
            
		            if device_mouse_check_button_released(i, mb_left) {
		                variable_global_set(cekildi_var, true);
		            }
     
		            if device_mouse_check_button(i, mb_left) {
		                herhangi_dokunma = true;
						if surekli != undefined && surekli == 1 {
							variable_global_set(basildi_var, true);
						}
		            }
				}
	        }
	    }
	    tus.image_index = herhangi_dokunma ? 1 : 0;
}

function yazi_animasyonu_globalleri() {
	global.yazi_tam_metin = "Test Yazısı";
	global.yazi_yazilacak_metin = "";
	global.yazi_index = 0; 
	global.yazi_hiz = 1; 
	global.konusma_basladi = false;
	global.tus_scale = 0.9;
	global.tus_depth = -10000;
	global.menu_tus_basildi = 0;
	global.menu_tus_cekildi = 0;
	
	global.yukari_tiklandi = 0;
	global.asagi_tiklandi = 0;
	global.sag_tiklandi = 0;
	global.sol_tiklandi = 0;
	
	global.yukari_basildi = 0;
	global.asagi_basildi = 0;
	global.sol_basildi = 0;
	global.sag_basildi = 0;
	
	global.hizlanma_basildi = 0;
	global.envanter_kullan_basildi = 0;
	
	global.sekme_numara_envanter = 1;
	global.sekme_numara_craft = 6;
	global.sekme_numara_ates = 7;
	global.sekme_numara_stats = 4;
	global.sekme_numara_sandik = 5;
	global.sekme_numara_gorevler = 2;
	global.sekme_numara_ayarlar = 3;
}

function global_muzik_tanimlamalari() {

}

function karakter_tanimlama() {
	global.cikolata = obj_cikolata;	
	if oda_hizli global.cikolata_hareket_hizi = 1.5;
	if oda_hizli global.cikolata_hareket_hizi_hizli = 2;
	if oda_hizli global.cikolata_hareket_hizi_yavas = 0.5;
	global.cikolata_simdiki_hiz = global.cikolata_hareket_hizi;
	global.yavas_yurume = false;
}

function kamera_globalleri() {
	global.klavye_kontrolleri = false;
	//room_speed = 30;
	global.karakter_isinla_x = 0;
	global.karakter_isinla_y = 0;
	global.RES_SCALE = 3;
	if oda_hizli global.CAM_SMOOTH = 0.12; //Kameranın oyuncuyu ne kadar yumuşak takip edeceğini ayarlar (düşük değer daha yumuşak)
	if oda_yavas global.CAM_SMOOTH = 0.4; //Kameranın oyuncuyu ne kadar yumuşak takip edeceğini ayarlar (düşük değer daha yumuşak)
	global.cam_smooth_temel = global.CAM_SMOOTH;
	global.yatay_yukseklik = 747;
	if !global.android {
		global.RES_W = 599;
	
	}

	else {
		if !global.tablet_modu global.RES_W = global.yatay_yukseklik;
		else global.RES_W = 599;
			
	}
	
	var of_anam = 0;
	global.RES_H = 336;
	if of_anam global.RES_H = 370;
	global.kamera_takibi = global.cikolata;
}

function array_tanimlama() {
	global.konusmalar = [];	
	global.diyenler = [];
	global.konusma_tetikleyici = [];
	global.konusma_secenek = [];
}

function yazi_fontu_tanimlama() {
	//global.konusma_font = font_add("iovan.ttf", 32, false, false, ord(" "), ord("~"));
	font_add_enable_aa(true);	
	if global.dil = "russian" {
		global.konusma_font = fnt_russian;
		scribble_font_set_default("fnt_russian");
	}
	
	else if global.dil == "polish" {
		global.konusma_font = fnt_polish;
		scribble_font_set_default("fnt_polish");	
	}
	else if global.dil == "protuguese" {
		global.konusma_font = fnt_portuguese;
		scribble_font_set_default("fnt_portuguese");	
	}
	else {
		global.konusma_font = fnt_arial;
		scribble_font_set_default("fnt_arial");
	}
	draw_set_font(global.konusma_font);	
	
}

function tus_ini() {
	
	if global.android == false || global.klavye_kontrolleri {
		//Tuş atamaları
		
		var yukari_tus = ord("W");
		var asagi_tus = ord("S");
		var sol_tus = ord("A");
		var sag_tus = ord("D");
		var z_tus = ord("E");
		var x_tus = ord("R");
		var yeniden_baslat_tus = ord("P");
		var harita_tus = ord("M");
		/*
		var yukari_tus = vk_up;
		var asagi_tus = vk_down;
		var sol_tus = vk_left;
		var sag_tus = vk_right;
		var z_tus = ord("Z");
		var x_tus = ord("X");*/
		var menu_tus = vk_tab;
		var ayar_tus = vk_escape;
		var hizlanma_tus = vk_shift;
		var kullanim_tus = ord("F");
		var yavaslik_tus = vk_control;
		
		//Global tuş atamaları
			global.yavaslik_tusu_basildi = keyboard_check(yavaslik_tus);
			global.yukari_basildi = keyboard_check(yukari_tus);
			global.asagi_basildi = keyboard_check(asagi_tus);
			global.sol_basildi = keyboard_check(sol_tus);
			global.sag_basildi = keyboard_check(sag_tus);
			global.hizlanma_basildi = keyboard_check(hizlanma_tus);
		
			global.yukari_tiklandi = keyboard_check_pressed(yukari_tus);
			global.asagi_tiklandi = keyboard_check_pressed(asagi_tus);
			global.sag_tiklandi = keyboard_check_pressed(sag_tus);
			global.sol_tiklandi = keyboard_check_pressed(sol_tus);
			global.hizlanma_tiklandi = keyboard_check_pressed(hizlanma_tus);
			
			global.yukari_cekildi = keyboard_check_released(yukari_tus);
			global.asagi_cekildi = keyboard_check_released(asagi_tus);
			global.sol_cekildi = keyboard_check_released(sol_tus);
			global.sag_cekildi = keyboard_check_released(sag_tus);
			global.hizlanma_cekildi = keyboard_check_released(hizlanma_tus);
		
			global.z_basildi = keyboard_check_pressed(z_tus);
			global.z_cekildi = keyboard_check_released(z_tus);
			global.x_basildi = keyboard_check_pressed(x_tus);
			global.x_cekildi = keyboard_check_released(x_tus);
			global.menu_tus_basildi = keyboard_check_pressed(menu_tus);
			global.menu_tus_cekildi = keyboard_check_released(menu_tus);
			global.ayar_tus_basildi = keyboard_check_pressed(ayar_tus);
			global.ayar_tus_cekildi = keyboard_check_released(ayar_tus);
			global.envanter_kullan_basildi = keyboard_check_pressed(kullanim_tus);
			global.ana_menuye_donme_basildi = keyboard_check_pressed(yeniden_baslat_tus);
			global.ana_menuye_donme_cekildi = keyboard_check_released(yeniden_baslat_tus);
			global.harita_tus_basildi = keyboard_check(harita_tus);
			global.harita_tus_cekildi = keyboard_check_released(harita_tus);

	}
	
	if global.android && !global.klavye_kontrolleri {
		if global.android && (keyboard_check(ord("W")) || keyboard_check(ord("A")) || keyboard_check(ord("S")) || keyboard_check(ord("D"))) {
			global.android = false;
			global.klavye_kontrolleri = true;
		}
		var menu_tus = ord("C");
		var ayar_tus = vk_escape;
		tus_kontrol(obj_z_tus, "z_basildi", "z_cekildi");
		//tus_kontrol(obj_x_tus, "x_basildi", "x_cekildi");
		tus_kontrol(obj_menu_tus, "menu_tus_basildi", "menu_tus_cekildi");
		tus_kontrol(obj_shift, "hizlanma_basildi", "hizlanma_cekildi", 1);
		tus_kontrol(obj_envanter, "envanter_kullan_basildi", "envanter_kullan_cekildi");
		//tus_kontrol(obj_harita_tus, "harita_tus_basildi", "harita_tus_cekildi", true);
		if global.timer % 10 == 0 global.harita_tus_basildi = false;
		if instance_exists(obj_harita_tus) && obj_harita_tus.opaklik != 0 && global.ara_sahne_duracagi_saniye <= 0 {
			for (var i = 0; i < 5; i++) {
		        var mx = device_mouse_x(i);
		        var my = device_mouse_y(i);
				var tus = obj_harita_tus;
		        if point_distance(mx, my, tus.x, tus.y) <= (tus.sprite_height * tus.image_xscale) / 2 + 5 {
					if !duraklatmak {
			            if device_mouse_check_button(i, mb_left) {
								global.harita_tus_basildi = true;
						
			            }
					}
		        }
		    }
		}
		
		
		//tus_kontrol(obj_ana_menuye_don, "ana_menuye_donme_basildi", "ana_menuye_donme_cekildi");
		global.ayar_tus_basildi = keyboard_check_pressed(ayar_tus);
		global.ayar_tus_cekildi = keyboard_check_released(ayar_tus);
	}
}
