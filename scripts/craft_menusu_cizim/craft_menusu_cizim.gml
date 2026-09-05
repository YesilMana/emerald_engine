/// @function envanter_cizim_world()
/// @description Envanteri normal Draw eventinde çizer
function craft_menusu_cizim() {
	if (global.envanter_icerigi_gorunme && global.envanter_sekme == global.sekme_numara_craft) {
		var envanter_dolum_kontrolu = false;
	    var baslangic_y = global.craft_baslangic_y;
	    var baslangic_x = global.craft_baslangic_x + global.craft_yatay_atlama;
	    var yatay_atlama = global.craft_yatay_atlama;
	    var dikey_atlama = global.craft_dikey_atlama;
	    var asagi_satira_gecis = global.craft_asagi_satira_gecis;
		var sayfa_bitisi = global.craft_sayfa_bitis_satiri;
	    var sprite_boyut = global.envanter_scale;
	    var sprite_boyut_secili = global.envanter_scale + 0.1;
	    var yazi_boyutu = global.envanter_yazi_scale;
		var sayfa_baslangic = ((global.craft_ekrani_sayfasi - 1) * (global.craft_sayfa_bitis_satiri * global.craft_asagi_satira_gecis)) + 1;
		var sayfa_bitis = (global.craft_ekrani_sayfasi * (global.craft_sayfa_bitis_satiri * global.craft_asagi_satira_gecis));
		global.sayfa_bitisi = sayfa_bitis;
		if sayfa_bitis > ds_list_size(global.craft_ekrani_gosterilen_sinif) {
			sayfa_bitis = ds_list_size(global.craft_ekrani_gosterilen_sinif);
		}
	
		//if sayfa_baslangic == 0 sayfa_baslangic = 1;
    
	    // ======== ORTALAMA ========
	    var goruntu_boyutu_x = camera_get_view_width(view_camera[0]); // GUI yerine view genişliği
	    var toplam_uzunluk = yatay_atlama * (asagi_satira_gecis - 1);
	    var eleman_sayisi = 1;
		//var baslangic_x = (goruntu_boyutu_x / 2) - (toplam_uzunluk / 2); //Eğer ortalamak istersen
	
	    var cam = view_camera[0];
	    var cam_x = camera_get_view_x(cam);
	    var cam_y = camera_get_view_y(cam);
		var cam_w = camera_get_view_width(cam);
		var cam_h = camera_get_view_height(cam);
	
		// Ana envanter arka planı çiz
		envanter_ana_arkaplan_ciz(cam_x, cam_y, cam_w, cam_h, sprite_boyut);
    
	
	        
		for (var i = sayfa_baslangic; i <= sayfa_bitis; i++) {
			if (i < ds_list_size(global.craft_ekrani_gosterilen_sinif)) {
		        var eleman = ds_list_find_value(global.craft_ekrani_gosterilen_sinif, i);
		        var eleman_i = string_copy(eleman, 6, string_length(eleman) - 5);  // "esya_" den sonrasını al
		        eleman_sayisi = real(eleman_i);
		    } 
			
			else {
				global.craft_ekrani_son_oge = sayfa_bitis;
				break;
		    }
			
    
            var sayi = string(global.envanter[eleman_sayisi]);
            var isim = global.item_names[? "esya_" + string(eleman_sayisi)];
            var spr = asset_get_index("spr_esya_" + string(eleman_sayisi));
			
			var envanter_i = i - ((global.craft_ekrani_sayfasi - 1) * (global.craft_sayfa_bitis_satiri * global.craft_asagi_satira_gecis));
            

            var col = (envanter_i - 1) mod asagi_satira_gecis;
            var row = (envanter_i - 1) div asagi_satira_gecis;
            var x_cizim = cam_x + baslangic_x + (yatay_atlama * col); 
            var y_cizim = cam_y + baslangic_y + (dikey_atlama * row);
			
			if global.craft_opaklik_kontrol {
				global.craft_edilebilir_mi[i] = craft_edilebilir_mi("esya_" + string(eleman_sayisi));
			}
            
		    // Eşya çizimi
			envanter_esya_ciz(x_cizim, y_cizim, sprite_boyut, spr, global.craft_edilebilir_mi[i]);
			
            // Adet yazısı çizimi
			//envanter_adet_yazisi_ciz(x_cizim, y_cizim, sayi, yazi_boyutu);
           
			var mouse_yakinlasti = (point_distance(mouse_x, mouse_y, x_cizim, y_cizim) < global.mouse_yakinlik);
		
            if mouse_yakinlasti && !duraklatmak{
				global.mouse_sprite_el[4] = 1;
				// Mouse hover işlemleri
				envanter_mouse_hover_isle(i, eleman_sayisi, x_cizim, y_cizim, spr, sprite_boyut_secili, global.craft_edilebilir_mi[i]);
			}	
			else {
			 global.mouse_sprite_el[4] = 0;	
			}
		
			
			
        }// for döngüsü çıkış 
			
		if global.isleme_tetik {
			yenile();
			global.isleme_tetik = false;
		}
		
		craft_et();
		
		// Baloncuk kontrolü
		envanter_baloncuk_kontrol();
		
		// Mouse tık kontrolü
		envanter_mouse_tik_kontrol();
		
		// Sayfa numarası çiz
		envanter_sayfa_numarasi_ciz(cam_x, cam_y, baslangic_x, baslangic_y, yazi_boyutu);
		
		// Craft bilgi menüsü çiz
		envanter_craft_bilgi_menusu_ciz(cam_x, cam_y, baslangic_x, toplam_uzunluk, yatay_atlama, global.craft_sonuc_adet);
		
		global.craft_opaklik_kontrol = false;
	}
}

/// @function envanter_ana_arkaplan_ciz(cam_x, cam_y, cam_w, cam_h, sprite_boyut)
function envanter_ana_arkaplan_ciz(cam_x, cam_y, cam_w, cam_h, sprite_boyut) {
	var envanter_apha = global.envanter_alpha;
	draw_set_alpha(envanter_apha);
	draw_set_colour(c_black);
	draw_rectangle(-1000, -1000, 6000, 6000, false);
	draw_set_alpha(1);
	draw_set_colour(c_white);
	draw_sprite_ext(sprite_index, 0, cam_x + (cam_w / 2), cam_y + (cam_h / 2), sprite_boyut, sprite_boyut, 0, global.gui_renk, opaklik);
}

/// @function envanter_esya_ciz(x_cizim, y_cizim, sprite_boyut, spr, craftlanma)
function envanter_esya_ciz(x_cizim, y_cizim, sprite_boyut, spr, craftlanma) {
	draw_sprite_ext(spr_envanter_tekil_arka_plan, 0, x_cizim, y_cizim, sprite_boyut, sprite_boyut, 0, global.gui_renk, 1);
	if (spr != -1) {
		if craftlanma == true var cizim_opaklik = 1;
		var cizim_golge = 0.8;
		if craftlanma draw_sprite_ext(spr, 0, x_cizim - cizim_golge, y_cizim + cizim_golge, sprite_boyut, sprite_boyut, 0, c_black, 0.2);
		else {
			var cizim_opaklik = 0.4;
			
			draw_sprite_ext(spr_envanter_tekil_arka_plan, 0, x_cizim, y_cizim, sprite_boyut, sprite_boyut, 0, c_black, 0.1);
		}
		draw_sprite_ext(spr, 0, x_cizim, y_cizim, sprite_boyut, sprite_boyut, 0, c_white, cizim_opaklik);
	}
}

/// @function envanter_adet_yazisi_ciz(x_cizim, y_cizim, sayi, yazi_boyutu)
function envanter_adet_yazisi_ciz(x_cizim, y_cizim, sayi, yazi_boyutu) {
	if sayi != 1 {
		var sayi_konum_x = x_cizim + 2;
		var sayi_konum_y = y_cizim + 4;
		draw_set_halign(fa_left);
		draw_set_valign(fa_left);
		sayfa_yaz(sayi_konum_x + 0.5, sayi_konum_y + 0.5, sayi, yazi_boyutu, , c_black);
		sayfa_yaz(sayi_konum_x, sayi_konum_y, sayi, yazi_boyutu, , global.alt_baslik);
	}
}



/// @function envanter_mouse_hover_isle(i, eleman_sayisi, x_cizim, y_cizim, spr, sprite_boyut_secili)
function envanter_mouse_hover_isle(i, eleman_sayisi, x_cizim, y_cizim, spr, sprite_boyut_secili, craft_edilebilir) {
	if mouse_check_button_released(mb_left) {
		global.isleme_tetik = true;
		var ses = sfx_secenek_yakinlasma;
		audio_play_sound(ses, 1, false);
		audio_sound_gain(ses, global.ses_seviyesi);
	}
	
	if mouse_check_button_pressed(mb_left) {
		
		global.isleme_tetik = true;
		global.uretilecek = 1;	
		global.craft_ekrani_secim = i;
		global.craft_kontrol_id = eleman_sayisi;
		var basim_1 = global.craft_bilgi[? "esya_" + string(eleman_sayisi)];
		global.craft_icin_secilmis = eleman_sayisi;
		var basim_2 = basim_1[? "uretim_icin_gereken"];
		global.secilmis_nesne_yapim_malzemesi_id = basim_2;
		global.craft_ekrani_satir = 1;
	}
	
	if !global.baloncuk_gorunurluk {
		global.baloncuk_cikis_id_x = x_cizim;
		global.baloncuk_cikis_id_y = y_cizim;
		global.baloncuk_gorunurluk = true;
		global.baloncuk_mesaj = global.esya_bilgilendirme_metinleri[eleman_sayisi];
		global.baloncuk_baslik = global.item_names[? "esya_" + string(eleman_sayisi)];
	}
	
	if (spr != -1) {
		if craft_edilebilir == 1 {
			draw_sprite_ext(spr, 0, x_cizim, y_cizim, sprite_boyut_secili, sprite_boyut_secili, 0, make_color_rgb(200, 200, 200), 1);
		}
	}
	
	if craft_secim_yapildi && mouse_check_button_pressed(mb_left) {
		envanter_craft_secim_isle(eleman_sayisi);
	}
}

function alet_analizi() {
	var key_1 = "esya_" + string(global.secilmis_nesne_yapim_malzemesi_id);
	global.yapim_malzemesi_isim = global.item_names[? key_1];
	if global.secilmis_nesne_yapim_malzemesi_id != undefined && global.envanter[global.secilmis_nesne_yapim_malzemesi_id] > 0  {
		var key_1 = "esya_" + string(global.secilmis_nesne_yapim_malzemesi_id);
		global.yapim_malzemesi_isim = global.item_names[? key_1];
		var key_2 = siradakini_bul(global.yapim_secim, global.secilmis_nesne_yapim_malzemesi_id);
		if key_2 == undefined {
			var key_2 = hangi_slotta(global.secilmis_nesne_yapim_malzemesi_id);
			var key_3 = global.envanter_list[| key_2];
		}
		else var key_3 = global.envanter_list[| key_2];
		var key_4 = key_3[? "saglamlik"];
		global.yapim_malzemesi_yazilacak = global.yapim_malzemesi_isim + ": %" + string(key_4);
		global.yapim_malzemesi_eksik = false;
		
	}
	
	if global.secilmis_nesne_yapim_malzemesi_id != undefined && global.envanter[global.secilmis_nesne_yapim_malzemesi_id] == 0 {
		global.yapim_malzemesi_eksik = true;
		global.craft_sonuc = false;
	}	
}

/// @function envanter_craft_secim_isle(eleman_sayisi)
function envanter_craft_secim_isle(eleman_sayisi) {
	if eleman_sayisi != undefined && global.envanter_sekme == global.sekme_numara_craft {
		global.craft_gerekenler_id = [];
		global.craft_gerekenler_adet = [];
		global.gereken_esyalar_bulunabilirlik = [];
		alet_analizi();
		var key = "esya_" + string(eleman_sayisi);
		var malzemeler = global.craft_bilgi[? key]; //Seçilen eşyanın içine giriyor ve malzemeler değişkenine atıyor
		var uretim_adet = "";

		if (malzemeler != undefined) { //Eğer içinde elemanlar varsa (craft edilecek eşyalar)
			var item_name = global.item_names[? key]; //İsmini json dosyasından çekiyor
			var uretim_adet_0 = malzemeler[? "uretim_adedi"];
			global.craft_sonuc_adet = uretim_adet_0;
			var deli_0 = "\n\n";
			uretim_adet = deli_0;
			if uretim_adet_0 != undefined uretim_adet += string(uretim_adet_0) + " ";
			var deli_1c = "\n\n\n" 
			var deli_3 = global.genel_yazilar[0] + ":\n";
			var deli_2c = wrap_text(deli_1c, 30);
			global.craft_ekrani_bilgilendirme = deli_2c + deli_3;
			var map_key = ds_map_find_first(malzemeler); //Seçilen eşyanın içindeki ilk değişkeni alıyor
		
			while map_key != undefined { //İçindeki değişkenler bitene kadar
				var adet = malzemeler[? map_key]; 
				var malzeme_isim = global.item_names[? map_key];
			
				if malzeme_isim != undefined {
					var id_str = string_delete(map_key, 1, 5);
					var malzeme_id = real(id_str);
					array_push(global.craft_gerekenler_id, malzeme_id);
					array_push(global.craft_gerekenler_adet, adet);
					global.craft_ekrani_bilgilendirme += string(adet) + "x " + malzeme_isim + " \n";
					var craftizm = global.envanter[malzeme_id];
					array_push(global.gereken_esyalar_bulunabilirlik, craftizm);
				}
			
				map_key = ds_map_find_next(malzemeler, map_key);
			}   
		}
	}
}

function envanter_baloncuk_kontrol() {
	if global.baloncuk_gorunurluk {
		if point_distance(mouse_x, mouse_y, global.baloncuk_cikis_id_x, global.baloncuk_cikis_id_y) >= global.mouse_yakinlik {
			global.baloncuk_gorunurluk = false;	
		}
	}
}

function craft_son_kontrol() {
		var analiz = bos_slotu_bul();
		global.envanter_analizi = analiz;
		var craft_kontrol = craft_edilebilir_mi("esya_" + string(global.craft_kontrol_id));
		var craft_sonucu = craft_kontrol && ((global.secilmis_nesne_yapim_malzemesi_id != undefined && global.yapim_malzemesi_eksik == false) || (global.secilmis_nesne_yapim_malzemesi_id == undefined )) && !global.craft_tusu_baslama_dayaniklilik && global.ates_isleme_musait && !global.kalori_sinirini_asiyor;
		global.craft_sonuc = craft_sonucu;
}

function envanter_mouse_tik_kontrol() {
	if mouse_check_button_pressed(mb_left) {
		craft_son_kontrol();
	}
}

/// @function envanter_sayfa_numarasi_ciz(cam_x, cam_y, baslangic_x, baslangic_y, yazi_boyutu)
function envanter_sayfa_numarasi_ciz(cam_x, cam_y, baslangic_x, baslangic_y, yazi_boyutu) {
	var ekran_sayfasi_x = global.craft_baslangic_x + (sprite_get_width(spr_hasta_ekrani_temel)) / 2 - 48 + cam_x;
	var ekran_sayfasi_y = global.craft_baslangic_y + 145 + cam_y;
	draw_set_halign(fa_center);
	draw_set_valign(fa_center);
	draw_set_color(c_black);
	sayfa_yaz(ekran_sayfasi_x + 0.5, ekran_sayfasi_y + 0.5, string(global.craft_ekrani_sayfasi), yazi_boyutu, , c_black);
	draw_set_color(c_white);
	sayfa_yaz(ekran_sayfasi_x, ekran_sayfasi_y, string(global.craft_ekrani_sayfasi), yazi_boyutu, , global.alt_baslik);
}

function envanter_craft_bilgi_menusu_ciz(cam_x, cam_y, baslangic_x, toplam_uzunluk, yatay_atlama, son_adet) {
	bilgi_menusu_temel_ciz(cam_x, cam_y, baslangic_x, toplam_uzunluk, yatay_atlama);

	if craft_secim_yapildi && !duraklatmak {
		draw_set_color(c_black);
		draw_set_halign(fa_left);
		draw_set_valign(fa_left);
		var bilgilendirme_yazisi_scale = global.envanter_yazi_scale;
		draw_set_color(c_white);
		draw_set_halign(fa_center);
		draw_set_valign(fa_center);
		
		//Üretim adedi yazma
		var esya_ds_map_1 = global.craft_bilgi[? "esya_" + string(global.craft_kontrol_id)];
		var esya_ds_map_2 = esya_ds_map_1[? "uretim_adedi"];
		var uretim_adet_1 = global.uretilecek;
		var uretim_adet_3 = uretim_adet_1;
		if esya_ds_map_2  != undefined uretim_adet_3 = uretim_adet_1 * esya_ds_map_2;
		
		sayfa_yaz(cam_x + global.craft_baslangic_x + (sprite_get_width(spr_hasta_ekrani_temel)) - 108, cam_y + global.craft_baslangic_y + 145, string(uretim_adet_3), global.envanter_scale / 4, , global.alt_baslik);
		
		var secili_sprite = asset_get_index("spr_esya_" + string(global.craft_icin_secilmis));
		draw_set_halign(fa_left);
		draw_set_valign(fa_left);
		var craft_edilecek_cizim_x = baslangic_x + toplam_uzunluk + cam_x + yatay_atlama + 21;
		var craft_edilecek_cizim_y =  global.craft_baslangic_y + cam_y - 34;
		
		if secili_sprite != -1 {
			draw_sprite_ext(secili_sprite, 0, craft_edilecek_cizim_x, craft_edilecek_cizim_y, global.envanter_scale, global.envanter_scale, 0, c_white, 1);
		}
		
		if son_adet != undefined && son_adet != 1 {
			global.uretim_adedi = son_adet;
		}
		else {
			global.uretim_adedi = 0;	
		}
		
		var keyim_1 = global.item_names[? "esya_" + string(global.craft_icin_secilmis)];
		draw_set_halign(fa_left);
		draw_set_valign(fa_center);
		global.uretim_adet_engeli = false;	
		
		//Gereken eşya kontrolü
		for (var h = 0; h < array_length(global.gereken_esyalar_bulunabilirlik); h++) {
			var sahip_olunan = global.gereken_esyalar_bulunabilirlik[h];
			var uretim_icin_gereken_a = global.craft_gerekenler_adet[h];
			var siprit = asset_get_index("spr_esya_" + string(global.craft_gerekenler_id[h]));
			var isim = global.item_names[? "esya_" + string(global.craft_gerekenler_id[h])];
			var atlama = global.craft_esya_atlama;
			var x_hiza = craft_edilecek_cizim_x;
			var y_hiza = craft_edilecek_cizim_y + ((h + 1) * atlama) + 20 - ( global.craft_esya_atlama * (global.craft_ekrani_satir - 1));
			var opaklikmi = 1;
			var gereklilik_scale = 0.75;
			var renk_1 = c_white;
			var renk_yazi = global.alt_baslik;
			var uretim_icin_gereken = uretim_icin_gereken_a * global.uretilecek;
			
			if sahip_olunan < uretim_icin_gereken {
				opaklikmi = 0.4;
				renk_1 = c_red;
				renk_yazi = c_maroon;
			}
			
			if sahip_olunan < uretim_icin_gereken_a * (global.uretilecek + 1) {
				global.uretim_adet_engeli = true;	
			}
			
			if h >= global.craft_ekrani_satir - 1 && h < global.craft_ekrani_satir + 4 {
				draw_sprite_ext(siprit, 0, x_hiza - 4, y_hiza, gereklilik_scale, gereklilik_scale, 0, renk_1, opaklikmi);
				var yazimcik_1 = string(sahip_olunan) + "\\" + string(uretim_icin_gereken) + " " + isim;
				var yazimcik_2 = wrap_text(yazimcik_1, 20);
				draw_set_color(renk_yazi);
				sayfa_yaz(x_hiza + 10, y_hiza, yazimcik_2, global.envanter_yazi_scale, , renk_yazi);
			}
			global.craft_malzeme_baslama = h;
		}
		
		
		uretilecek_nesne_yazim(craft_edilecek_cizim_x, craft_edilecek_cizim_y, keyim_1)
		
		yapim_malzeme_kontrol(x_hiza, y_hiza, atlama, gereklilik_scale, bilgilendirme_yazisi_scale);
		
		atese_yakinlik_kontrol(x_hiza, y_hiza, atlama, gereklilik_scale, bilgilendirme_yazisi_scale);
	}
}

function uretilecek_nesne_yazim(craft_edilecek_cizim_x, craft_edilecek_cizim_y, keyim_1) {
	draw_set_color(c_white);
		var keyim_2 = wrap_text(keyim_1, 18);
		sayfa_yaz(craft_edilecek_cizim_x + 22, craft_edilecek_cizim_y, keyim_2, global.envanter_yazi_scale, , global.baslik);
		draw_set_valign(fa_left);
		sayfa_yaz(craft_edilecek_cizim_x - 16, craft_edilecek_cizim_y + 22, global.genel_yazilar[0], global.envanter_yazi_scale, , global.baslik);
			
}

function yapim_malzeme_kontrol(x_hiza, y_hiza, atlama, gereklilik_scale, bilgilendirme_yazisi_scale) {
		var alet_x = x_hiza - 4;
		var alet_y = y_hiza + atlama;
		var renk_2 = global.alt_baslik;
		var renk_3 = global.alt_baslik;
		var opaklik_2 = 1;
		
		//Yapım malzemesinin çizimleri
		if global.secilmis_nesne_yapim_malzemesi_id != undefined && global.yapim_malzemesi_eksik == false {
			if global.nesne_dayaniklilik_deger < global.nesne_dayaniklilik_dusus {
				renk_2 = c_red;
				renk_3 = c_maroon;
				opaklik_2 = 0.4;	
			}
			
			var mouse_yakinlik = point_distance(mouse_x, mouse_y, alet_x, alet_y); 
		
			if mouse_yakinlik < 30 {
				renk_2 = c_lime;
				renk_3 = c_white;
				opaklik_2 = 1;	
				
				if mouse_check_button_pressed(mb_left) {
					var hesap = kac_slotta_var(global.secilmis_nesne_yapim_malzemesi_id);
					if global.yapim_secim < hesap {
						global.yapim_secim += 1;
					}
					
					else {
						global.yapim_secim = 1;	
					}
					yenile();
				}
			}
		}
		
		else if global.yapim_malzemesi_eksik == true && global.secilmis_nesne_yapim_malzemesi_id != undefined {
			renk_2 = c_red;
			renk_3 = c_maroon;
			opaklik_2 = 0.4;
			var item_ismi = global.item_names[? "esya_" + string(global.secilmis_nesne_yapim_malzemesi_id)];
			global.yapim_malzemesi_yazilacak = item_ismi;
			
		}
		
		if global.secilmis_nesne_yapim_malzemesi_id == undefined {
			global.yapim_malzemesi_yazilacak = "";	
		}
			
		if yapim_malzemesi_gorunme {
			var yapim_sprite = asset_get_index("spr_esya_" + string(global.secilmis_nesne_yapim_malzemesi_id));
			draw_sprite_ext(yapim_sprite, 0, alet_x, alet_y, gereklilik_scale, gereklilik_scale, 0, renk_2, opaklik_2);
			draw_set_color(renk_3);
			draw_set_valign(fa_center);
			if !global.yapim_malzemesi_eksik {
				var yazici_1 = string(global.yapim_malzemesi_yazilacak) + "/" + string(global.nesne_dayaniklilik_dusus);
			}
			else {
				var yazici_1 = string(global.yapim_malzemesi_yazilacak);
			}	
			sayfa_yaz(alet_x + 14, alet_y, yazici_1, bilgilendirme_yazisi_scale, , renk_3);	
		}
		
		draw_set_color(c_white);
}

