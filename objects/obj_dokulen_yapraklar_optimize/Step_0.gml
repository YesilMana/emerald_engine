// 1. SADECE YATAY HAREKET (Not: Hem x hem y arttığı için obje sağ alta çapraz gider)
x += hiz;
y += hiz;

// 2. KENDİ ETRAFINDA YAVAŞÇA DÖNME
image_angle += donus_hizi;

// 3. OPAKLIK KONTROLÜ (FADE IN)
if (image_alpha < max_alpha) {
    image_alpha += 0.002; 
}

// 4. EKRANDAN ÇIKINCA GERİ DÖN (SAĞ ALTTAN ÇIKIP, SOL ÜSTTEN GİRME)
var margin = 20; // Sprite payı

// Obje sağdan VEYA alttan çıkarsa sol üste ışınla
if (x > room_width + margin || y > room_height + margin) {
    x = random_range(-margin * 4, room_width)            // Sol tarafa al
    y = random(room_height); // Üst tarafta rastgele bir yükseklikten girsin (İstersen direkt -margin de yapabilirsin)
    image_alpha = 0;          // Tekrar yavaşça belirsin
}

// (Alternatif) Eğer hız negatif olur da sol üste doğru tersine giderse diye koruma:
if (x < -margin || y < -margin) {
    x = room_width + margin;
    y = room_height + margin;
    image_alpha = 0;
}

opaklik = image_alpha;