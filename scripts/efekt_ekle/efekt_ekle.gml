function efekt_ekle(efekt_kodu, efekt_suresi){
	bilgi_ver(global.genel_yazilar[332]);
	for (var i = 0; i < array_length(global.aktif_efektler); i++) {
		if global.aktif_efektler[i] == efekt_kodu {
			global.efekt_timer[i] = efekt_suresi;
			exit;
		}
		if global.aktif_efektler[i] == 0 {
			bilgi_ver(global.efekt_isimler[? string(efekt_kodu)], 4);
			if !global.hikaye_kontrolleri_14 {
				global.hikaye_kontrolleri_14 = true;
			}
			global.efekt_timer[i] = efekt_suresi;
			global.aktif_efektler[i] = efekt_kodu;
			break;
		}
	}
}

