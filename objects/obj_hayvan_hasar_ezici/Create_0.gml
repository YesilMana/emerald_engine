// Rastgele yukarı doğru bir saçılma açısı (şemsiye gibi açılması için)
direction = irandom_range(0, 180); 

// Hız biraz daha yüksek başlasın, sürtünme ile yavaşlayacak
speed = random_range(3, 6); 

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

// Renk efekti (Opsiyonel: Bazen sarı bazen beyaz olsun)
image_blend = choose(c_white, c_maroon, c_orange, c_red);