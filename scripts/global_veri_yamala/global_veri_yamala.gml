/// @function global_veri_yamala(global_degisken_adi_string, kaynak_veri_id)
/// @description Global değişkeni, kaynak verinin tipine göre güvenli şekilde oluşturur ve kopyalar.

function global_veri_yamala(_global_isim, _kaynak_veri) {
    // 1. GÜVENLİK DUVARI: Veri yoksa veya sayısal bir ID değilse (string/array vs geldiyse) iptal et.
    if (is_undefined(_kaynak_veri)) return;
    if (!is_real(_kaynak_veri)) return; 

    // --- DURUM A: KAYNAK BİR MAP İSE ---
    if (ds_exists(_kaynak_veri, ds_type_map)) {
        
        // Global yoksa oluştur
        if (!variable_global_exists(_global_isim)) {
            variable_global_set(_global_isim, ds_map_create());
        }

        var _hedef = variable_global_get(_global_isim);

        // Hedef bozuksa, sayı değilse veya map değilse -> Sıfırdan map oluştur
        if (!is_real(_hedef) || !ds_exists(_hedef, ds_type_map)) {
            _hedef = ds_map_create();
            variable_global_set(_global_isim, _hedef);
        }

        // Güvenli Kopyalama
        ds_map_copy(_hedef, _kaynak_veri);
    }
    
    // --- DURUM B: KAYNAK BİR LIST İSE ---
    else if (ds_exists(_kaynak_veri, ds_type_list)) {
        
        // Global yoksa oluştur
        if (!variable_global_exists(_global_isim)) {
            variable_global_set(_global_isim, ds_list_create());
        }

        var _hedef = variable_global_get(_global_isim);

        // Hedef bozuksa, sayı değilse veya list değilse -> Sıfırdan list oluştur
        if (!is_real(_hedef) || !ds_exists(_hedef, ds_type_list)) {
            _hedef = ds_list_create();
            variable_global_set(_global_isim, _hedef);
        }

        // Güvenli Kopyalama
        ds_list_copy(_hedef, _kaynak_veri);
    }
}