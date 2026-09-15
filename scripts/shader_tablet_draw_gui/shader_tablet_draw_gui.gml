function shader_tablet_draw_gui(){
	if !global.kontrol_menusu_acik exit;
	// DRAW GUI EVENTİ (veya Post-Draw)

	// Uniform (Değişken) bağlantılarını al
	var u_rect = shader_get_uniform(sh_tablet_glow, "u_tablet_rect");
	var u_radius = shader_get_uniform(sh_tablet_glow, "u_glow_radius");
	var u_dark = shader_get_uniform(sh_tablet_glow, "u_darkness");
	var u_color = shader_get_uniform(sh_tablet_glow, "u_glow_color");
	var u_ratio = shader_get_uniform(sh_tablet_glow, "u_aspect");

	shader_set(sh_tablet_glow);

	// Değerleri Gönder
	// Not: UV değerleri 0 ile 1 arasındadır. Ekranın % kaçına denk geldiğini yazıyoruz.
	// Örnek: Tablet ekranın solundan %10 (0.1), üstünden %20 (0.2) içeride başlasın. 
	// Genişliği ekranın %80'i (0.8), yüksekliği %60'ı (0.6) olsun.
	shader_set_uniform_f(u_rect, 280/1920, 150/1080, 1456/1920, 753/1080); 

	// Işığın yayılma mesafesi (Büyüttükçe ışık daha uzağa taşar)
	shader_set_uniform_f(u_radius, 0.15); 

	// Arka plan karanlığı (0.0 Zifiri karanlık, 0.5 Yarı karanlık, 1.0 Normal)
	shader_set_uniform_f(u_dark, 0.2); 

	// Işığın rengi (RGB 0-1 arası). Aşağıdaki hafif sarımsı bir ekran ışığıdır.
	shader_set_uniform_f(u_color, 0.9, 0.9, 0.9); 

	// Ekran oranı (Işığın yuvarlak taşması için şarttır)
	shader_set_uniform_f(u_ratio, window_get_width() / window_get_height());

	// Tüm bu efektleri Application Surface (Oyunun ana tuvali) üzerine uygula çiz.
	draw_surface(application_surface, 0, 0);

	shader_reset();
}