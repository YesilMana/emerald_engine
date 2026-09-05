function mini_envanter(){
	if !global.mini_envanter_gorunme exit;
	if !global.envanter_ekrani_gorunme && !global.konusma_basladi {
		global.mini_envanter_baloncuk = false;
		//scale 0.6 -> atlama 22.7
		//scale 1 -> atlama 38 
		var cam = view_camera[0];
		var cam_x = camera_get_view_x(cam);
		var cam_y = camera_get_view_y(cam);
		var cam_w = camera_get_view_width(cam);
		var cam_h = camera_get_view_height(cam);
		if !global.android {
			var mini_envanter_atlama = 18;
			var mini_scale = 0.48;
		}
		else {
			var mini_envanter_atlama = 22;
			var mini_scale = 0.58;
		}	
		
		for (var i = 1; i <= global.envanter_yatay_sayi; i++) {
			var ortalama_1 = 400;
			var ortalama_2 = mini_envanter_atlama * global.envanter_yatay_sayi;
			var ortalama_3 = ortalama_1 - ortalama_2;
			var ortalama_4 = ortalama_3 / 2;
			if i == 1 var cizim_temel = spr_mini_envanter_tekil_baslangic;
			else if i == global.envanter_yatay_sayi var cizim_temel = spr_mini_envanter_tekil_bitis;
			else var cizim_temel = spr_mini_envanter_tekil_orta;
			var x_cizim = cam_x + (i * mini_envanter_atlama) + ortalama_4 - (mini_envanter_atlama / 2);
			var y_cizim = cam_y + display_get_gui_height() - 14;
		
			var cizim_slot = global.envanter_list[| i]
			var cizim_id = cizim_slot[? "esya"];
			draw_sprite_ext(cizim_temel, 0, x_cizim, y_cizim, mini_scale, mini_scale, 0, global.gui_renk, 0.8);
			if global.mini_envanter_secili == i {
				draw_sprite_ext(spr_mini_envanter_tekil_secili, 0, x_cizim, y_cizim, mini_scale, mini_scale, 0, c_white, 1);	
			}
			if cizim_id != -1 {
				var cizim_isim = global.item_names[? cizim_id];
				var cizim_sprite = asset_get_index("spr_" + cizim_id);
				var cizim_golge = 0.5;
				draw_sprite_ext(cizim_sprite, 0, x_cizim - cizim_golge, y_cizim + cizim_golge, mini_scale, mini_scale, 0, c_black, 0.2);
				draw_sprite_ext(cizim_sprite, 0, x_cizim, y_cizim, mini_scale, mini_scale, 0, c_white, 0.8);
				var item_id = kodunu_al(cizim_id);
				var sayisi = cizim_slot[? "adet"];
				draw_set_halign(fa_right);
				draw_set_valign(fa_center);
				if global.mini_envanter_secili == i sayfa_yaz(x_cizim + 7, y_cizim + 4, string(sayisi), global.envanter_yazi_scale - 0.03, , c_white);
				else sayfa_yaz(x_cizim + 7, y_cizim + 4, string(sayisi), global.envanter_yazi_scale - 0.03, , global.baslik);
			}
			mini_envanter_mouse_event(x_cizim, y_cizim, i)
		}
		esya_kullan();
	}
}

function klavye_mini_envanter_secimi() {
    // Sadece Android değilse (PC ise) çalıştır
    if (!global.android) {
        // 1'den 9'a kadar olan tuşları kontrol eden döngü
        var _i;
        for (_i = 1; _i <= 9; _i += 1) {
            // ord(string(_i)) -> "1", "2", "3" vb. tuş kodunu alır
            if (keyboard_check_pressed(ord(string(_i)))) {
                // Eğer basılan sayı, mevcut slot sayımızdan küçük veya ona eşitse değiştir
                if (_i <= global.envanter_yatay_sayi) {
                    global.mini_envanter_secili = _i;
                }
            }
        }

        // 0 Tuşu Kontrolü (Genellikle 10. slotu temsil eder)
        if (keyboard_check_pressed(ord("0"))) {
            // Eğer envanterde 10. slot varsa oraya geç
            if (10 <= global.envanter_yatay_sayi) {
                global.mini_envanter_secili = 10;
            }
        }
    }
}

function mouse_tekerlegi_mini_envanter() {
	if !global.android {
		if mouse_wheel_down() {
			if global.tekerlek_kilit_1 = false {
				if global.mini_envanter_secili < global.envanter_yatay_sayi { 
					global.mini_envanter_secili += 1;
				}
			
				else {
					global.mini_envanter_secili = 1;	
				}
			}
			global.tekerlek_kilit_1 = true;
		}
		
		else {
			global.tekerlek_kilit_1 = false;	
		}
		
		if mouse_wheel_up() {
			if global.tekerlek_kilit_2 = false {
				if global.mini_envanter_secili > 1 { 
					global.mini_envanter_secili -= 1;
				}
			
				else {
					global.mini_envanter_secili = global.envanter_yatay_sayi;	
				}
			}
			global.tekerlek_kilit_2 = true;
		}
		else {
			global.tekerlek_kilit_2 = false;	
		}
	}
}

function script_cagir(isim) {
	var isimi = isim;
	var istanvul = asset_get_index(isimi);
	if istanvul != -1 {
		script_execute(istanvul);
	}
}

function mini_envanter_mouse_event(x_cizim, y_cizim, i) {
    var mouse_uzaklik_degeri = 15;
    var ortlama = 2;
    var uzerinde_mi = false; 

    // ÖNEMLİ: Her karede başta baloncuk kapalı varsayıyoruz. 
    // Eğer aşağıdaki döngüde bir eşyaya dokunulursa 'true' olacak.
    if global.android global.mini_envanter_baloncuk = false;
	if global.konusma_basladi global.mini_envanter_baloncuk = false;
	mouse_tekerlegi_mini_envanter();
	klavye_mini_envanter_secimi();
   // script_cagir("mouse_tekerlegi_mini_envanter");
  //  script_cagir("klavye_mini_envanter_secimi");

    for (var v = 0; v < 5; v++) {
        var mx = device_mouse_x(v);
        var my = device_mouse_y(v);
        
        var uzaklik_kontrol = point_distance(x_cizim + ortlama, y_cizim + ortlama, mx, my);
        
        if (uzaklik_kontrol < mouse_uzaklik_degeri) {
            uzerinde_mi = true; 

            if (device_mouse_check_button_pressed(v, mb_left)) {
                if (global.mini_envanter_secili != i) {
                    global.mini_envanter_secili = i;
                }
            }

            // Eşya bilgilerini gösterme kısmı
            var envanterdeki_obje = global.envanter_list[| i];
            
            // Veri yapısı güvenliği için is_undefined kontrolü eklemek iyidir
            if (!is_undefined(envanterdeki_obje)) {
                var eleman_1 = envanterdeki_obje[? "esya"];
                
                if (eleman_1 != -1) {
                    // Baloncuk burada aktifleşiyor
                    if !global.android global.mini_envanter_baloncuk = true;
                    
                    var eleman_i = string_delete(eleman_1, 1, 5);
                    var eleman_sayisi = real(eleman_i);
                
                    global.baloncuk_baslik = global.item_names[? "esya_" + string(eleman_sayisi)];
                    global.baloncuk_mesaj = undefined;
                }
            }
        }
    }

    // İmleç el simgesi kontrolü
    if (uzerinde_mi) {
        global.mouse_sprite_el[1] = 1;
    } else {
        global.mouse_sprite_el[1] = 0;
    }
}