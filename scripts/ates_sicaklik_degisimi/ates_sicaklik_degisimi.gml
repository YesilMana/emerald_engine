function ates_sicaklik_degisimi(){ 
	if !mekanik_ates exit;
	if instance_exists(global.en_yakin_ates) && global.atese_yakin && global.en_yakin_ates.yaniyor && !zaman_dur {
		stat_degisim("sicaklik", 0.0065, 0);	
	}
	if !global.atese_yakin {
		stat_degisim("sicaklik", 0, global.stat_surekli_dusus_sicaklik)	
	}
}