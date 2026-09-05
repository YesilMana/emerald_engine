function bildirim_kontrolleri() {
	if global.timer % 30 == 0 {
		var gorev_aktiflik = false;
		var map_uzunluk = ds_map_size(global.gorev_json);
		if map_uzunluk > 1 {
			for (var i = 1; i <= map_uzunluk; i++) {
				if gorev_aktif_mi(i) == true {
					gorev_aktiflik = true;
					break;
				}
			}
			if !gorev_aktiflik {
				global.guncel_bildirim = 0;
				global.bakilan_bildirim = 0;
			}
		}
	}

	global.stat_minik_opaklik = [1, 1, 1, 1, 1, 1, 0, 0];

    global.yagmur_yagiyor = global.hikaye_kontrolleri_20;
	global.hikaye_kontrolleri_30 = global.guncel_bildirim;
	global.hikaye_kontrolleri_31 = global.bakilan_bildirim;
    
	if global.guncel_bildirim < 0 global.guncel_bildirim = 0;	
}