function craft_edilebilir_mi(key) {
    //envanter_analiz_et(); // Envanteri güncelle
	global.eksik_esyalar = [];
    var malzemeler = global.craft_bilgi[? key];
    if (malzemeler == undefined) return false;

    var map_key = ds_map_find_first(malzemeler);
    while (map_key != undefined) {
        // "craftlanabilir" gibi özel anahtarları atla
        if (craft_json_fazlaliklar) {
            var gereken_adet = malzemeler[? map_key];

            // "esya_5" → 5
            var esya_id = real(string_delete(map_key, 1, 5));

            // Envanterde yeterli miktar var mı?
            if (!is_real(global.envanter[esya_id]) || global.envanter[esya_id] < gereken_adet) {
				array_push(global.eksik_esyalar, esya_id);
            }
        }

        map_key = ds_map_find_next(malzemeler, map_key);
    }
	
	if array_length(global.eksik_esyalar) > 0 {
		
		return false;	
	}
	
	var key_1 = malzemeler[? "uretim_icin_gereken"];
	if key_1 != undefined {
		if global.envanter[key_1] == 0 {
			return false;	
		}
	}
	
	var key_4 = malzemeler[? "ates"];
	if key_4 != undefined {
		if !global.atese_yakin {
			return false;
		}
		
		if global.atese_yakin && global.en_yakin_ates.yaniyor <= 0 {
			return false;	
		}
	}
    return true; // Tüm malzemeler bulunduysa
}