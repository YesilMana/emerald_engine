if yukselen == 1 {
	
	var toplam_ms = (get_timer() - global.yukleme_baslangic) / 1000;
    show_debug_message("=== TOPLAM YÜKLEME SÜRESİ: " + string(toplam_ms) + " ms ===");
}
yukselen += 1;