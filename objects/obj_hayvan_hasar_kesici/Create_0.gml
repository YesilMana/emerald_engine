// --- NÜFUS KONTROLÜ (KAOS ENGELLEYİCİ) ---
// Eğer sahnede bu efektten zaten 1 tane varsa, yenisini oluşturma, hemen yok et.
// Böylece 20 düşmana vursan da ekranda tek bir net kesik görünür.
if (instance_number(object_index) > 1) { 
    instance_destroy();
    exit; // Kodu burada kes, aşağıdakileri okuma bile
}

// --- STANDART AYARLAR ---
omur = 1.0; 
omur_azalma_hizi = 0.1; 

// Başlangıç boyutları
image_xscale = 1.2; 
image_yscale = 4; 

// Hedef boyutlar 
hedef_uzunluk = 2.5; 
hedef_kalinlik = 0.05; 

// Açı Hesaplama
if (global.android) {
    var anglem = global.joystick_acisi;
} else {
    var anglem = global.vurus_acisi;    
}

// HEDEF VE KONUM DÜZELTMESİ
// Eğer dışarıdan bir hedef (_x, _y) geldiyse açıyı ona göre ayarla
if (variable_instance_exists(id, "_x") && variable_instance_exists(id, "_y")) {
    var angle = point_direction(_x, _y, global.cikolata.x, global.cikolata.y);
    image_angle = angle; 
    
    // ÖNEMLİ DOKUNUŞ: 
    // Efekti düşmanların tam ortasına koymak yerine, 
    // vuruşu yapan oyuncunun kılıcının ucunda veya düşman grubunun merkezinde göstermek daha iyidir.
    // Ama şimdilik mevcut konumda kalsın, sadece açıyı düzelttik.
} else {
    image_angle = anglem;
}