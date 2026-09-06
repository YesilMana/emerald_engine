// Step Event (kilic_savurma fonksiyonu yerine)
function kilic_savurma() {
	x = global.kilic_olusum_x;
	y = global.kilic_olusum_y;
    
    // Açıyı değiştir
    var degisim = savurma_hizi * yon_carpan;
    image_angle += degisim;
    
    // Mutlak değer (abs) kullanarak ne kadar döndüğümüzü topluyoruz
    toplam_donen += abs(degisim);
		//show_message("a");
	//var kilici = instance_create_layer(x, y, "esyalar", obj_kilic_golge);
	//kilici.image_angle = image_angle;
    
    // Kılıcın, oyuncuyu takip etmesi gerekiyorsa x ve y'yi burada güncellemelisin.
    // x = obj_oyuncu.x + lengthdir_x(...) gibi.
    
    // Hedeflenen yayı tamamladı mı?
    if (toplam_donen >= hedef_donme) {
        instance_destroy();
    }
}