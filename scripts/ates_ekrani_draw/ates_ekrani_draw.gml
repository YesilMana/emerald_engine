function ates_ekrani_draw(){
	
	if (global.envanter_icerigi_gorunme && global.envanter_sekme == global.sekme_numara_ates) {
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
		var sayfa_baslangic = 0;
		if global.ates_ekrani_secim == 1 var secili_1 = global.ates_yakacaklar;
		if global.ates_ekrani_secim == 1 var mesajlar_1 = global.siniflandirma_yakacak;
		if global.ates_ekrani_secim == 2 var secili_1 = global.ates_kibritler;
		if global.ates_ekrani_secim == 2 var mesajlar_1 = global.siniflandirma_kibrit;
		var sayfa_bitis = array_length(secili_1);
		global.baloncuk_gorunurluk = false;
	    var goruntu_boyutu_x = camera_get_view_width(view_camera[0]); 
	    var toplam_uzunluk = yatay_atlama * (asagi_satira_gecis - 1);
	    var eleman_sayisi = 1;
		
	
	    var cam = view_camera[0];
	    var cam_x = camera_get_view_x(cam);
	    var cam_y = camera_get_view_y(cam);
		var cam_w = camera_get_view_width(cam);
		var cam_h = camera_get_view_height(cam);
		
		ates_yakinlik_kontrol();
		
		envanter_ana_arkaplan_ciz(cam_x, cam_y, cam_w, cam_h, sprite_boyut);
		
		ates_ekrani_resim_cizim(cam_x, cam_y, cam_w, cam_h);
		
		ates_yazisi_yaz(cam_x, cam_y, cam_w, cam_h);
		
		ates_baslangic_esyasi_secme();
		
		for (var i = sayfa_baslangic; i < sayfa_bitis; i++) {
		    var eleman_1 = secili_1[i];
			//show_message(string(secili_1));
			var eleman_i = string_delete(eleman_1, 1, 5);  // İlk 5 karakteri sil ("esya_")
			eleman_sayisi = real(eleman_i);
			
			
     
            var sayi = string(global.envanter[eleman_sayisi]);
            var isim = global.item_names[? "esya_" + string(eleman_sayisi)];
            var spr = asset_get_index("spr_esya_" + string(eleman_sayisi));
			var envanter_i = i;
            
		   
            var col = (envanter_i - 1) mod asagi_satira_gecis;
            var row = (envanter_i - 1) div asagi_satira_gecis;
            var x_cizim = cam_x + baslangic_x + (yatay_atlama * col) + 76; 
            var y_cizim = cam_y + baslangic_y + (dikey_atlama * row);

			ates_esya_ciz(x_cizim, y_cizim, sprite_boyut, spr, eleman_sayisi);

			var mouse_yakinlasti = (point_distance(mouse_x, mouse_y, x_cizim, y_cizim) < global.mouse_yakinlik);
            if mouse_yakinlasti && !duraklatmak {
				global.mouse_sprite_el[5] = 1;
				ates_mouse_hover_isle(i, eleman_sayisi, x_cizim, y_cizim, spr, sprite_boyut_secili, secili_1, mesajlar_1);
			}
			else {
				global.mouse_sprite_el[5] = 0;	
			}
        }
		
		ates_bilgi_menusu_ciz(cam_x, cam_y, baslangic_x, toplam_uzunluk, yatay_atlama);
		sekme_yaz(cam_x, cam_y, baslangic_x, baslangic_y, toplam_uzunluk, yatay_atlama);
	}
}

function bilgi_menusu_temel_ciz(cam_x, cam_y, baslangic_x, toplam_uzunluk, yatay_atlama) {
	draw_sprite_ext(spr_craft_bilgi_menusu, 0, baslangic_x + toplam_uzunluk + cam_x + yatay_atlama - 6, global.craft_baslangic_y - (sprite_get_height(spr_envanter_tekil_arka_plan) / 2) + cam_y - global.bilgi_menu_istisna, 1, 1, 0, global.gui_renk, 1);
}

function sekme_yaz(cam_x, cam_y, baslangic_x, baslangic_y, toplam_uzunluk, yatay_atlama) {
	if !duraklatmak {
		var yazim_x = cam_x + baslangic_x + 112;
		var yazim_y = cam_y + baslangic_y + 150;
		if global.ates_ekrani_secim == 1 var yazilacak = global.genel_yazilar[30];
		if global.ates_ekrani_secim == 2 var yazilacak = global.genel_yazilar[29];
		draw_set_halign(fa_center);
		draw_set_valign(fa_center);
		sayfa_yaz(yazim_x, yazim_y, yazilacak, global.envanter_yazi_scale, , global.baslik);
		
	}
}

function ates_bilgi_menusu_baslik_ciz(cam_x, cam_y, baslangic_x, toplam_uzunluk, yatay_atlama) {
	var yazim_x = baslangic_x + toplam_uzunluk + cam_x + yatay_atlama + 63;
	var yazim_y = global.craft_baslangic_y + cam_y - 25;
	draw_set_halign(fa_center);
	draw_set_valign(fa_center);
	sayfa_yaz(yazim_x, yazim_y, global.genel_yazilar[28], global.envanter_yazi_scale + 0.01, , global.baslik);
}

function ates_bilgi_menusu_ciz(cam_x, cam_y, baslangic_x, toplam_uzunluk, yatay_atlama) {
	bilgi_menusu_temel_ciz(cam_x, cam_y, baslangic_x, toplam_uzunluk, yatay_atlama);
	if !duraklatmak {
		ates_bilgi_menusu_baslik_ciz(cam_x, cam_y, baslangic_x, toplam_uzunluk, yatay_atlama)
		var yazici_x = baslangic_x + toplam_uzunluk + cam_x + yatay_atlama + 41;
		var yazici_y =  global.craft_baslangic_y + cam_y - 20;
		var engel_scale = 0.7;
		draw_set_halign(fa_left);
		draw_set_valign(fa_center);
		var yakacak_x = yazici_x;
		var yakacak_y = yazici_y + 70;
		var aralik = 30;
		
		var kibrit_x = yazici_x;
		var kibrit_y = yazici_y + 140;
		if global.atese_yakin {
			sayfa_yaz(yakacak_x - 36, yakacak_y - aralik, global.genel_yazilar[52], global.envanter_yazi_scale + 0.01, , global.baslik);
			if global.ates_yakacak_secilmis != "" {
				var sprite = asset_get_index("spr_esya_" + string(global.ates_yakacak_secilmis_no));
				draw_sprite_ext(sprite, 0, yakacak_x - 20, yakacak_y, 1, 1, 0, c_white, 1);
				sayfa_yaz(yakacak_x, yakacak_y, global.ates_yakacak_secilmis, global.envanter_yazi_scale, , global.alt_baslik);
			}
		
			else {
				draw_sprite_ext(spr_engellendi, 0, yakacak_x - 20, yakacak_y, engel_scale, engel_scale, 0, c_white, 1);
				sayfa_yaz(yakacak_x, yakacak_y, global.genel_yazilar[27], global.envanter_yazi_scale, , c_maroon);
			}
		}
		
		if global.atese_yakin && global.en_yakin_ates.yaniyor == 0 {
			sayfa_yaz(kibrit_x - 36, kibrit_y - aralik, global.genel_yazilar[53], global.envanter_yazi_scale + 0.01, , global.baslik);
			if global.ates_kibrit_secilmis != "" {
				var sprite = asset_get_index("spr_esya_" + string(global.ates_kibrit_secilmis_no));
				draw_sprite_ext(sprite, 0, kibrit_x - 20, kibrit_y, 1, 1, 0, c_white, 1);
				sayfa_yaz(kibrit_x, kibrit_y, global.ates_kibrit_secilmis, global.envanter_yazi_scale, , global.alt_baslik);
			}
		
			else {
				draw_sprite_ext(spr_engellendi, 0, kibrit_x - 20, kibrit_y, engel_scale, engel_scale, 0, c_white, 1);
				sayfa_yaz(kibrit_x, kibrit_y, global.genel_yazilar[26], global.envanter_yazi_scale, , c_maroon);
			}
		}
	}
}

function mouse_yaklasinca_sprite_buyume(x_cizim, y_cizim, spr, sprite_boyut_secili) {
	if (spr != -1) && !duraklatmak {
		draw_sprite_ext(spr, 0, x_cizim, y_cizim, sprite_boyut_secili, sprite_boyut_secili, 0, make_color_rgb(200, 200, 200), 1);
	}
}

function ates_mouse_hover_isle(i, eleman_sayisi, x_cizim, y_cizim, spr, sprite_boyut_secili, secili_1, mesajlar_1) {
	if !global.baloncuk_gorunurluk {
		global.baloncuk_cikis_id_x = x_cizim;
		global.baloncuk_cikis_id_y = y_cizim;
		global.baloncuk_gorunurluk = true;
		if mesajlar_1 == global.siniflandirma_kibrit {
			var bir_1 = global.siniflandirma_kibrit_1[? "esya_" + string(eleman_sayisi)];
			var ates_ihtimali = "%" + string(bir_1[? "ihtimal"]) + " " + global.genel_yazilar[17];
			global.ates_kibrit_secilmis_ihtimal = string(bir_1[? "ihtimal"]);
			global.baloncuk_mesaj = ates_ihtimali;
		}
		if mesajlar_1 == global.siniflandirma_yakacak {
			var bir_1 = global.siniflandirma_yakacak_1[? "esya_" + string(eleman_sayisi)];
			var ates_suresi = string(bir_1[? "sure"]);
			global.ates_yakacak_secilmis_sure = ates_suresi;
			var yazilacak_1 = ates_suresi + " " + global.genel_yazilar[16];
			global.baloncuk_mesaj = yazilacak_1;
		}
		global.baloncuk_baslik = global.item_names[? "esya_" + string(eleman_sayisi)];
	}
	
	if mouse_check_button_pressed(mb_left) {
		var ses = sfx_secenek_yakinlasma;
		audio_play_sound(ses, 1, false);
		audio_sound_gain(ses, global.ses_seviyesi);
		if mesajlar_1 == global.siniflandirma_yakacak {
			var babi = "esya_" + string(eleman_sayisi);
			var babi_2 = global.item_names[? babi];
			global.ates_yakacak_secilmis = babi_2;
			global.ates_yakacak_secilmis_no = eleman_sayisi;
			global.ates_yakacak_secilmis_sira = i;
			//show_message(global.ates_yakacak_secilmis);
		}
		if mesajlar_1 == global.siniflandirma_kibrit {
			var babi = "esya_" + string(eleman_sayisi);
			var babi_2 = global.item_names[? babi];
			global.ates_kibrit_secilmis = babi_2;
			global.ates_kibrit_secilmis_no = eleman_sayisi;
			global.ates_kibrit_secilmis_sira = i;
			//show_message(global.ates_yakacak_secilmis);
		}
	}
	mouse_yaklasinca_sprite_buyume(x_cizim, y_cizim, spr, sprite_boyut_secili);
}

function ates_baslangic_esyasi_secme() {
	if global.ates_ekrani_acildi {
		var kibritlerim = global.ates_kibritler;
		if array_length(kibritlerim) > 0 {
			var ilk_kibrit = kodunu_al(global.ates_kibritler[0]);
			var babi = "esya_" + string(ilk_kibrit);
			var babi_2 = global.item_names[? babi];
			global.ates_kibrit_secilmis = babi_2;
			global.ates_kibrit_secilmis_no = ilk_kibrit;
			global.ates_kibrit_secilmis_sira = 0;
			
			var bir_1 = global.siniflandirma_kibrit_1[? "esya_" + string(ilk_kibrit)];
			global.ates_kibrit_secilmis_ihtimal = string(bir_1[? "ihtimal"]);
		}
		
		var yakacaklarim = global.ates_yakacaklar;
		if array_length(yakacaklarim) > 0 {
			var ilk_yakacak = kodunu_al(global.ates_yakacaklar[0]);
			var babi = "esya_" + string(ilk_yakacak);
			var babi_2 = global.item_names[? babi];
			global.ates_yakacak_secilmis = babi_2;
			global.ates_yakacak_secilmis_no = ilk_yakacak;
			global.ates_yakacak_secilmis_sira = 0;	
			var bir_1 = global.siniflandirma_yakacak_1[? "esya_" + string(ilk_yakacak)];
			var ates_suresi = string(bir_1[? "sure"]);
			global.ates_yakacak_secilmis_sure = ates_suresi;
		}
		
		global.ates_ekrani_acildi = false;
	}
}

function atese_yakinlik_kontrol(x_hiza, y_hiza, atlama, gereklilik_scale, bilgilendirme_yazisi_scale) {
	var alet_x = x_hiza - 4;
	if global.secilmis_nesne_yapim_malzemesi_id == undefined {
		var alet_y = y_hiza;
	}
	
	else {
		var alet_y = y_hiza + atlama;
	}
	var ihtiyac_1 = global.craft_bilgi[? "esya_" + string(global.craft_kontrol_id)];
	var ihtiyac_2 = ihtiyac_1[? "ates"];
	global.ates_isleme_musait = true;
	if ihtiyac_2 != undefined {
		var renk = c_white;
		var yazi_renk = global.alt_baslik;
		var opaklik = 1;
		
		if !global.atese_yakin {
			renk = c_red;
			yazi_renk = c_maroon;
			opaklik = 0.4;
			global.ates_isleme_musait = false;
		}
		
		if global.atese_yakin && global.en_yakin_ates.yaniyor <= 0 {
			renk = c_red;
			yazi_renk = c_maroon;
			opaklik = 0.4;
			global.ates_isleme_musait = false;
		}
		if ates_malzemesi_gorunme { // sonunun 3 olmasının nedeni yapım malzemesinden sonra olması. yapım malzemesinde 2 kullandık
			draw_sprite_ext(spr_ates_sembol, 0, alet_x, alet_y + atlama, gereklilik_scale, gereklilik_scale, 0, renk, opaklik);
			draw_set_color(yazi_renk);
			draw_set_halign(fa_left);
			draw_set_valign(fa_center);
			sayfa_yaz(alet_x + 15, alet_y + atlama, global.genel_yazilar[31], global.envanter_yazi_scale, , yazi_renk);
		}
	}
}

function ates_esya_ciz(x_cizim, y_cizim, sprite_boyut, spr, eleman_sayisi) {
	if !duraklatmak {
		draw_sprite_ext(spr_envanter_tekil_arka_plan, 0, x_cizim, y_cizim, sprite_boyut, sprite_boyut, 0, global.gui_renk, 1);
		var istiklal = global.envanter[eleman_sayisi];
		if (spr != -1) && (istiklal > 0) {
			var cizim_opaklik = 1;
			var cizim_golge = 0.8;
			draw_sprite_ext(spr, 0, x_cizim - cizim_golge, y_cizim + cizim_golge, sprite_boyut, sprite_boyut, 0, c_black, 0.2);
			draw_sprite_ext(spr, 0, x_cizim, y_cizim, sprite_boyut, sprite_boyut, 0, c_white, cizim_opaklik);
		}
	}
}

function ates_yazisi_yaz(cam_x, cam_y, cam_w, cam_h) {
	if !duraklatmak {
		if ates_getir() == 1 {
			var dakika_1 = floor(global.en_yakin_ates.yaniyor / 60);
			var dakika = string(dakika_1);
			var saniye_1 = round(global.en_yakin_ates.yaniyor % 60);
			if saniye_1 < 10 var saniye = "0" + string(saniye_1);
			else var saniye = string(saniye_1);
			var yazilacak = dakika + " . " + saniye;
		}
	
		else if global.atese_yakin == true && global.en_yakin_ates.yaniyor == false {
			var yazilacak = wrap_text(global.genel_yazilar[14], 15);
		}
		
		else if global.atese_yakin == false {
			var yazilacak = wrap_text(global.genel_yazilar[25], 15);
		}
	
		draw_set_halign(fa_center);
		draw_set_valign(fa_left);
		if ates_getir() {
			var derecem = global.en_yakin_ates.sicaklik;
		}
		else var derecem = 0;
		if derecem == 0 derecem = 0.0001;
		var scale_4 = global.envanter_yazi_scale + 0.06;
		if ates_getir() sayfa_yaz(cam_x + global.craft_baslangic_x + 25, cam_y + global.craft_baslangic_y + 105, global.genel_yazilar[39] + ": " + string((derecem) * 280), scale_4, , global.alt_baslik);
		sayfa_yaz(cam_x + global.craft_baslangic_x + 25, cam_y + global.craft_baslangic_y + 85, yazilacak, scale_4, , global.alt_baslik);
	}
}

function ates_getir() {
	if global.atese_yakin && global.en_yakin_ates.yaniyor {
		return 1;
	}
	else {
		return 0;
	}	
}

function ates_parlama() {
	if global.ates_parlama {
		var scale = global.ates_parlama;
		draw_sprite_ext(spr_ates_ekrani_parlama, global.timer, global.ates_parlama_x, global.ates_parlama_y, scale, scale, 0, c_white, random_range(0.3, 0.5));
		global.ates_parlama -= 0.05;
		
		if global.ates_parlama < 0 {
			global.ates_parlama = false;
		}
	}	
}

function ates_ekrani_resim_cizim(cam_x, cam_y, cam_w, cam_h) {
	if !duraklatmak {
		x_cizim = cam_x + global.craft_baslangic_x - 14;
		y_cizim = cam_y + global.craft_baslangic_y;
		
		global.ates_parlama_x = x_cizim + (sprite_get_width(spr_ates_ekran) / 2);
		global.ates_parlama_y = y_cizim + (sprite_get_height(spr_ates_ekran) / 2);
	
		if ates_getir() == 1 {
			var opaklik_1 = 1;
		}
		else {
			var opaklik_1 = 0.4;
		}
	
		draw_sprite_ext(spr_ates_ekran, 0, x_cizim, y_cizim, 1, 1, 0, c_white, opaklik_1);
	}
	ates_parlama();
}