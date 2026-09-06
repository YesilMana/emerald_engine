function nihai_globaller_1(){ 
	global.kontroli = [];
	mekanikler_ekleme_cikarma();
	envanter_makro();
	var t0 = get_timer();
	json_okuma_buffered();
	show_debug_message("json_okuma_buffered: " + string((get_timer()-t0)/1000) + " ms");
	envanter_analiz_et();
	envanter_ekrani_ozellestirme_globaller();
	ates_globalleri();
	kalori_globalleri();
	su_globalleri();
	sicaklik_global();
	efekt_global();
	hayvan_globalleri();
	kilic_globaller();
	can_sistemi();
	konusma_globalleri();
	hava_durumu_global();
	gorev_kayittan_yukleme();
	srb_global();
	mekanik_duzenlemeler();
	stats_surekli_dusus();
	genel_nihai_globaller();
	genel_globaller();
}