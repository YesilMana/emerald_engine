function hayvan_algilama(){
	var algilama_mesafesi = variable_global_get(obje_ismi + "_algilama_mesafesi");
	
	audio_emitter_position(yayici, x, y, 0);
	if instance_exists(global.cikolata) && global.timer % 5 == 0 {
		var mesafe = point_distance(x, y, global.cikolata.x, global.cikolata.y);
		if variable_instance_exists(id, "kayit_x") && variable_instance_exists(id, "kayit_y") {
			ilk_hareket_noktasi_uzaklik = point_distance(kayit_x, kayit_y, global.cikolata.x, global.cikolata.y);
		}
		
		else {
			ilk_hareket_noktasi_uzaklik = point_distance(ilk_x, ilk_y, global.cikolata.x, global.cikolata.y);
		}
		oyuncu_uzaklik = mesafe;
		
		if mesafe < algilama_mesafesi && variable_global_get(obje_ismi + "_saldirganlik") && hareket_sureci != hayvan_hareket.saldiri && ilk_hareket_noktasi_uzaklik < maksimum_kovalama && hareket_sureci != hayvan_hareket.hasar_yeme && hareket_sureci != hayvan_hareket.olum && hareket_sureci != hayvan_hareket.kacis && hareket_sureci != hayvan_hareket.degisik_noktaya_ilerleme && !karakter_yuruyemez {
			hareket_sureci = hayvan_hareket.kovalama;
		}
		
		if hareket_sureci != hayvan_hareket.hasar_yeme {
			hasar_aldi = false;	
		}
	}
}
