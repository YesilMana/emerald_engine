function yurume(){
	if instance_exists(global.cikolata) {
		global.karakter_enerji_dusus = global.karakter_bilgileri[? "eksilen_enerji"];
        
		if global.hikaye_kontrolleri_165 || global.yavaslik_tusu_basildi {
			global.yavas_yurume = true;
		}
		
		var hedef_fps = 60;
		var max_dt_carpani = 3; // Tek bir karede en fazla 3 karelik mesafe katetmesine izin ver

		// Delta time'ı hesapla ve üst sınırla kısıtla
		var dt_carpani = min(delta_time / (1000000 / hedef_fps), max_dt_carpani);
	
		if (global.atilma_cooldown > 0) {
			global.atilma_cooldown -= 1 * dt_carpani;
		}
	
		if !global.yavas_yurume {
			var hareket_hizi = global.cikolata_hareket_hizi * dt_carpani;
		}
		else {
			var hareket_hizi = global.cikolata_hareket_hizi_yavas * dt_carpani;	
			global.cikolata.image_index = global.timer / 16;
		}
		
		
		if global.kosma_acik {
			if global.hizlanma_basildi && global.karakter_enerji > 2 && !yurume_tusuna_basilmiyor && !karakter_yuruyemez && !global.yavas_yurume && global.atilma_cooldown <= 0 {
				hareket_hizi = global.cikolata_hareket_hizi_hizli * dt_carpani;		
				global.karakter_enerji -= 0;//Enerji artık düşmüyor //(global.karakter_enerji_dusus * 12) * dt_carpani;
				global.atilma_sayac += 1 * dt_carpani;
			}
		
			else {
				if global.atilma_sayac > 0 && global.atilma_sayac < global.atilma_sabit {
				
					static sayim = 0;
					var hiz = global.atilma_hizi * dt_carpani;
				
					if sayim < 8 && !karakter_yuruyemez {
						if global.sol_basildi {
							global.cikolata.x -= hiz;
						}
						if global.sag_basildi {
							global.cikolata.x += hiz;
						}
						if global.asagi_basildi {
							global.cikolata.y += hiz;	
						}
						if global.yukari_basildi {
							global.cikolata.y -= hiz;	
						}
						sayim += 1 * dt_carpani;
						instance_create_depth(x, y, global.cikolata.depth, obj_dash_golge);
					}
					else {
						global.karakter_enerji -= 0; //Enerji artık düşmüyor //global.karakter_enerji_dusus * 500;
						sayim = 0;
						global.atilma_sayac = 0;
						global.atilma_cooldown = global.atilma_cooldown_sabit;
					}
				}
				else {
					sayim = 0;
					global.atilma_sayac = 0;
				}
			}
		}
		
		if !karakter_yuruyemez {
			if global.yukari_basildi {
				global.cikolata.y -= hareket_hizi;
				sprite_degisimi();
			}
			if global.asagi_basildi {
				global.cikolata.y += hareket_hizi;
				sprite_degisimi();
			}
			if global.sol_basildi {
				global.cikolata.x -= hareket_hizi;
				sprite_degisimi();
			}
			if global.sag_basildi {
				global.cikolata.x += hareket_hizi;
				sprite_degisimi();
			}
		
			if yurume_tusuna_basilmiyor && !global.karakter_yurutuluyor && !global.sprite_serbest {
				global.cikolata.image_index = 0;
			}
		}
		else {
			if !global.sprite_serbest {
				global.cikolata.image_index = 0;	
			}
		}
		
		if global.kilic_sallaniyor > 0 {
			var secili_sprite = global.secili_karakter;
			var aci = global.vurus_acisi + 90;
			
			if aci >= 45 && aci < 135 {
				global.cikolata.sprite_index = secili_sprite.Arka;
			}	
			else if aci >= 135 && aci < 225 {
				global.cikolata.sprite_index = secili_sprite.Yan;
				global.cikolata.image_xscale = -global.cikolata_scale;
			}
			else if aci >= 225 && aci < 315 {
				global.cikolata.sprite_index = secili_sprite.On;
			}
			else {
				global.cikolata.sprite_index = secili_sprite.Yan;
				global.cikolata.image_xscale = global.cikolata_scale;
			}
		}
	
		global.cikolata_simdiki_hiz = hareket_hizi;
		global.yavas_yurume = false;
	}
}