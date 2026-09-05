function konusma_sirasinda_olacaklar(gilobal){
    var sayi = global.konusma_tetikleyici[gilobal];
	var secim = global.yapilmis_secim;
	var z_basti = global.z_basildi;
    
    // Konuşma ID'sini string'e çevir
    var key = string(gilobal);
    
    // Bu konuşma için fonksiyon var mı kontrol et
    if (variable_struct_exists(global.konusma_olaylari, key)) {
        // Fonksiyonu al
        var fonksiyon = global.konusma_olaylari[$ key];
        // Fonksiyonu çalıştır
        fonksiyon(sayi, secim, z_basti);
    }
}

function secim_gonder(){
    var secim = global.yapilmis_secim;
    global.secim_yapiliyor = false;
    
    // argument_count kadar parametreyi al
    if (secim >= 1 && secim <= argument_count) {
        secim_array(argument[secim - 1]);
    }
    
    global.yapilmis_secim = 1;
}

function secim_sonuclari(secenek_numarasi) {
	if global.yapilmis_secim == secenek_numarasi return true;
	else return false;
}