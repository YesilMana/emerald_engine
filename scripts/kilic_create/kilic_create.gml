function kilic_create() {
	var slot = global.envanter_list[| global.mini_envanter_secili];
	var kod = slot[? "esya"];
	var silah_iceri = global.siniflandirma_silahlar[? string(kod)];
	global.kilic_delay = silah_iceri[? "delay"];
	if instance_exists(obj_kilic_savurma) || global.karakter_enerji < 0 || (global.timer - global.kilic_cekildi < global.kilic_delay) {
		instance_destroy();
		exit;
	}
	global.stat_minik_opaklik[1] = 4;
	
	var secilen_ses_1 = irandom_range(1, 2);
	var secilen_ses_2 = variable_global_get("sfx_savurma_" + string(secilen_ses_1));
	audio_play_sound(secilen_ses_2, 1, false, , , global.kilic_pitch);
	audio_sound_gain(secilen_ses_2, global.ses_seviyesi);
	global.kilic_pitch = 1;
	global.kilic_cekildi = global.timer;
	global.karakter_enerji -= global.kilic_enerji_dusus;

    hedef_donme = 180;
    savurma_hizi = 20;
    toplam_donen = 0;
    sprite_index = spr_kilic_1_kullanim;
    
    // Derinlik ve Yön Alma Kodu (Aynı kalacak)
    if (instance_exists(global.cikolata)) {
        depth = global.cikolata.depth - 1; 
        if (!variable_instance_exists(id, "yon")) {
            yon = global.kilic_yon;
        }
    }


    var savurma = instance_create_depth(global.cikolata.x, global.cikolata.y - 12, global.cikolata.depth + 1, obj_kilic_savurma);
	
	var silah_sprite = silah_iceri[? "sprite"];
	var olusan_sprite = asset_get_index("spr_vurma_" + silah_sprite);
	
	if olusan_sprite == -1 olusan_sprite = spr_vurma_kilic;
	
	baslangic_acisi = 0;
	yon_carpan = 1;  
	
    if (yon == "sag") {
        // (Yukarıdan Aşağıya Vuruş)
        baslangic_acisi = 0;   
        yon_carpan = 1;        // Saat Yönü (CW)
        
        global.kilic_ekleme_x = 10;    
        global.kilic_ekleme_y = -10;
		savurma.sprite_index = olusan_sprite;
		savurma.image_xscale = 1;
    }
    else if (yon == "sol") {
        // (Yukarıdan Aşağıya Vuruş)
        baslangic_acisi = 180;   
        yon_carpan = -1;         // Saat Yönü Tersi (CCW)
        
        global.kilic_ekleme_x = -10;    
        global.kilic_ekleme_y = -10;  
		savurma.sprite_index = olusan_sprite;
		savurma.image_xscale = -1;
    }
    else if (yon == "asagi") {
        
        baslangic_acisi = 270;    // Kılıç sağdan başlasın
        yon_carpan = 1;        // Saat yönü (CW) - Yani 0 -> 340 -> 270 -> 180
        
        global.kilic_ekleme_x = 0;    
        global.kilic_ekleme_y = 0;  
		savurma.sprite_index = olusan_sprite;
		savurma.image_angle = 180;
    }
    else if (yon == "yukari") {
        // DÜZELTME BURADA: Sağdan Sola Vuruş
        // Hedef: 90 (Yukarı)
        // Başlangıç: 0 (Sağ) -> Bitiş: 180 (Sol)
        
        baslangic_acisi = 270;    // Kılıç sağdan başlasın
        yon_carpan = 1;         // Saat yönü tersi (CCW) - Yani 0 -> 45 -> 90 -> 180
        
        global.kilic_ekleme_x = 0;    
        global.kilic_ekleme_y = -10; 
		savurma.sprite_index = olusan_sprite;
		savurma.image_angle = 0;
    }
	
	if global.android {
		global.vurus_acisi = 0;
		if global.joystick_dokunma {
			global.vurus_acisi = global.joystick_acisi - 90;	
		}
		global.vurus_acisi = 0;
		var en_yakin = 99999;
		var en_yakin_hayvan = noone;
		if global.vurus_acisi == 0 {
			for (var i = 0; i < ds_list_size(global.hayvanlar_bellek); i++) {
				var hayvanim = asset_get_index(global.hayvanlar_bellek[| i]);
			
				if !instance_exists(hayvanim) {
					show_debug_message("bulamadik" + string(hayvanim));
					continue;
				}
			
				var en_yakinim = instance_nearest(global.cikolata.x, global.cikolata.y, hayvanim);
				var en_yakin_mesafe = point_distance(global.cikolata.x, global.cikolata.y, en_yakinim.x, en_yakinim.y);
			
				if en_yakin_mesafe < en_yakin {
					en_yakin_hayvan = hayvanim;
					global.vurus_acisi = point_direction(global.cikolata.x, global.cikolata.y, en_yakinim.x, en_yakinim.y) - 90;
					//show_debug_message(global.vurus_acisi);
				}	
			}
		}
		
		
		if room == rm_krallik_4_yangin && instance_exists(obj_boss_lale) {
			var en_yakin_yangin = 99999;
			var en_yakin_obje = noone;
			
			var en_yakinim = instance_nearest(global.cikolata.x, global.cikolata.y, obj_boss_lale);
			
			if obj_boss_lale.hasar_aldi && instance_exists(obj_boss_lale_buyuk_polen) {
				en_yakinim = instance_nearest(global.cikolata.x, global.cikolata.y, obj_boss_lale_buyuk_polen);
			}
			
			var en_yakin_mesafe = point_distance(global.cikolata.x, global.cikolata.y, en_yakinim.x, en_yakinim.y);
			
				if en_yakin_mesafe < en_yakin {
					global.vurus_acisi = point_direction(global.cikolata.x, global.cikolata.y, en_yakinim.x, en_yakinim.y) - 90;
				}	
		}
		
		savurma.sprite_index = olusan_sprite;
		savurma.image_angle = global.vurus_acisi;
		savurma.image_xscale = 1;
	}
	
	else {
		global.vurus_acisi = point_direction(global.cikolata.x, global.cikolata.y, mouse_x, mouse_y) - 90;
		aci = global.vurus_acisi;
		savurma.sprite_index = olusan_sprite;
		savurma.image_angle = aci;
		savurma.image_xscale = 1;
	}
    // İlk karede doğru açıda doğması için:
    image_angle = baslangic_acisi;
	image_alpha = 0;
}