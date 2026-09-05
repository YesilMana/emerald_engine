function karakter_ziplat(ziplayacak_karakter, ziplama_sikligi, ziplama_pixeli, ziplama_yonu_yatay_dikey) {
    if ziplayacak_karakter.zipla_x == 0 && ziplayacak_karakter.zipla_y == 0 {
        ziplayacak_karakter.zipla_x = ziplayacak_karakter.x;
        ziplayacak_karakter.zipla_y = ziplayacak_karakter.y;
    }
    
    // 3. ADIM: Hareketi uygulayalım
    if (global.timer % ziplama_sikligi) == 0 {
        // İleri zıplama anı
        if (ziplama_yonu_yatay_dikey == "yatay") {
            ziplayacak_karakter.x = ziplayacak_karakter.zipla_x + ziplama_pixeli;    
        }
        else if (ziplama_yonu_yatay_dikey == "dikey") {
            ziplayacak_karakter.y = ziplayacak_karakter.zipla_y + ziplama_pixeli;
        }    
    }
    if (global.timer % (ziplama_sikligi * 2) == 0) {
        // Geriye zıplama anı
        if (ziplama_yonu_yatay_dikey == "yatay") {
            ziplayacak_karakter.x = ziplayacak_karakter.zipla_x - ziplama_pixeli;    
        }
        else if (ziplama_yonu_yatay_dikey == "dikey") {
            ziplayacak_karakter.y = ziplayacak_karakter.zipla_y - ziplama_pixeli;
        }    
    }
}

function karakter_zipla_durdur(obje_ismi) {
	obje_ismi.ziplatiliyor = false;	
	obje_ismi.zipla_x = 0;
	obje_ismi.zipla_y = 0;
}