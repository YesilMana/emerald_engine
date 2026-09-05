// Kendi etrafında dönme
image_angle += rotasyon_hizi;

// Yavaş yavaş küçülme (Shrink effect)
// Bu çok "sulu" bir efekt katar
image_xscale = lerp(image_xscale, 0, 0.05);
image_yscale = image_xscale;

// Opaklık azalması
if (speed < 1) { 
    // Hızlandıkça değil, yavaşladıkça daha hızlı sönümlensin
    image_alpha -= 0.0001; 
} else {
    image_alpha -= 0.0001;
}

// Tamamen görünmez olunca veya çok küçülünce yok et
if (image_alpha <= 0 || image_xscale <= 0.01) {
    instance_destroy();
}