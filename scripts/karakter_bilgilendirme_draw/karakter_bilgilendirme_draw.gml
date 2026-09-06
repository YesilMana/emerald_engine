function karakter_bilgilendirme_draw(){
	if (global.envanter_icerigi_gorunme && global.envanter_sekme == global.sekme_numara_stats) {
		global.baloncuk_gorunurluk = false;
		var envanter_dolum_kontrolu = false;
	    var baslangic_y = global.craft_baslangic_y;
	    var baslangic_x = global.craft_baslangic_x;
	    var yatay_atlama = global.craft_yatay_atlama;
	    var dikey_atlama = global.craft_dikey_atlama;
	    var asagi_satira_gecis = global.craft_asagi_satira_gecis;
		var sayfa_bitisi = global.craft_sayfa_bitis_satiri;
	    var sprite_boyut = global.envanter_scale;
	    var sprite_boyut_secili = global.envanter_scale + 0.05;
	    var yazi_boyutu = global.envanter_yazi_scale;
		var sayfa_baslangic = 1;
		var sayfa_bitis = global.karakter_kontrol_sayisi;
	
	    var cam = view_camera[0];
	    var cam_x = camera_get_view_x(cam);
	    var cam_y = camera_get_view_y(cam);
		var cam_w = camera_get_view_width(cam);
		var cam_h = camera_get_view_height(cam);
		var toplam_uzunluk = yatay_atlama * (asagi_satira_gecis - 1);
	
		envanter_ana_arkaplan_ciz(cam_x, cam_y, cam_w, cam_h, sprite_boyut);
		
		karakter_bilgi_cizim(cam_x, cam_y, cam_w, cam_h, baslangic_x, baslangic_y, sayfa_baslangic, sayfa_bitis, asagi_satira_gecis, yatay_atlama, dikey_atlama, sprite_boyut, sprite_boyut_secili, toplam_uzunluk);
	}
	kucuk_bildirim_simgeleri();
}

function kucuk_bildirim_simgeleri() {
	if global.kucuk_stats_simgeleri {
		if zaman_dur exit;
		var cam = view_camera[0];
		var cam_x = camera_get_view_x(cam);
		var cam_y = camera_get_view_y(cam);
		var cam_w = camera_get_view_width(cam);
		var cam_h = camera_get_view_height(cam);
		var toplam_uyari = 0;
		static kirmizi = 160;
		if kirmizi < 255 {
			kirmizi += 2;	
		}
	
		else {
			kirmizi = 160;	
		}
	
		var renk = make_color_rgb(kirmizi, 100, 100);
	
		var kenar_uzaklik = 20;
		var atlama_uzaklik = 20;
		var scale = 0.5;
		var x_cizim = cam_x + cam_w - kenar_uzaklik;
		var y_cizim = cam_y + cam_h - kenar_uzaklik;
		if !global.android {
			x_cizim = cam_x + cam_w - kenar_uzaklik;
			y_cizim = cam_y + cam_h - kenar_uzaklik;
		}
		else {
			kenar_uzaklik = 30;
			atlama_uzaklik = 25;
			scale = 0.5;
			x_cizim = cam_x + (cam_w / 2) + (atlama_uzaklik * 1.5);//Ortala
			y_cizim = cam_y + cam_h - (kenar_uzaklik * 1.3);
		}
		if !global.android {
			x_cizim = cam_x + cam_w - kenar_uzaklik;
			y_cizim = cam_y + cam_h - kenar_uzaklik;
		}
		else {
			kenar_uzaklik = 30;
			atlama_uzaklik = 25;
			scale = 0.5;
			x_cizim = cam_x + (cam_w / 2) + (atlama_uzaklik * 1.5);//Ortala
			y_cizim = cam_y + cam_h - (kenar_uzaklik * 1.3);
		}

	
		//for (var i = 1; i <= global.karakter_kontrol_sayisi; i++) {
		for (var i = global.karakter_kontrol_sayisi; i >= 1; i--) {
		
			var globali = stat_rakam_tanimlama(i);
		
		
				toplam_uyari += 1;
				var x_son = x_cizim - ((toplam_uyari - 1) * atlama_uzaklik);
				var titresim = (20 - globali) / 7;
				var x_rast = random_range(x_son - titresim, x_son + titresim);
				var y_rast = random_range(y_cizim - titresim, y_cizim + titresim);
				var sprite_isim = "spr_stats_" + string(i);
				var sprite_id = asset_get_index(sprite_isim);
				var daire_index = round((globali / 100) * 37);
				var daire_scale = scale - 0.02;
			if globali < 20 {
				draw_sprite_ext(sprite_id, 0, x_rast, y_rast, scale, scale, 0, renk, 1);
				draw_sprite_ext(spr_stats_daire, daire_index, x_rast, y_rast, daire_scale, daire_scale, 0, renk, 1);
			}
		
			else {
				var yukselen_scale = scale - 0.3;
				draw_sprite_ext(sprite_id, 0, x_son, y_cizim, scale, scale, 0, global.gui_renk, global.stat_minik_opaklik[i]);
				draw_sprite_ext(spr_stats_daire, daire_index, x_son, y_cizim, daire_scale, daire_scale, 0, global.gui_renk, global.stat_minik_opaklik[i]);
				var hesap = global.stat_liste[i];
				if hesap < 0 {
					yukselen_scale *= -1;
					hesap = -hesap;
				}
				if hesap != 0 {
					/*if global.stat_minik_opaklik[i] < 1.4 {
						global.stat_minik_opaklik[i] += 0.04;	
					}*/
					draw_sprite_ext(spr_stats_yukselip_alcalma, hesap, x_son + 6, y_cizim + 4, scale - 0.3, yukselen_scale, 0, global.gui_renk, global.stat_minik_opaklik[i]);
				}
		
				else {
					/*
					if global.stat_minik_opaklik[i] > -0.05 {
						global.stat_minik_opaklik[i] -= 0.04;	
					}	*/
				}

			
	
			}
			stat_seviye_degisim_tanimlama(i);
		}	
	}
	else {
		if !global.stats_gorunme exit;
	    if (zaman_dur) exit;
	
	    var cam = view_camera[0];
	    var cam_x = camera_get_view_x(cam);
	    var cam_y = camera_get_view_y(cam);
	    var cam_w = camera_get_view_width(cam);
	    var cam_h = camera_get_view_height(cam);
	
	    // Kırmızı yanıp sönme efekti
	    static kirmizi = 160;
	    if (kirmizi < 255) {
	        kirmizi += 2;	
	    } else {
	        kirmizi = 160;	
	    }
	    var renk = make_color_rgb(kirmizi, 100, 100);
	
	    // Pozisyon ve Ölçek Ayarları
	    var kenar_uzaklik, scale, x_cizim, y_cizim;
	
	    if (!global.android) {
	        kenar_uzaklik = 20;
	        scale = 0.5;
	        x_cizim = cam_x + cam_w - kenar_uzaklik;
	        y_cizim = cam_y + cam_h - (kenar_uzaklik / 1.6);
	    } else {
	        kenar_uzaklik = 30;
	        var atlama_uzaklik = 25;
	        scale = 0.5;
	        x_cizim = cam_x + (atlama_uzaklik); // Ortala
	        y_cizim = cam_y + (kenar_uzaklik);
	    }

	    // SADECE 1. STAT İÇİN KONTROL VE ÇİZİM
	    var i = 1;
	    var globali = stat_rakam_tanimlama(i);
	
	    var sprite_isim = "spr_stats_" + string(i);
	    var sprite_id = asset_get_index(sprite_isim);
	    var daire_index = round((globali / 100) * 37);
	    var daire_scale = scale - 0.02;

	    // Stat 20'den küçükse (Titreme efekti ve kırmızı renk)
	    if (globali < 20) {
	        var titresim = (20 - globali) / 7;
	        var x_rast = random_range(x_cizim - titresim, x_cizim + titresim);
	        var y_rast = random_range(y_cizim - titresim, y_cizim + titresim);
		
	        draw_sprite_ext(sprite_id, 0, x_rast, y_rast, scale, scale, 0, renk, 1);
	        draw_sprite_ext(spr_stats_daire, daire_index, x_rast, y_rast, daire_scale, daire_scale, 0, renk, 1);
	    }
	    // Stat normalse (Normal renk ve yükselip alçalma oku)
	    else {
	        var yukselen_scale = scale - 0.3;
	        draw_sprite_ext(sprite_id, 0, x_cizim, y_cizim, scale, scale, 0, global.gui_renk, global.stat_minik_opaklik[i]);
	        draw_sprite_ext(spr_stats_daire, daire_index, x_cizim, y_cizim, daire_scale, daire_scale, 0, global.gui_renk, global.stat_minik_opaklik[i]);
		
	        var hesap = global.stat_liste[i];
	        if (hesap < 0) {
	            yukselen_scale *= -1;
	            hesap = -hesap;
	        }
		
	        if (hesap != 0) {
	            draw_sprite_ext(spr_stats_yukselip_alcalma, hesap, x_cizim + 6, y_cizim + 4, scale - 0.3, yukselen_scale, 0, global.gui_renk, global.stat_minik_opaklik[i]);
	        }
	    }
	
	    stat_seviye_degisim_tanimlama(i);
	}
}

function karakter_bilgi_cizim(cam_x, cam_y, cam_w, cam_h, baslangic_x, baslangic_y, sayfa_baslangic, sayfa_bitis, asagi_satira_gecis, yatay_atlama, dikey_atlama, sprite_boyut, sprite_boyut_secili, toplam_uzunluk) {
	var x_cizim = cam_x + baslangic_x;
	var y_cizim = cam_y + baslangic_y;
	
	bilgi_menusu_temel_ciz(cam_x, cam_y, baslangic_x, toplam_uzunluk + 38, yatay_atlama);
	
	for (var i = sayfa_baslangic; i <= sayfa_bitis; i++) {


        var col = (i - 1) mod asagi_satira_gecis;
        var row = (i - 1) div asagi_satira_gecis;
        var x_cizim = cam_x + baslangic_x + (yatay_atlama * col); 
        var y_cizim = cam_y + baslangic_y + (dikey_atlama * row);
        
		draw_sprite_ext(spr_envanter_tekil_arka_plan, 0, x_cizim, y_cizim, sprite_boyut, sprite_boyut, 0, global.gui_renk, 1);
		var sprite_isim = "spr_stats_" + string(i);
		var sprite_id = asset_get_index(sprite_isim);
		draw_sprite_ext(sprite_id, 0, x_cizim, y_cizim, sprite_boyut, sprite_boyut, 0, global.gui_renk, 1);
		var mouse_yakinlasti = (point_distance(mouse_x, mouse_y, x_cizim, y_cizim) < global.mouse_yakinlik);
        stats_seviye_degisim_draw(x_cizim, y_cizim, i);
		if mouse_yakinlasti && !duraklatmak {
			mouse_yaklasinca_sprite_buyume(x_cizim, y_cizim, sprite_id, sprite_boyut_secili);
			mouse_stat(i);
		}	
		deger_cizim(i, x_cizim, y_cizim);
    }// for döngüsü çıkış 
	
	if global.stat_secim_yapildi {
		stat_bilgi_ekrani_draw(cam_x, cam_y, baslangic_x, toplam_uzunluk, yatay_atlama, global.karakter_stat_secim);
	}
}

function deger_cizim(i, x_cizim, y_cizim) {
	var x_kalori = x_cizim;
	var y_kalori = y_cizim + 140;
	var globali = stat_rakam_tanimlama(i);
	stats_temel_cizim(x_kalori, y_kalori);
	stats_icerik_cizim(x_kalori, y_kalori, globali);
}

function stat_bilgi_ekrani_draw(cam_x, cam_y, baslangic_x, toplam_uzunluk, yatay_atlama, i) {
	var x_cizim = baslangic_x + toplam_uzunluk + cam_x + yatay_atlama + 74;
	var y_cizim = global.craft_baslangic_y - (sprite_get_height(spr_envanter_tekil_arka_plan) / 2) + cam_y - global.bilgi_menu_istisna + 28;
	var scale_baslik = global.envanter_yazi_scale + 0.02;
	var scale = global.envanter_yazi_scale;
	var atlama = 20;
	var asagi_satir = 20;
	draw_set_halign(fa_left);
	draw_set_valign(fa_center);
	var sprite_isim = "spr_stats_" + string(global.karakter_stat_secim);
	var sprite_id = asset_get_index(sprite_isim);
	draw_sprite_ext(sprite_id, 0, x_cizim - 20, y_cizim, 1, 1, 0, c_white, 1);
	var stat_isim = global.stat_bilgilendirme[? "stat_" + string(global.karakter_stat_secim)];
	sayfa_yaz(x_cizim, y_cizim, stat_isim, scale_baslik, , global.baslik);

	if i == 1 {
		var kalori_1 = global.genel_yazilar[37];
		var kalori_2 = string(round(global.can));	
		var bilgi_yazisi = global.genel_yazilar[41];
	}
	
	if i == 2 {
		var kalori_1 = global.genel_yazilar[33];
		var kalori_2 = string(round(global.kalori * global.kalori_carpim)) + " " + global.genel_yazilar[36];
		var bilgi_yazisi = global.genel_yazilar[42];
	}
	
	if i == 3 {
		var kalori_1 = global.genel_yazilar[34];
		var kalori_2 = string(round(global.su * global.kalori_carpim)) + " " + global.genel_yazilar[35];	
		var bilgi_yazisi = global.genel_yazilar[43];
	}
	
	if i == 4 {
		var kalori_1 = global.genel_yazilar[40];
		var kalori_2 = string(round(global.sicaklik / 2.5)) + " " + global.genel_yazilar[39];	
		var bilgi_yazisi = global.genel_yazilar[44];
	}
	if i == 5 {
		var kalori_1 = global.genel_yazilar[54];
		var kalori_2 = "%" + string(global.yorgunluk);	
		var bilgi_yazisi = global.genel_yazilar[44];
	}
	
	var yazi_x_cizim = x_cizim - 30;
	var yazi_y_cizim = y_cizim + atlama;
	//var kalori_yazi_dengeli = wrap_text(kalori_2, 30);
	var bilgi_yazisi_dengeli = wrap_text(bilgi_yazisi, 25);
	var degisim_araligi = 20;
	
	var globalim = stat_rakam_tanimlama(i);
	var yazim_1 = ceil(globalim / degisim_araligi);
	var yazim_2 = variable_global_get("stat_list_" + string(i));
	var yazim_4 = 5 - yazim_1;
	var yazim_6 = yazim_2[| yazim_4];
	if yazim_6 == undefined yazim_6 = yazim_2[| 0];
	var yazim_3 = wrap_text(yazim_6, 20);
	var yazim_5 = global.genel_yazilar[45];
	
	
	draw_set_halign(fa_left);
	draw_set_valign(fa_left);
	sayfa_yaz(yazi_x_cizim, yazi_y_cizim, kalori_1, scale + 0.08, 1, global.baslik);
	sayfa_yaz(yazi_x_cizim, yazi_y_cizim + atlama, kalori_2, scale + 0.08, 1, global.alt_baslik);
	sayfa_yaz(yazi_x_cizim, yazi_y_cizim + (atlama * 2), yazim_5, scale + 0.06, 1, global.baslik);
	sayfa_yaz(yazi_x_cizim, yazi_y_cizim + (atlama * 3), yazim_3, scale + 0.06, 1, global.alt_baslik);
	sayfa_yaz(yazi_x_cizim, yazi_y_cizim, bilgi_yazisi_dengeli, scale, 2, global.alt_baslik);
	
	draw_set_halign(fa_right);
	draw_set_valign(fa_right);
	sayfa_yaz(yazi_x_cizim + 114, yazi_y_cizim + 158, string(global.stat_ekrani_sayfa), scale, undefined, global.alt_baslik);
}

function sayfa_yaz(_x, _y, yazi, scale, stat_sayfasi, renk) {
	if renk != undefined {
		draw_set_color(renk);	
	}
	else {
		draw_set_color(c_white);	
	}
	if stat_sayfasi != undefined {
		if global.stat_ekrani_sayfa == stat_sayfasi {
			draw_text_transformed(_x, _y, yazi, scale, scale, 0);
		}
	}
	
	else {
		draw_text_transformed(_x, _y, yazi, scale, scale, 0);
	}
	draw_set_color(c_white);	
}

function mouse_stat(i) {
	global.baloncuk_gorunurluk = true;
	global.baloncuk_baslik = global.stat_bilgilendirme[? "stat_" + string(i)];
	global.baloncuk_mesaj = undefined;
	if mouse_check_button_pressed(mb_left) {
		global.stat_secim_yapildi = true;
		global.karakter_stat_secim = i;
		global.stat_ekrani_sayfa = 1;
	}
}

function stats_seviye_degisim_draw(_x, _y, degisen_stat_no) {
	var globalim = stat_rakam_tanimlama(degisen_stat_no);
	
	var kontrol_sayaci = variable_global_get("stat_degisim_kontrol_" + string(degisen_stat_no));
	var guncel = globalim;
	var scale = 0.5;
	
	if guncel != kontrol_sayaci { //Eğer seviyesi değişmişse 
		var degisim = guncel - kontrol_sayaci;
		var aralik_temel = 0.004;
		var aralik = aralik_temel;
		
		if degisim < 0 {
			scale *= -1;	
			aralik = -aralik_temel;
		}


		var sonuc_1 = clamp(round(degisim / aralik), 0, 2);
		
		
		draw_sprite_ext(spr_stats_yukselip_alcalma, sonuc_1, _x + 12, _y + 7, scale, scale, 0, global.gui_renk, 1);
		variable_global_set("stat_degisim_kontrol_" + string(degisen_stat_no), globalim);
	}
}

function stat_seviye_degisim_tanimlama(degisen_stat_no) {
	var globalim = stat_rakam_tanimlama(degisen_stat_no);
	
	var kontrol_sayaci = variable_global_get("stat_degisim_kontrol_" + string(degisen_stat_no));
	var guncel = globalim;
	
	if guncel != kontrol_sayaci { //Eğer seviyesi değişmişse 
		var degisim = guncel - kontrol_sayaci;
		var aralik_temel = 0.004;
		var aralik = aralik_temel;
		
		if degisim < 0 {	
			aralik = -aralik_temel;
		}
		
		var sonuc_1 = clamp(round(degisim / aralik), 0, 2);

		if sonuc_1 >= 1 {
			var hesaplayacak = sonuc_1;
			if degisim < 0 hesaplayacak = -sonuc_1;
			
			global.stat_liste[degisen_stat_no] = hesaplayacak;
		}
		
		else {
			global.stat_liste[degisen_stat_no] = 0;	
		}
		
		variable_global_set("stat_degisim_kontrol_" + string(degisen_stat_no), globalim);
	}
}