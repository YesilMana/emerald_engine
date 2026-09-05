// 1. SADECE YATAY HAREKET
x += hiz * yon;

// 2. KENDİ ETRAFINDA YAVAŞÇA DÖNME
// Bu, cismin "buz üzerinde kayıyor" gibi görünmesini engeller, havada asılı hissi verir.
image_angle += donus_hizi;

// 3. OPAKLIK KONTROLÜ (FADE IN)
// Oyun başladığında "pat" diye belirmezler, yavaşça görünür olurlar.
if (image_alpha < max_alpha) {
    image_alpha += 0.002; // Çok yavaşça belirir
}

// 4. EKRANDAN ÇIKINCA GERİ DÖN (SONSUZ DÖNGÜ)
// Ekranın sağından çıkarsa solundan, solundan çıkarsa sağından girsin.
var margin = 150; // Sprite genişliğin (148) olduğu için biraz pay bıraktık

if (x > room_width + margin) {
    x = -margin;
    y = random(room_height); // Geri döndüğünde farklı bir yükseklikten girsin
    image_alpha = 0; // Tekrar yavaşça belirsin
}

if (x < -margin) {
    x = room_width + margin;
    y = random(room_height);
    image_alpha = 0;
}


opaklik = image_alpha;