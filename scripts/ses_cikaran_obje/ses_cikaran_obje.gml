function ses_cikaran_obje(obje, max_uzaklik, ses, ses_seviyesi_tanim = noone, ses_mi_muzik_mi = 1, false_ise_calmayacak = true) {
	if false_ise_calmayacak == false {
		if audio_is_playing(ses) {
            audio_stop_sound(ses);
        }
		exit;
	}	
    if instance_exists(obje) {
		var uzaklik = 20;
		
		if instance_exists(global.cikolata) {
		   uzaklik = point_distance(global.cikolata.x, global.cikolata.y, obje.x, obje.y);
		}
		
        if uzaklik < max_uzaklik {
            if !audio_is_playing(ses) {
                audio_play_sound(ses, 1, false);
            }
			
			var seviye_belirleme = global.ses_seviyesi;
			if ses_mi_muzik_mi == 2 seviye_belirleme = global.muzik_seviyesi;
            
            // Exponential easing - uzaktan yavaş başlar, yakında hızlanır
            var oran = 1 - (uzaklik / max_uzaklik); // Tersini aldık (0=uzak, 1=yakın)
            var ses_seviyesi = power(oran, 4); // 3 iyi, daha sert istersen 4-5
            ses_seviyesi = clamp(ses_seviyesi, 0, seviye_belirleme);
            
			if ses_seviyesi_tanim != noone  audio_sound_gain(ses, ses_seviyesi_tanim, 0);
            else audio_sound_gain(ses, ses_seviyesi, 0);
			
        } else {
            if audio_is_playing(ses) {
                audio_stop_sound(ses);
            }
        }
    } 
	 else {
         if audio_is_playing(ses) {
             audio_stop_sound(ses);
         }
     }
}

function tek_seferlik_ses(obje, max_uzaklik, ses, ses_nadirligi, maksimum_ses = 1) {
    if instance_exists(obje) {
        var uzaklik = point_distance(global.cikolata.x, global.cikolata.y, obje.x, obje.y);
        
        // 1. ADIM: Ses çalınsa da çalınmasa da seviyeyi hesapla (Sürekli güncelleme için)
        var oran = clamp(1 - (uzaklik / max_uzaklik), 0, 1);
        var ses_seviyesi = power(oran, 4) * global.ses_seviyesi / maksimum_ses;

        // 2. ADIM: Ses çalmıyorsa ve şans yaver giderse sesi başlat
        if (uzaklik < max_uzaklik) && (!audio_is_playing(ses)) && (irandom(ses_nadirligi) == 0) {
             audio_play_sound(ses, 1, false);
        }

        // 3. ADIM: Ses çalmaya devam ediyorsa, seviyesini sürekli güncelle
        // Bu satır if'in dışında olduğu için global.ses_seviyesi değiştiği an sese yansır
        if (audio_is_playing(ses)) {
            audio_sound_gain(ses, ses_seviyesi, 0);
        }
    }
}