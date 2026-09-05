function sistemsel_kontroller() {
	if keyboard_check_pressed(vk_f4) { //Ekranı tam ekran yapma
	    window_set_fullscreen(!window_get_fullscreen());
	}
	
	global.harita_uzaklasti = global.harita_tus_basildi && !duraklatmak && !global.konusma_basladi && global.ara_sahne_duracagi_saniye <= 0 && !global.hikaye_kontrolleri_290 && harita_uzaklasacak_odalar;
	global.secili_karakter = variable_global_get(global.cikolata_spritesi);
	if global.envanter_ekrani_gorunme {
		if global.envanter_alpha <= 0.6 global.envanter_alpha += 0.07;
	}
	else {
		global.envanter_alpha = 0;
	}	
	
	
	
	if (!window_has_focus()) {
		if !karakter_yuruyemez && !oyuncu_komut_veremez {
			global.envanter_ekrani_gorunme = true;
			global.envanter_sekme = global.sekme_numara_ayarlar;
		}
	}
	
	if (instance_exists(global.cikolata)) {
	    audio_listener_position(global.cikolata.x, global.cikolata.y, 0);
	    audio_listener_orientation(0, 0, 1000, 0, -1, 0);
	}	
	
	if !global.stat_normal_dusus {
		global.kalori = 100;	
		global.su = 100;	
		global.sicaklik = 100;	
	}
}