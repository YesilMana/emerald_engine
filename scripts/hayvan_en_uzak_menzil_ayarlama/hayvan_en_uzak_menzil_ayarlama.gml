function hayvan_en_uzak_menzil_ayarlama(){
    var max_saldiri = variable_global_get(obje_ismi + "_maksimum_saldiri");
    
    var secilen_en_kisa_menzil = 999999; 
    
    en_uzak_menzil = 0;

    for (var i = 1; i <= max_saldiri; i++) {
        var saldiri_key = "hasar_" + string(i);
        var prefix = obje_ismi + "_" + saldiri_key + "_";
        var menzil = variable_global_get(prefix + "menzil");
        
        if (menzil > en_uzak_menzil) {
            en_uzak_menzil = menzil;    
        }

        if (oyuncu_uzaklik != 9999 && oyuncu_uzaklik <= menzil) {
            
            if (menzil < secilen_en_kisa_menzil) {
                kullanilan_saldiri = i;
                secilen_en_kisa_menzil = menzil; 
            }
        }
    }
}