function hayvan_can_gosterme(){ //Draw eventi için
	var yukseklik = can_bari_olusma_yukseklik;
	
	var opaklik = 0.4;
	
	if image_alpha == 0 opaklik = 0;
	if kalkan != temel_kalkan || can != temel_can {
		if kalkan > 0 {
			var _yuzde = kalkan / temel_kalkan;
			_yuzde = clamp(_yuzde, 0, 1);
			var indec = _yuzde * (12);	
		
			draw_sprite_ext(spr_kalkan_bari, indec, x, y - (yukseklik + 5), 1, 1, 0, c_white, opaklik);
		}
		if can > 0 {
			var _yuzde = can / temel_can;
			_yuzde = clamp(_yuzde, 0, 1);
			var indec = _yuzde * (12);	
		
			draw_sprite_ext(spr_can_bari, indec, x, y - yukseklik, 1, 1, 0, c_white, opaklik);
		}
	}
}

function hayvan_can_gosterme_boss(boss_objesi) { 
    // Draw eventi için
	
    // Boss objesi sahnede yoksa hata almamak için fonksiyondan çıkıyoruz
    if (!instance_exists(boss_objesi)) exit;
	
    var yukseklik = 20;
	
    // Kamera bilgilerini alıyoruz
    var cam = view_camera[0];
    var cam_x = camera_get_view_x(cam);
    var cam_y = camera_get_view_y(cam);
    var cam_w = camera_get_view_width(cam);
    // var cam_h = camera_get_view_height(cam); // Kullanılmadığı için devre dışı bırakılabilir
	
    // Can barının çizileceği X ve Y koordinatlarını belirliyoruz (Ekranın ortası üstü)
    var _y = cam_y + yukseklik;
    var _x = cam_x + (cam_w / 2);
	
    var opaklik = 1;
    
    // Eğer objenin kendi saydamlığı 0 ise can barı da görünmez olsun
    if (image_alpha == 0) opaklik = 0;
	
    // Boss'un canı 0'dan büyükse can barını çiz
    if (boss_objesi.can > 0) {
        
        // Can yüzdesini bul (0 ile 1 arasında bir değer: 1 tam dolu, 0 tam boş)
        var _yuzde = boss_objesi.can / boss_objesi.temel_can;
        
        // Olası hatalara karşı yüzdeyi 0 ve 1 aralığına hapsediyoruz (clamp)
        _yuzde = clamp(_yuzde, 0, 1);
        
        // GameMaker'da 12 karelik sprite'ın maksimum indeksi 11'dir.
        // ceil() fonksiyonu sayıyı her zaman yukarı yuvarlar.
        // Böylece can %1 bile kalsa indeks en az 1 olur ve "tamamen boş" görünmez.
        var indec = ceil(_yuzde * 11);	
        
        // Can barını ekrana çizdiriyoruz
        draw_sprite_ext(spr_boss_can_bari, indec, _x, _y, 2, 0.8, 0, c_white, opaklik);
    }
}