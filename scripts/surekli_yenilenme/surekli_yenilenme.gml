function surekli_yenilenme(){ //Tüm oyun boyunca çalışacak bir yere konulacak
	if global.timer % 20 == 0 {
		craft_son_kontrol();
	}
	
	if global.timer % 60 == 0 {
		global.craft_opaklik_kontrol = true;
		ates_yakinlik_kontrol();
		envanter_analiz_et();
	}
}