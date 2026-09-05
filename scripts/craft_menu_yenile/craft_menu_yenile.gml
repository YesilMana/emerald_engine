function craft_menu_yenile(){
	ds_list_clear(global.craft_index);
	for (var i = 1; i < 8; i++) {
		ds_list_clear(variable_global_get("s_" + string(i)));
		ds_list_add(variable_global_get("s_" + string(i)), 0);
	}
	
	for (var i = 0; i < global.envanter_son_oge; i++) {
		global.craft_edilebilir_mi[i] = 0;
	    var key = "esya_" + string(i);
	    var malzemeler = global.craft_edilme_kontrol[? key];
		var craft_bilgisi = global.craft_bilgi[? key];
		

	    if (craft_bilgisi != undefined) {
			var sinif = craft_bilgisi[? "siniflama"];
	        if (malzemeler == 1) {
				if sinif != undefined && sinif != -1 {
					for (var g = 0; g < ds_list_size(sinif); g++) {
						if variable_global_exists("s_" + string(sinif[| g])) {
							var key_5 = variable_global_get("s_" + string(sinif[| g]));
							var key_tumu = variable_global_get("s_" + "1");
							ds_list_add(key_5, key);
							if ds_list_find_index(key_tumu, key) == -1 {
								ds_list_add(key_tumu, key);
							}
						}
					}
				}
	            ds_list_add(global.craft_index, key);  
	        } 
	    }	
	}
}