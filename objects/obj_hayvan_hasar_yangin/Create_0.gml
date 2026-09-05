// Rastgele yukarı doğru bir saçılma açısı (şemsiye gibi açılması için)
direction = irandom_range(45, 135); 

// Hız biraz daha yüksek başlasın, sürtünme ile yavaşlayacak
speed = random_range(2, 3); 

// Yerçekimi ekleyelim (yukarı çıkıp aşağı süzülmesi için)
gravity = 0.25;
gravity_direction = 270; // Aşağı yön

// Sürtünme (yavaşlama etkisi)
friction = 0.1;

// Görsel varyasyonlar
image_angle = irandom(360);
rotasyon_hizi = random_range(-25, 25); // Dönme hızı

// Boyut ve opaklık
scale = random_range(0.8, 2);
image_xscale = scale;
image_yscale = scale;
image_alpha = 1;

image_blend = choose(
    hex_to_color("FF0000"), // Saf Kırmızı
    hex_to_color("FF4500"), // Turuncu Kırmızı (Kor rengi)
    hex_to_color("FF8C00"), // Koyu Turuncu
    hex_to_color("FFA500"), // Saf Turuncu
    hex_to_color("FFD700"), // Altın Sarısı
    hex_to_color("FFFF00")  // Saf Sarı
);