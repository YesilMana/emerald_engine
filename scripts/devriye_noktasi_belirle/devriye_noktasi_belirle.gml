function devriye_noktasi_belirle(){
    
    var uygun_nokta_bulundu = false;
    var deneme_sayisi = 0; // Sonsuz döngüyü engellemek için güvenlik
    
    // Uygun nokta bulunana kadar dön
    while (!uygun_nokta_bulundu && deneme_sayisi < 100) {
        
        deneme_sayisi++; 
        
        // 1. Koordinatları Belirle
        var rastgele_x, rastgele_y;
        
        if variable_instance_exists(id, "kayit_x") && variable_instance_exists(id, "kayit_y") {
            rastgele_x = irandom_range(kayit_x - devriye_yaricapi, kayit_x + devriye_yaricapi);
            rastgele_y = irandom_range(kayit_y - devriye_yaricapi, kayit_y + devriye_yaricapi);
        }
        else {
            rastgele_x = irandom_range(ilk_x - devriye_yaricapi, ilk_x + devriye_yaricapi);
            rastgele_y = irandom_range(ilk_y - devriye_yaricapi, ilk_y + devriye_yaricapi);    
        }
        
        // 2. Sınırları Ayarla
        var tolerans_x = 50;
        var tolerans_y = 100;
        hedef_x = clamp(rastgele_x, tolerans_x, room_width - tolerans_x);
        hedef_y = clamp(rastgele_y, tolerans_y, room_height - tolerans_y);
        
        // 3. Kontrol Et: Çakışma yoksa döngüden çık
        if (!instance_place(hedef_x, hedef_y, obj_blok)) {
            uygun_nokta_bulundu = true;
        }
    }
}