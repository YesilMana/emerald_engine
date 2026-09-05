function envanter_cizim_draw() {
	draw_set_font(global.konusma_font);
	global.envanter_icerigi_gorunme = global.envanter_ekrani_gorunme;
	
	if (global.envanter_icerigi_gorunme && global.envanter_sekme == global.sekme_numara_envanter) {
		var envanter_dolum_kontrolu = false;
		var baslangic_y = global.craft_baslangic_y;
		var baslangic_x = global.craft_baslangic_x + 38;
		var yatay_atlama = global.craft_yatay_atlama;
		var dikey_atlama = global.craft_dikey_atlama;
		var asagi_satira_gecis = global.envanter_yatay_sayi;
		var sayfa_bitisi = global.craft_sayfa_bitis_satiri;
		var sprite_boyut = global.envanter_scale;
		var sprite_boyut_secili = global.envanter_scale + 0.05;
		var yazi_boyutu = global.envanter_yazi_scale;
		var sayfa_baslangic = ((global.craft_ekrani_sayfasi - 1) * (global.craft_sayfa_bitis_satiri * global.craft_asagi_satira_gecis)) + 1;
		var sayfa_bitis = (global.craft_ekrani_sayfasi * (global.craft_sayfa_bitis_satiri * global.craft_asagi_satira_gecis));
	
		if sayfa_bitis > global.envanter_son_oge {
			sayfa_bitis = global.envanter_son_oge;
		}
	
		if sayfa_baslangic == 0 sayfa_baslangic = 1;

		var goruntu_boyutu_x = camera_get_view_width(view_camera[0]);
		var toplam_uzunluk = yatay_atlama * (asagi_satira_gecis - 1);
		var eleman_sayisi = 1;
	
		var cam = view_camera[0];
		var cam_x = camera_get_view_x(cam);
		var cam_y = camera_get_view_y(cam);
		var cam_w = camera_get_view_width(cam);
		var cam_h = camera_get_view_height(cam);

		envanter_ana_arkaplan_ciz(cam_x, cam_y, cam_w, cam_h, sprite_boyut);
		
		for (var i = 0; i <= global.envanter_kapasite; i++) {
			var slot = global.envanter_list[| i];
			var esya_isim = slot[? "esya"];
			
			if esya_isim != -1 {
				var eleman_i = string_copy(esya_isim, 6, string_length(esya_isim) - 5);
				eleman_sayisi = eleman_i;
			}
			else {
				eleman_sayisi = 999;	
			}

			if eleman_sayisi != 999 {
				var sayi = slot[? "adet"];
				var isim = global.item_names[? "esya_" + string(eleman_sayisi)];
			}
			else {
				var sayi = 0;
				var isim = " ";
			}
			
			var durum_1 = ds_list_find_value(global.envanter_list, i);
			var durum_2 = durum_1[? "durum"];
			var spr = asset_get_index("spr_esya_" + string(eleman_sayisi));
			
			var envanter_i = i;
			var col = (envanter_i - 1) mod asagi_satira_gecis;
			var row = (envanter_i - 1) div asagi_satira_gecis;
			var x_cizim = cam_x + baslangic_x + (yatay_atlama * col); 
			var y_cizim = cam_y + baslangic_y + (dikey_atlama * row);
			
			// Eşya slot arka planı
			var renk = global.gui_renk;
			var siprite = (i <= asagi_satira_gecis) ? spr_envanter_tekil_arka_plan_kullanim : spr_envanter_tekil_arka_plan;
			if durum_2 == 0 siprite = spr_envanter_tekil_arka_plan_kullanilamaz;
			if i == 0 siprite = spr_envanter_yok;
			draw_sprite_ext(siprite, 0, x_cizim, y_cizim, sprite_boyut, sprite_boyut, 0, renk, 1);
			
			// Eşya ikonu çizimi
			if (spr != -1) && eleman_sayisi != 999 {
				var cizim_opaklik = 1;
				var cizim_golge = 0.8;
				draw_sprite_ext(spr, 0, x_cizim - cizim_golge, y_cizim + cizim_golge, sprite_boyut, sprite_boyut, 0, c_black, 0.2);
				draw_sprite_ext(spr, 0, x_cizim, y_cizim, sprite_boyut, sprite_boyut, 0, c_white, cizim_opaklik);
			}
			
			// Adet yazısı çizimi
			if eleman_sayisi != 999 envanter_adet_yazisi_ciz(x_cizim, y_cizim, sayi, yazi_boyutu);
			
			var mouse_yakinlasti = (point_distance(mouse_x, mouse_y, x_cizim, y_cizim) < global.mouse_yakinlik);
			
			static yakinlastim = false;
			if mouse_yakinlasti && !duraklatmak {
				// ORTAK: Bilgilendirme baloncuğu
				

				// KOŞULLU ETKİLEŞİM
				if (global.envanter_ekrani_normal) {
				
					global.mouse_sprite_el[3] = 1;
					mouse_yaklasinca_sprite_buyume(x_cizim, y_cizim, spr, sprite_boyut_secili);
					var ele_alinacak = eleman_sayisi;
					esya_birakma(i, x_cizim, y_cizim); 
					ele_alma(ele_alinacak, i);
				}
				else {
				
					if mouse_check_button_released(mb_left) {
						var esya_kullan_1 = global.envanter_list[| i];
						var esya_kullan_2 = esya_kullan_1[? "esya"];
						if esya_kullan_2 != -1 {
							var esya_kullan_3 = kodunu_al(esya_kullan_2);
							var arda = asset_get_index("esya_kullanim_" + string(esya_kullan_3));

							if arda != -1 {
								global.anlik_kullanim = esya_kullan_3;
								onay_ekrani_goster(global.envanter_kullanim_yazilar[? "esya_" + string(global.anlik_kullanim)], , , 41);
							}
						}
					}
				}
				
				if !global.baloncuk_gorunurluk && eleman_sayisi != 999 {
					global.baloncuk_cikis_id_x = x_cizim;
					global.baloncuk_cikis_id_y = y_cizim;
					global.baloncuk_gorunurluk = true;
					global.baloncuk_mesaj = global.esya_bilgilendirme_metinleri[eleman_sayisi];
					var baslik_1 = "";
					var birinci_1 = global.envanter_list[| i];
					var saglamligi = 100;
					if (birinci_1[? "saglamlik"] != undefined) {
						var temp = birinci_1[? "saglamlik"];
						if (is_real(temp) || is_int64(temp)) {
							saglamligi = temp;
						}
					}
					var saglamligi_2 = round(saglamligi / 20);
					var bul_2 = global.siniflandirma_esyalar[? "esya_" + string(eleman_sayisi)];

					if bul_2 != undefined && bul_2 != 0 {
						baslik_1 = global.esyalar_saglamlik[| saglamligi_2];
						if saglamligi_2 == 0 baslik_1 = "";
					}
					var key = "esya_" + string(eleman_sayisi);
					var item_name = global.item_names[? key];
					
					if (is_undefined(baslik_1)) baslik_1 = "";
					if (is_undefined(item_name)) item_name = "";

					global.baloncuk_baslik = string(baslik_1) + " " + string(item_name);
					global.baloncuk_yenile = false;
				}
			}		
			else {
				global.mouse_sprite_el[3] = 1;	
			}
		}
		
		if global.ele_alindi {
			var ele_alim_sprite_1 = "spr_esya_" + string(global.ele_alinan_id);
			var ele_alim_sprite_2 = asset_get_index(ele_alim_sprite_1);
			draw_sprite_ext(ele_alim_sprite_2, 0, mouse_x , mouse_y, global.envanter_scale, global.envanter_scale, 0, c_white, 0.75); 
			if esya_yere_atma() == false {
				if !mouse_check_button(mb_left) {
					var slot = global.ele_alinan_slot;
					slot[? "esya"] = "esya_" + string(global.ele_alinan_id);
					slot[? "adet"] = global.ele_alinan_adet;
					slot[? "saglamlik"] = global.ele_alinan_saglamlik;
					global.ele_alindi = false;
				}
			}
		}
		
		envanter_baloncuk_kontrol();
		if global.timer % 60 == 0 {
			envanter_analiz_et();
		}
	}
}

function esya_birakma(eleman_sayisi, x_cizim, y_cizim, sandik_list = undefined) {
	var mouse_uzaklik = 15;
	//if global.siniflandirma_atilamazlar[? "esya_" + string(global.ele_alinan_id)] != undefined && sandik_list != undefined exit;
	var list = global.envanter_list;
	if sandik_list != undefined {
		sandik_yakinlik_kontrol();
		list = sandik_list;
	}
	
	var slot_1 = list[| eleman_sayisi];
	var	esya_isim = slot_1[? "esya"];
	var drum = slot_1[? "durum"];
	//var sg_degeri = slot_1[? "saglamlik"];
	var eleman_i = string_copy(esya_isim, 6, string_length(esya_isim) - 5);
	if point_distance(mouse_x, mouse_y, x_cizim, y_cizim) < mouse_uzaklik {
		var bu_esya_mi = global.siniflandirma_esyalar[? "esya_" + string(global.ele_alinan_id)];
		if mouse_check_button_released(mb_left) && (esya_isim == -1 || (esya_isim == "esya_" + string(global.ele_alinan_id) && bu_esya_mi != -1)) && drum == 1 && eleman_sayisi != 0 {
			if global.ele_alindi {
				if esya_isim == "esya_" + string(global.ele_alinan_id) && (!is_undefined(global.siniflandirma_esyalar[? esya_isim]) || !is_undefined(global.siniflandirma_silahlar[? esya_isim])) {
					var slot = bos_slotu_bul();
					if slot == 999 {
						esya_yerde_olustur(global.ele_alinan_id, 1);
						exit;
					}
				}
				else {
					var slot = list[| eleman_sayisi];
					if global.envanter_ekrani_gorunme && global.envanter_sekme == global.sekme_numara_sandik {
						if sandik_list != undefined {
							if (global.esya_birakilan_an + 30 > global.timer) && (is_undefined(global.siniflandirma_esyalar[? "esya_" + string(global.ele_alinan_id)]) && is_undefined(global.siniflandirma_silahlar[? "esya_" + string(global.ele_alinan_id)])) {
								var slot_a = bos_slotu_bul();
								if slot_a != 999 slot = global.envanter_list[| slot_a];
								global.esya_birakilan_an = 0;
							}
						}
						else {
							if (global.esya_birakilan_an + 30 > global.timer) && (is_undefined(global.siniflandirma_esyalar[? "esya_" + string(global.ele_alinan_id)]) && is_undefined(global.siniflandirma_silahlar[? "esya_" + string(global.ele_alinan_id)])) {
								var sandik_kapasite_0 = global.sandiklar_tumu[? string(global.sandik_numara)];
								var sandigim = sandik_kapasite_0[? "icerik"];
								var slot_a = bos_slotu_bul(sandigim);//hangi_slotta(global.ele_alinan_id, sandigim);
								if slot_a != 999 slot = sandigim[| slot_a];
								 global.esya_birakilan_an = 0;
							}
						}
					}
					if global.esya_birakilan_an == 0 {
						global.esya_birakilan_an = 1	
					}
					else {
						global.esya_birakilan_an = global.timer;
					}	
					slot[? "esya"] = "esya_" + string(global.ele_alinan_id);
					if esya_isim == -1 slot[? "adet"] = global.ele_alinan_adet;
					if esya_isim == "esya_" + string(global.ele_alinan_id) slot[? "adet"] = global.ele_alinan_adet + slot[? "adet"];
					slot[? "saglamlik"] = global.ele_alinan_saglamlik;
					global.ele_alindi = false;
				}
				envanter_analiz_et();
			}
		}
		
		else if esya_isim != -1 && mouse_check_button_released(mb_left) && global.ele_alindi {
			var eski_esya = slot_1[? "esya"];
			var eski_adet = slot_1[? "adet"];
			var eski_saglamlik = slot_1[? "saglamlik"];
			slot_1[? "esya"] = "esya_" + string(global.ele_alinan_id);
			slot_1[? "adet"] = global.ele_alinan_adet;
			slot_1[? "saglamlik"] = global.ele_alinan_saglamlik;
			envantere_ekle(kodunu_al(eski_esya), eski_adet, eski_saglamlik);
			global.ele_alindi = false;
			global.baloncuk_yenile = true;
		}
		if eleman_sayisi == 0 {
			if mouse_check_button_pressed(mb_left) { //Çöpe atma
				global.ele_alindi = false;	
			}
		}
	}
}

function ele_alma(eleman_sayisi, slots) {
	global.baloncuk_gorunurluk = false;
	var slotu = slot_bos_mu(eleman_sayisi); 
	if mouse_check_button_pressed(mb_left) && !global.ele_alindi && (slotu != -1) {
		var slot = global.envanter_list[| slots];
		global.ele_alinan_slot = slot;
		global.ele_alinan_id = eleman_sayisi;
		if global.siniflandirma_atilamazlar[? "esya_" + string(global.ele_alinan_id)] != undefined && global.envanter_ekrani_gorunme && global.envanter_sekme == global.sekme_numara_sandik {
			exit;
		}
		var ses = sfx_secenek_yakinlasma;
		audio_play_sound(ses, 1, false);
		audio_sound_gain(ses, global.ses_seviyesi);
		global.ele_alindi = true;
		global.ele_alinan_adet = slot[? "adet"];
		global.ele_alinan_saglamlik = slot[? "saglamlik"];
		slot[? "adet"] = 0;
		slot[? "esya"] = -1;
		slot[? "saglamlik"] = 0;
	}
}

function ele_alma_sandik(eleman_sayisi, slots, sandik_list) {
	global.baloncuk_gorunurluk = false;
	var slotu = slot_bos_mu_sandik(eleman_sayisi, sandik_list); 
	if mouse_check_button_pressed(mb_left) && !global.ele_alindi && (slotu != -1) {
		var ses = sfx_secenek_yakinlasma;
		audio_play_sound(ses, 1, false);
		audio_sound_gain(ses, global.ses_seviyesi);
		global.ele_alindi = true;
		var slot = sandik_list[| slots];
		global.ele_alinan_slot = slot;
		global.ele_alinan_id = eleman_sayisi;
		global.ele_alinan_adet = slot[? "adet"];
		global.ele_alinan_saglamlik = slot[? "saglamlik"];
		slot[? "adet"] = 0;
		slot[? "esya"] = -1;
		slot[? "saglamlik"] = 0;
	}
}

function esya_yere_atma() {
	var cam = view_camera[0];
	var cam_x = camera_get_view_x(cam);
	var cam_y = camera_get_view_y(cam);
	var cam_w = camera_get_view_width(cam);
	var cam_h = camera_get_view_height(cam);
	var y_mouse = mouse_y - cam_y;
	var x_mouse = mouse_x - cam_x;
	
	var alan_x1 = -20;
	var alan_y1 = -20;
	var alan_x2 = obj_envanter_ekrani.x - (obj_envanter_ekrani.sprite_width / 2) - 20;
	var alan_y2 = 380;
	
	var alan_x3 = obj_envanter_ekrani.x + (obj_envanter_ekrani.sprite_width / 2) + 20;
	var alan_y3 = -20;
	var alan_x4 = 800;
	var alan_y4 = 380;
	
	var alan_x5 = 0;
	var alan_y5 = -20;
	var alan_x6 = 800;
	var alan_y6 = 55;
	
	var alan_x7 = 0;
	var alan_y7 = 280;
	var alan_x8 = 800;
	var alan_y8 = 380;
	
	if global.siniflandirma_atilamazlar[? "esya_" + string(global.ele_alinan_id)] != undefined return false;
	
	if (x_mouse > alan_x1 && x_mouse < alan_x2 && y_mouse > alan_y1 && y_mouse < alan_y2) || (x_mouse > alan_x3 && x_mouse < alan_x4 && y_mouse > alan_y3 && y_mouse < alan_y4) || (x_mouse > alan_x5 && x_mouse < alan_x6 && y_mouse > alan_y5 && y_mouse < alan_y6) || (x_mouse > alan_x7 && x_mouse < alan_x8 && y_mouse > alan_y7 && y_mouse < alan_y8) {	
		if mouse_check_button_released(mb_left) {
			esya_yere_at(global.ele_alinan_id);
			return true;
		}
	}
	else {
		return false;
	}
}