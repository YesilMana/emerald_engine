function sandik_ekrani_cizim(){
	if global.envanter_sekme == global.sekme_numara_sandik && global.envanter_ekrani_gorunme && global.sandiga_yakin {
		sandik_rastgele_olusma();
		draw_sprite_ext(spr_ana_menu_tus, 0, 50, 50, 1, 1, 0, c_white, 1);
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
	
		var sandik_kapasite_0 = global.sandiklar_tumu[? string(global.sandik_numara)];
		var sandik_kapasite = sandik_kapasite_0[? "kapasite"];
		/*
		
		var gecici_list = ds_list_create();
		for (var i = 0; i < sandik_kapasite; i++) { 
			var gecici_map = ds_map_create();
			ds_map_add(gecici_map, "esya", -1);
			ds_map_add(gecici_map, "durum", 1);
			ds_map_add(gecici_map, "adet", 0);
			ds_list_add(gecici_list, gecici_map);
		}
		
		ds_map_add(sandik_kapasite_0, "icerik", sandik_list);
		*/
		
		var sandik_list = sandik_kapasite_0[? "icerik"];
		
		
		
		for (var i = 0; i <= sandik_kapasite; i++) {
			var slot = sandik_list[| i];

	        if (is_undefined(slot)) {
	            continue; 
	        }
	        // --------------------------
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
				//var sayi = string(global.envanter[eleman_sayisi]);
				var isim = global.item_names[? "esya_" + string(eleman_sayisi)];
			}
			
			else {
				var sayi = 0;
				var isim = " ";
			}
			var durum_1 = ds_list_find_value(sandik_list, i);
			var durum_2 = durum_1[? "durum"];
            var spr = asset_get_index("spr_esya_" + string(eleman_sayisi));
			
			var envanter_i = i;
            

            var col = (envanter_i - 1) mod asagi_satira_gecis;
            var row = (envanter_i - 1) div asagi_satira_gecis;
            var x_cizim = cam_x + baslangic_x + (yatay_atlama * col); 
            var y_cizim = cam_y + (baslangic_y) + (dikey_atlama * row);
			
		    // Eşya çizimi
			var renk = global.gui_renk;
			
			var siprite = spr_envanter_tekil_arka_plan;
			
			if durum_2 == 0 siprite = spr_envanter_tekil_arka_plan_kullanilamaz;
			if i == 0 siprite = spr_envanter_yok;
			draw_sprite_ext(siprite, 0, x_cizim, y_cizim, sprite_boyut, sprite_boyut, 0, renk, 1);
			if (spr != -1) && eleman_sayisi != 999 {
				var cizim_opaklik = 1;
				var cizim_golge = 0.8;
				draw_sprite_ext(spr, 0, x_cizim - cizim_golge, y_cizim + cizim_golge, sprite_boyut, sprite_boyut, 0, c_black, 0.2);
				draw_sprite_ext(spr, 0, x_cizim, y_cizim, sprite_boyut, sprite_boyut, 0, c_white, cizim_opaklik);
			}
			
            // Adet yazısı çizimi
			if eleman_sayisi != 999 envanter_adet_yazisi_ciz(x_cizim, y_cizim, sayi, yazi_boyutu);
           
			var mouse_yakinlasti = (point_distance(mouse_x, mouse_y, x_cizim, y_cizim) < global.mouse_yakinlik);
			
			if (point_distance(mouse_x, mouse_y, x_cizim, y_cizim) < global.esya_alma_uzaklik) && !duraklatmak{
				
			}
			
            if mouse_yakinlasti && !duraklatmak {
				global.mouse_sprite_el[2] = 1;
				mouse_yaklasinca_sprite_buyume(x_cizim, y_cizim, spr, sprite_boyut_secili);
				var ele_alinacak = eleman_sayisi;
				esya_birakma(i, x_cizim, y_cizim, sandik_list); //Envanterin koordinatı
				ele_alma_sandik(ele_alinacak, i, sandik_list); //Eşyanın id numarası
				
				// Mouse hover işlemleri
				if !global.baloncuk_gorunurluk && eleman_sayisi != 999 {
					global.baloncuk_cikis_id_x = x_cizim;
					global.baloncuk_cikis_id_y = y_cizim;
					global.baloncuk_gorunurluk = true;
					global.baloncuk_mesaj = global.esya_bilgilendirme_metinleri[eleman_sayisi];
					var baslik_1 = "";
					var birinci_1 = sandik_list[| i];
					var saglamligi = 100;
					if (birinci_1[? "saglamlik"] != undefined) {
					    var temp = birinci_1[? "saglamlik"];
    
					    // Eğer sayı ise direkt kullan
					    if (is_real(temp) || is_int64(temp)) {
					        saglamligi = temp;
					    }
					    // Eğer string ise sayıya çevirmeyi dene
					    else if (is_string(temp)) {
					        saglamligi = real(temp);
					    }
					}

					// Güvenlik kontrolü
					if (saglamligi <= 0 || saglamligi > 100) {
					    saglamligi = 100;
					}
					var saglamligi_2 = round(saglamligi / 20);
					var bul_2 = global.siniflandirma_esyalar[? "esya_" + string(eleman_sayisi)];

					if bul_2 != undefined && bul_2 != 0{
						baslik_1 = global.esyalar_saglamlik[| saglamligi_2];	
					}
					var key = "esya_" + string(eleman_sayisi);
					var item_name = global.item_names[? key];

					// baslik_1 tanımlı mı?
					if (is_undefined(baslik_1)) baslik_1 = "";

					// item_name tanımlı mı?
					if (is_undefined(item_name)) item_name = "";

					// sonra güvenli şekilde birleştir:
					var baslik_2 = string(baslik_1) + " " + string(item_name);

					global.baloncuk_baslik = baslik_2;
				}
				//envanter_mouse_hover_isle(i, eleman_sayisi, x_cizim, y_cizim, spr, sprite_boyut_secili, global.craft_edilebilir_mi[i]);
			}		
			else {
				global.mouse_sprite_el[2] = 0;	
			}
        }// for döngüsü çıkış 
		
		for (var i = 0; i <= 27; i++) {
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
				//var sayi = string(global.envanter[eleman_sayisi]);
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
            var y_cizim = cam_y + (baslangic_y) + (dikey_atlama * 2) + ((dikey_atlama) * row);
			
		    // Eşya çizimi
			var renk = global.gui_renk;
			if i <= asagi_satira_gecis {
				var siprite = spr_envanter_tekil_arka_plan_kullanim;
			}
			
			else {
				var siprite = spr_envanter_tekil_arka_plan;
			}
			if durum_2 == 0 siprite = spr_envanter_tekil_arka_plan_kullanilamaz;
			if i == 0 siprite = spr_envanter_yok;
			draw_sprite_ext(siprite, 0, x_cizim, y_cizim, sprite_boyut, sprite_boyut, 0, renk, 1);
			if (spr != -1) && eleman_sayisi != 999 {
				var cizim_opaklik = 1;
				draw_sprite_ext(spr, 0, x_cizim, y_cizim, sprite_boyut, sprite_boyut, 0, c_white, cizim_opaklik);
			}
			
            // Adet yazısı çizimi
			if eleman_sayisi != 999 envanter_adet_yazisi_ciz(x_cizim, y_cizim, sayi, yazi_boyutu);
           
			var mouse_yakinlasti = (point_distance(mouse_x, mouse_y, x_cizim, y_cizim) < global.mouse_yakinlik);
			
			if (point_distance(mouse_x, mouse_y, x_cizim, y_cizim) < global.esya_alma_uzaklik) && !duraklatmak{
				
			}
			
            if mouse_yakinlasti && !duraklatmak {
				mouse_yaklasinca_sprite_buyume(x_cizim, y_cizim, spr, sprite_boyut_secili);
				var ele_alinacak = eleman_sayisi;
				esya_birakma(i, x_cizim, y_cizim); //Envanterin koordinatı
				ele_alma(ele_alinacak, i); //Eşyanın id numarası
				
				// Mouse hover işlemleri
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
    
					    // Eğer sayı ise direkt kullan
					    if (is_real(temp) || is_int64(temp)) {
					        saglamligi = temp;
					    }
					    // Eğer string ise sayıya çevirmeyi dene
					    else if (is_string(temp)) {
					        saglamligi = real(temp);
					    }
					}
					var saglamligi_2 = round(saglamligi / 20);
					var bul_2 = global.siniflandirma_esyalar[? "esya_" + string(eleman_sayisi)];

					if bul_2 != undefined && bul_2 != 0{
						baslik_1 = global.esyalar_saglamlik[| saglamligi_2];	
					}
					var key = "esya_" + string(eleman_sayisi);
					var item_name = global.item_names[? key];

					// baslik_1 tanımlı mı?
					if (is_undefined(baslik_1)) baslik_1 = "";

					// item_name tanımlı mı?
					if (is_undefined(item_name)) item_name = "";

					// sonra güvenli şekilde birleştir:
					var baslik_2 = string(baslik_1) + " " + string(item_name);

					global.baloncuk_baslik = baslik_2;
				}
				//envanter_mouse_hover_isle(i, eleman_sayisi, x_cizim, y_cizim, spr, sprite_boyut_secili, global.craft_edilebilir_mi[i]);
			}			
        }// for döngüsü çıkış 
		
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