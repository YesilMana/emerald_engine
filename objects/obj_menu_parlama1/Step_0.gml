image_alpha = opaklik;

// Rastgele tetiklenme
if (opaklik <= 0) {
    tetikleyici = irandom(1000);
    if (tetikleyici <= tetiklenme_ihtimal) {
        opaklik_artis = true;
    }
}

// Yavaşlatılmış Şimşek Artışı
if (opaklik_artis) {
    // 0.4 yerine 0.15 yaparak yükselişi daha "görünür" ve kontrollü hale getirdik
    opaklik = lerp(opaklik, 1.1, 0.15); 
    
    if (opaklik >= 0.98) {
        opaklik = 1;
        opaklik_artis = false;
    }
} 
// Daha da Narin Düşüş
else if (opaklik > 0) {
    // 0.005 yerine 0.002 yaparak sönme süresini uzattık
    opaklik -= 0.002; 
}

if (opaklik < 0) opaklik = 0;