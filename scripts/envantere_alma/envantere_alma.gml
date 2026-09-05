function envantere_alma(esya_numarasi, _id) {
	
    if instance_exists(global.cikolata) && (point_distance(global.cikolata.x, global.cikolata.y, x, y) < global.esya_alma_uzaklik && esya_numarasi != 999) {
        global.z_basilabilir = true;
		global.e_spam_cikmayacak = true;
		global.z_renklendi_android = true;
		//show_debug_message(string("of" + string(_id)));
		if global.android var secilmis = global.z_basildi;
		else var secilmis = mouse_check_button_pressed(mb_left);
		
        if (secilmis && global.secildimmi_zemin == _id && !karakter_yuruyemez) {
			global.mouse_sprite_degisti[1] = 0;	
			if global.siniflandirma_esyalar[? "esya_" + string(esya_numarasi)] != undefined var envanter_numarasi = bos_slotu_bul();
            else var envanter_numarasi = hangi_slotta(esya_numarasi);    
            if (envanter_numarasi != 999) {
                var sayi_adet = 1;
                var saglamlik_degeri = 100;
                
                if (variable_instance_exists(_id, "mevcut_adet")) {
                    sayi_adet = _id.mevcut_adet;
                }
            
                if (variable_instance_exists(_id, "saglamlik")) {
                    saglamlik_degeri = _id.saglamlik;    
                }
                
                var slot = global.envanter_list[| envanter_numarasi];
                slot[? "esya"] = "esya_" + string(esya_numarasi);
                var adeta = slot[? "adet"];
                var yeni_adet = adeta + sayi_adet;
                slot[? "adet"] = yeni_adet;
                slot[? "saglamlik"] = saglamlik_degeri;
				
                global.secildimmi_zemin = noone;
                global.z_basilabilir = false;
                global.z_basildi = false;
                instance_destroy(_id);
				var ses_1 = "sfx_yerden_alma_genel_" + string(irandom_range(1, 7));
				var ses_2 = asset_get_index(ses_1);
				if esya_numarasi == 53 {
					ses_2 = global.sfx_yerden_alma_1;
				}
			
				audio_play_sound(ses_2, 1, false);
				audio_sound_gain(ses_2, global.ses_seviyesi);
				esya_konum_kaydetme();
            }
        }
    }
}

function yakinlik_belirleme() {
	if global.timer % 30 == 0 {
	    var en_yakin_mesafe = 999999;
	    var en_yakin_obje = noone;
		
		var obj_yakin = global.cikolata;
		
		if !global.android obj_yakin = obj_mouse;
    
	    for (var i = 0; i < global.envanter_son_oge; i++) {
	        var arama = asset_get_index("obj_bulunan_esya_" + string(i));
	        if instance_exists(arama) && (object_exists(arama)) {
				
	            var bulunan = instance_nearest(obj_yakin.x, obj_yakin.y, arama);
	            if (instance_exists(bulunan) && bulunan.esya_numarasi != 999) {
	                var mesafe = point_distance(obj_yakin.x, obj_yakin.y, bulunan.x, bulunan.y);
	                if (mesafe < en_yakin_mesafe && mesafe < global.esya_alma_uzaklik) {
						if point_distance(global.cikolata.x, global.cikolata.y, bulunan.x, bulunan.y) < global.esya_alma_uzaklik global.mouse_sprite_degisti[1] = 1;
	                    else global.mouse_sprite_degisti[1] = 0;	
						en_yakin_mesafe = mesafe;
	                    en_yakin_obje = bulunan;
	                }
					
					else {
						global.mouse_sprite_degisti[1] = 0;	
					}
	            }
	        }
	    }
    
	    // En yakın objeyi seç ve işaretle
	    if (en_yakin_obje != noone) {
			var bisiklet = en_yakin_obje
	        global.secildimmi_zemin = bisiklet;
	    } else {
	        global.secildimmi_zemin = noone;
	    }
	}
}