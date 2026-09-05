// Ömür törpüsü
omur -= omur_azalma_hizi;

if (omur <= 0) {
    instance_destroy();
}

// --- Animasyonun Kalbi ---

// 1. Uzama Efekti: Kılıç izi hızla uzasın (Kısa başlayıp uzayacak)
// Lerp: Mevcut değeri hedefe doğru yumuşakça götürür (0.2 hızıyla)
image_yscale = lerp(image_yscale, hedef_uzunluk, 0.25);

// 2. İncelme Efekti: Kılıç izi uzadıkça incelsin (Jilet etkisi)
// Başta kalın, sonra jilet gibi incecik olup kaybolsun
image_xscale = lerp(image_xscale, hedef_kalinlik, 0.1);

// 3. Opaklık: Ömürle doğru orantılı olsun
// Ama son anlarına kadar parlak kalsın, sonra aniden sönmesin diye power kullanabiliriz
image_alpha = omur;