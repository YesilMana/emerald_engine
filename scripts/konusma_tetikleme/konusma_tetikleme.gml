function konusma_tetikleme(konusma_id, basla = false, donecegi_obje = undefined) {
	draw_set_halign(fa_left);
	draw_set_valign(fa_left);
	
	var secenekler_var = false;
	static bekleyen_oyuncu_bilgi_verildi = false;
	static oyuncu_bekleme = 180;
    // --- 1. BAŞLANGIÇ VE GÜVENLİK KONTROLLERİ ---
    var index = global.konusma_tetikleyici[konusma_id];
	if konusma_baslayamaz exit;
    global.konusulan_kisi = donecegi_obje;
    // Konuşma ID'si değiştiyse (Yeni odaya geçiş vs.) Typist'i temizle
    if (!variable_global_exists("last_konusma_id")) { global.last_konusma_id = -1; }
    
    if (global.last_konusma_id != konusma_id) {
        // DÜZELTME: Typist'i sildikten sonra değişkeni de 'undefined' yapıyoruz
        if (variable_global_exists("konusma_typist") && is_struct(global.konusma_typist)) {
             delete global.konusma_typist; 
        }
        global.konusma_typist = undefined; // Değişkeni boşa çıkar
        
        global.last_konusma_id = konusma_id;
    }
    
    global.konusma_id = konusma_id;
	
    if (basla != undefined) {
        if (basla == true && !karakter_yuruyemez) { 
            if (global.konusma_tetikleyici[konusma_id] == 0) {
                global.konusma_tetikleyici[konusma_id] = 1; 
            }
        }
    } else {
        global.z_basilabilir = true;    
    }

    // --- TYPIST OLUŞTURMA ---
    // DÜZELTME: Sadece değişkenin varlığına değil, geçerli bir struct olup olmadığına da bakıyoruz
    if (!variable_global_exists("konusma_typist") || !is_struct(global.konusma_typist)) {
        global.konusma_typist = scribble_typist();
        global.konusma_typist.in(1.2, 0); 
        
        // Event Tanımlamaları (Örnek)
        // global.konusma_typist.on_event("silah", function() { audio_play_sound(snd_silah, 1, false); });
    }

    // --- KONUŞMA DÖNGÜSÜ ---
    if (index >= 1) {
		konusana_donme();
        global.konusma_basladi = true;
        konusma_sirasinda_olacaklar(konusma_id);
        
        if (global.konusma_tetikleyici[konusma_id] == 0) {
            global.konusma_basladi = false;
            return;
        }

        if (array_length(global.konusmalar) > konusma_id && array_length(global.konusmalar[konusma_id]) > index) {
            
            // VERİLER
            var yazi_ham = global.konusmalar[konusma_id][index];
            var cizim_sprite_isim = global.konusan_spriteler[konusma_id][index];
            var portre_sprite = undefined;
            
            var diyenler = "";
            if (array_length(global.diyenler[konusma_id]) > index) {
                diyenler = global.diyenler[konusma_id][index];
            }
            konusma_rengi_tanimlama(diyenler);
			var reels = false; //REEEEEEEELS
            // POZİSYON
			var konusma_baslangic_x, konusma_baslangic_y, tolerans_1;

			if (global.android && !global.tablet_modu) || (!global.android && global.klavye_kontrolleri && !global.tablet_modu) {
			    konusma_baslangic_x = 40;
			    konusma_baslangic_y = 116;
			    tolerans_1 = 50;
			} else {
			    konusma_baslangic_x = 45;
			    if reels konusma_baslangic_x = 145;
			    konusma_baslangic_y = 154;
			    if reels konusma_baslangic_y = 138;
			    tolerans_1 = 60;
			    if reels tolerans_1 = 160;
			}

			var ekran_boyutu = display_get_gui_width();
			var kutu_genisligi = ekran_boyutu - konusma_baslangic_x - tolerans_1;
            // ÇİZİM
            if (global.konusma_gorunurluk) {
                // Kutu
				var kutu_yukseklik = 59;
				if reels kutu_yukseklik = 90;
                draw_set_color(global.konusma_rengi);
                draw_rectangle(konusma_baslangic_x - 1, konusma_baslangic_y - 1, ekran_boyutu - konusma_baslangic_x, konusma_baslangic_y + kutu_yukseklik, false);
                draw_set_color(c_black);
                draw_rectangle(konusma_baslangic_x, konusma_baslangic_y, ekran_boyutu - konusma_baslangic_x - 1, konusma_baslangic_y + (kutu_yukseklik - 1), false);
                
                // Metin
                var yazi_olcegi = global.envanter_yazi_scale + (global.envanter_yazi_scale / 3); 
                var _element = scribble(yazi_ham);
                _element.transform(yazi_olcegi, yazi_olcegi, 0); 
                _element.wrap(kutu_genisligi / yazi_olcegi); 
                _element.align(fa_left, fa_top);
                _element.blend(global.konusma_rengi, 1); 
                _element.draw(konusma_baslangic_x + 10, konusma_baslangic_y + 5, global.konusma_typist);

                // İsim
                draw_set_color(global.konusma_rengi);
				if diyenler == "AA" {
					if global.hikaye_kontrolleri_150 == obj_npc_akonit {
						diyenler = "Akonit";	
					}
					if global.hikaye_kontrolleri_150 == obj_npc_sati {
						diyenler = "Petunya";	
					}
				}
                draw_text_transformed(konusma_baslangic_x + 10, konusma_baslangic_y - 15, diyenler, 0.25, 0.25, 0);
            }

            // DURUM KONTROLLERİ
            // DÜZELTME: typist'in varlığını tekrar kontrol ediyoruz (Güvenlik için)
            var typist_exists = (variable_global_exists("konusma_typist") && is_struct(global.konusma_typist));
            var yazi_bitti_mi = (typist_exists && global.konusma_typist.get_state() == 1.0);
            
            // SES (Pitch'li)
            // DÜZELTME: paused_mu kontrolünü güvenli hale getirdik
            var is_paused = (typist_exists && global.konusma_typist.get_paused());
            
            if (!yazi_bitti_mi && !is_paused && global.konusma_gorunurluk) {
                var konusma_sayi = global.konusan_kisi_sayisi;
                var muzik = asset_get_index("mus_konusma_" + string(konusma_sayi));
                if ((global.timer % 4 == 0)) { 
                    var random_pitch = random_range(0.91, 1.09);
                    var calinan_ses = audio_play_sound(muzik, 1, false);
                    audio_sound_pitch(calinan_ses, random_pitch);
					var ses_seviyem = global.ses_seviyesi / 2;
					if global.konusan_kisi_sayisi == 1 ses_seviyem = global.ses_seviyesi;
                    audio_sound_gain(calinan_ses, ses_seviyem, 0); 
                }
            }

            // 5. SEÇENEKLER
            secenekler_var = false;
            if (is_array(global.konusma_secenek[konusma_id]) && array_length(global.konusma_secenek[konusma_id]) > index) {
                if (is_array(global.konusma_secenek[konusma_id][index]) && array_length(global.konusma_secenek[konusma_id][index]) > 2) {
                    if (global.konusma_secenek[konusma_id][index][1] != "" || global.konusma_secenek[konusma_id][index][2] != "") secenekler_var = true;
                }
            }
            
            if (secenekler_var && global.secim_yapiliyor && yazi_bitti_mi) { 
                draw_set_color(global.konusma_rengi);
                secenek_ayarlama();
				
				oyuncu_bekleme -= 1;
                var yazi_boyutu = 0.25; 
	            if (global.konusma_gorunurluk) {
				    var secenek_dizisi = global.konusma_secenek[konusma_id][index];
				    var yazi_olcegi_secenek = yazi_boyutu - 0.025;

				    // 1. Seçenek Güvenlik Kontrolü
				    if (array_length(secenek_dizisi) > global.secim_sayfasi_1) {
				        var metin1 = secenek_dizisi[global.secim_sayfasi_1];
				        if (!is_undefined(metin1) && metin1 != "") {
				            draw_text_transformed(konusma_baslangic_x + 10, global.secenek_1_y, metin1, yazi_olcegi_secenek, yazi_olcegi_secenek, 0);
				        }
				    }

				    // 2. Seçenek Güvenlik Kontrolü
				    if (array_length(secenek_dizisi) > global.secim_sayfasi_2) {
				        var metin2 = secenek_dizisi[global.secim_sayfasi_2];
				        if (!is_undefined(metin2) && metin2 != "") {
				            draw_text_transformed(konusma_baslangic_x + 10, global.secenek_2_y, metin2, yazi_olcegi_secenek, yazi_olcegi_secenek, 0);
				        }
				    }

				    // İmla / Sprite Çizimleri
				    if (global.secim_konum == 1) draw_sprite_ext(spr_konusma_secenek, 0, konusma_baslangic_x, global.secenek_1_y, 1, 1.2, 0, c_white, 1);
				    if (global.secim_konum == 2) draw_sprite_ext(spr_konusma_secenek, 0, konusma_baslangic_x, global.secenek_2_y, 1, 1.2, 0, c_white, 1);
				}
                global.maksimum_secenek = array_length(global.konusma_secenek[konusma_id][index]) - 1;
				//if global.konusma_secenek[konusma_id][index][3] == "" global.maksimum_secenek = 2;
				
                // Seçenek Kontrolleri
                if (!global.android) {
                    if (global.yukari_tiklandi && global.yapilmis_secim > 1) global.yapilmis_secim -= 1;    
                    if (global.asagi_tiklandi && global.yapilmis_secim < global.maksimum_secenek) global.yapilmis_secim += 1;    
                } 
				/*else {
                    if (global.joystick_dokunma) {
                        if (global.yapilmis_secim < global.secenek_kayit) global.yukari_basildi = false;
                        if (global.yapilmis_secim > global.secenek_kayit) global.asagi_basildi = false;
                    }
                    if (global.yukari_basildi && global.yapilmis_secim > 1) global.yapilmis_secim -= 1;
                    if (global.asagi_basildi && global.yapilmis_secim < global.maksimum_secenek) global.yapilmis_secim += 1;  
                    if (!global.joystick_dokunma) global.secenek_kayit = global.yapilmis_secim;
                }*/
            }

            if (!secenekler_var && index >= array_length(global.konusmalar[konusma_id])) { }

        } else {
             // Konuşma SONU
             var secenekler_var_son = false;
             if (is_array(global.konusma_secenek[konusma_id])) {
                if (array_length(global.konusma_secenek[konusma_id]) > index - 1) {
                    if (is_array(global.konusma_secenek[konusma_id][index - 1])) {
                        if (array_length(global.konusma_secenek[konusma_id][index - 1]) > 2) {
                            if (global.konusma_secenek[konusma_id][index - 1][1] != "" || 
                                global.konusma_secenek[konusma_id][index - 1][2] != "") {
                                secenekler_var_son = true;
                            }
                        }
                    }
                }
            }
             if (!secenekler_var_son) {
                global.konusma_tetikleyici[konusma_id] = 0;
                global.konusma_basladi = false;
				konusma_kapat();
             }
        }
    } else {
        global.konusma_basladi = false;
    }

    // --- İLERLEME, SKIP VE PAUSE (Z TUŞU MANTIĞI) ---
    // Burası sihrin olduğu yer. Sıralama çok önemli.

    var typist_var = (variable_global_exists("konusma_typist") && is_struct(global.konusma_typist));
    
    // Typist durumlarını al (Güvenlik kontrolü ile)
    var t_paused = (typist_var && global.konusma_typist.get_paused());      // [pause]'da bekliyor mu?
    var t_writing = (typist_var && global.konusma_typist.get_state() < 1.0); // Hala harf yazıyor mu?
    var t_finished = (typist_var && global.konusma_typist.get_state() == 1.0); // Tamamen bitti mi?

    if (global.z_basildi) {
		
        if !is_undefined(secenekler_var) && secenekler_var == true && !is_undefined(secenekler_var) && oyuncu_bekleme > 1 && t_finished {
			 if (t_paused) {
	            global.konusma_typist.unpause();
	            global.z_basildi = false; // Tuşu tüket
	        }
			if !bekleyen_oyuncu_bilgi_verildi {
				bilgi_ver(252);
				bekleyen_oyuncu_bilgi_verildi = true;
			}
			exit;
		}
		oyuncu_bekleme = 60;
		bekleyen_oyuncu_bilgi_verildi = false;
        // 1. ÖNCELİK: PAUSE VARSA DEVAM ET
        // Eğer [pause] komutunda durmuşsa, Z'ye basınca devam etsin.
        if (t_paused) {
            global.konusma_typist.unpause();
            global.z_basildi = false; // Tuşu tüket
        }
        
        // 2. ÖNCELİK: YAZI AKIYORSA TAMAMLA (SKIP)
        // Eğer yazı bitmediyse ve pause'da değilse -> Skip yap.
        // Not: Scribble'ın skip() komutu, bir sonraki [pause] noktasına kadar atlar!
        else if (t_writing && global.konusma_tetikleyici[konusma_id] > 0) {
            global.konusma_typist.skip();
            global.z_basildi = false; // Tuşu tüket
        }
        
        // 3. ÖNCELİK: TAMAMEN BİTTİYSE SONRAKİNE GEÇ (NEXT)
        // Yazı bitti veya hiç başlamadı (Index 0) -> İlerle
        else if (t_finished || index == 0) {
             if (global.animasyon_zaman <= 1 && global.konusma_tetikleyici[konusma_id] >= 0) {
                 if (array_length(global.konusmalar) > konusma_id && array_length(global.konusmalar[konusma_id]) > index) {
                    global.konusma_tetikleyici[konusma_id] = index + 1;
                    global.animasyon_zaman = 0;
                    global.konusma_gorunurluk = true;
                    
					
					
                    if (typist_var) {
                        global.konusma_typist = scribble_typist(); 
                        global.konusma_typist.in(1.2, 0); 
                    }
                    global.z_basildi = false; // Tuşu tüket
					global.secim_yapiliyor = false;
                 }
             }
        }
    }

    global.animasyon_zaman -= 1;
    if (global.animasyon_zaman < 0) {
        global.animasyon_zaman = 0; 
    }
}