function joystick_dokunma_yok_kontrol(){
    var tetik_uzaklik = 10;
    var yavaslik_uzaklik = 20;
    var tetik_tanim = point_distance(obj_joystick_temel.x, obj_joystick_temel.y, x, y);
    var tetiklenme = (tetik_tanim > tetik_uzaklik);
    
    // --- 1. ADIM: Bu karede (step) hangi yönler isteniyor? ---
    var _istenen_sag = false;
    var _istenen_sol = false;
    var _istenen_yukari = false;
    var _istenen_asagi = false;

    if (global.joystick_dokunma && global.joystick_tiklama && tetiklenme) {
        
        // Yavaş yürüme kontrolü
        if (tetik_tanim < yavaslik_uzaklik) {
            global.yavas_yurume = false;    
        } else {
            global.yavas_yurume = false; 
        }   
        
        var yontem = point_direction(obj_joystick_temel.x, obj_joystick_temel.y, x, y);
		global.joystick_acisi = yontem;
        
        // Açılara göre yön belirleme
        if ((yontem >= 337.5 && yontem <= 360) || (yontem >= 0 && yontem < 22.5)) {
            _istenen_sag = true;
        } 
        else if (yontem >= 22.5 && yontem < 67.5) {
            _istenen_sag = true;
            _istenen_yukari = true;
        }
        else if (yontem >= 67.5 && yontem < 112.5) {
            _istenen_yukari = true;
        }
        else if (yontem >= 112.5 && yontem < 157.5) {
            _istenen_yukari = true;
            _istenen_sol = true;
        }
        else if (yontem >= 157.5 && yontem < 202.5) {
            _istenen_sol = true;
        }
        else if (yontem >= 202.5 && yontem < 247.5) {
            _istenen_sol = true;
            _istenen_asagi = true;
        }
        else if (yontem >= 247.5 && yontem < 292.5) {
            _istenen_asagi = true;
        }
        else if (yontem >= 292.5 && yontem < 337.5) {
            _istenen_asagi = true;
            _istenen_sag = true;
        }
    }

    // --- 2. ADIM: Olayları Hesapla (Pressed & Released) ---
    
    // A) ÇEKİLDİ (Released): Eskiden vardı, şimdi yok.
    global.sag_cekildi = (global.sag_basildi && !_istenen_sag);
    global.sol_cekildi = (global.sol_basildi && !_istenen_sol);
    global.yukari_cekildi = (global.yukari_basildi && !_istenen_yukari);
    global.asagi_cekildi = (global.asagi_basildi && !_istenen_asagi);

    // B) TIKLANDI / İLK BASIŞ (Pressed): Eskiden yoktu, şimdi var. (İSTEDİĞİN ÖZELLİK)
    global.sag_tiklandi = (!global.sag_basildi && _istenen_sag);
    global.sol_tiklandi = (!global.sol_basildi && _istenen_sol);
    global.yukari_tiklandi = (!global.yukari_basildi && _istenen_yukari);
    global.asagi_tiklandi = (!global.asagi_basildi && _istenen_asagi);

    // --- 3. ADIM: Durumu Güncelle (Hold) ---
    // Bir sonraki kare için referans olacak.
    global.sag_basildi = _istenen_sag;
    global.sol_basildi = _istenen_sol;
    global.yukari_basildi = _istenen_yukari;
    global.asagi_basildi = _istenen_asagi;
}