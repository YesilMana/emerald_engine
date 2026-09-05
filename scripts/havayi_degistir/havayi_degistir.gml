function havayi_degistir(color_tint_1, color_tint_2, color_tint_3, tint_strength, contrast, saturation, degisim_gucu){
    if instance_exists(obj_shader_android) {
		var referans = obj_shader_android;
	    var aralik = 0.05;
	    var renk_1 = referans.color_tint[0];
	    var renk_2 = referans.color_tint[1];
	    var renk_3 = referans.color_tint[2];
    
	    referans.color_tint[0] = degistir(renk_1, color_tint_1, degisim_gucu, aralik);
	    referans.color_tint[1] = degistir(renk_2, color_tint_2, degisim_gucu, aralik);
	    referans.color_tint[2] = degistir(renk_3, color_tint_3, degisim_gucu, aralik);
	    referans.tint_strength = degistir(referans.tint_strength, tint_strength, degisim_gucu, aralik);
	    referans.contrast = degistir(referans.contrast, contrast, degisim_gucu, aralik);
	    referans.saturation = degistir(referans.saturation, saturation, degisim_gucu, aralik);
    
	    // Tüm değerlerin hedefe ulaşıp ulaşmadığını kontrol et
	    var kontrol_1 = true;
    
	    if (referans.color_tint[0] != color_tint_1) kontrol_1 = false;
	    if (referans.color_tint[1] != color_tint_2) kontrol_1 = false;
	    if (referans.color_tint[2] != color_tint_3) kontrol_1 = false;
	    if (referans.tint_strength != tint_strength) kontrol_1 = false;
	    if (referans.contrast != contrast) kontrol_1 = false;
	    if (referans.saturation != saturation) kontrol_1 = false;
    
	    return kontrol_1;
	}
}

function degistir(renk_referans, istenilen_renk, degisim_gucu, aralik) {
    var donus = renk_referans;
    
    // Eğer fark yeterince küçükse, direkt hedef değeri döndür
    if (abs(donus - istenilen_renk) <= aralik) {
        return istenilen_renk;
    }
    
    // Değilse, yavaşça değiştir
    if (donus > istenilen_renk) {
        donus -= degisim_gucu;
    }
    else if (donus < istenilen_renk) {
        donus += degisim_gucu;
    }
    
    return donus;  //Değiştirilmiş değeri döndür!
}

