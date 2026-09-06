function saat_ilerleme(){ //Tüm oyun boyu çalışacak
	if !mekanik_saat exit;
	var zaman_atla = global.timer % room_speed == 0;
	
	if zaman_atla && false {
		global.dakika += 1;
		
		if global.dakika >= 60 {
			global.dakika = 0;
			global.saat += 1;
			
			if global.saat >= 24 {
				global.saat = 0;	
			}
		}
	}
}

