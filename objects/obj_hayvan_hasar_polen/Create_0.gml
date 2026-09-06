// Rastgele yukarı doğru bir saçılma açısı (şemsiye gibi açılması için)
direction = irandom_range(45, 135); 

// Hız biraz daha yüksek başlasın, sürtünme ile yavaşlayacak
speed = random_range(2, 3); 

// Yerçekimi ekleyelim (yukarı çıkıp aşağı süzülmesi için)
gravity = 0.25;
gravity_direction = random(360); // Aşağı yön

// Sürtünme (yavaşlama etkisi)
friction = 0.1;

// Görsel varyasyonlar
image_angle = irandom(360);
rotasyon_hizi = random_range(-25, 25); // Dönme hızı

// Boyut ve opaklık
scale = random_range(0.1, 0.3);
image_xscale = scale;
image_yscale = scale;
image_alpha = random_range(0.5, 1);

image_blend = choose(
    hex_to_color("FFD700"), // Altın Sarısı
    hex_to_color("FFEC8B"), // Açık Krem Sarısı
    hex_to_color("F4A460"), // Kumlu Kahverengi/Sarı
    hex_to_color("DAA520"), // Altın Başak
    hex_to_color("FFFACD")  // Limon Şifonu (Çok açık sarı)
);