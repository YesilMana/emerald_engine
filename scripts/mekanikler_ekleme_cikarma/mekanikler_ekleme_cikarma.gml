function mekanikler_ekleme_cikarma() { //globallerin tanımlandığı yere konulacak
	global.ates_mekanigi = true;
	global.mini_envanter_gorunme = true;
	global.stats_gorunme = true;
	global.kucuk_stats_simgeleri = true;
	global.orijinal_sekmeler = true;
	global.envanter_ekrani_normal = true;
	global.kosma_acik = false;
	global.stat_normal_dusus = false;
	
	global.cikolata_hareket_hizi = 1.5;
	global.cikolata_hareket_hizi_hizli = 2;
	global.cikolata_hareket_hizi_yavas = 0.5;
	
	global.alt_baslik = hex_to_color("cbb880");
	global.baslik = hex_to_color("f4edc9");
}

function stats_surekli_dusus() {
	global.stat_surekli_dusus_su = 0.0017;
	global.stat_surekli_dusus_kalori = 0.0008;
	global.stat_surekli_dusus_sicaklik = 0.001;
}

function mekanik_duzenlemeler() {
	if !global.orijinal_sekmeler {
		global.sekme_numara_envanter = 1;
		global.sekme_numara_craft = 6;
		global.sekme_numara_ates = 7;
		global.sekme_numara_stats = 4;
		global.sekme_numara_sandik = 5;
		global.sekme_numara_gorevler = 2;
		global.sekme_numara_ayarlar = 3;
	}
	else {
		global.sekme_numara_envanter = 1;
		global.sekme_numara_craft = 2;
		global.sekme_numara_ates = 3;
		global.sekme_numara_stats = 4;
		global.sekme_numara_sandik = 5;
		global.sekme_numara_gorevler = 6;
		global.sekme_numara_ayarlar = 7;
	}
}	