function craft_aktifles(nesne_id){
	global.craft_edilme_kontrol[? "esya_" + string(nesne_id)] = 1;
	craft_menu_yenile();
}

//Craft menüsünün silinip baştan yazılmasını sağlar

function craft_menusu_yenile() {
	 ds_list_clear(global.craft_index);
	for (var i = 0; i < global.envanter_son_oge; i++) {
	    var key = "esya_" + string(i);
	    var malzemeler = global.craft_edilme_kontrol[? key];
		var craft_bilgisi = global.craft_bilgi[? key];
	    if (craft_bilgisi != undefined) {
	        if (malzemeler == 1) {
	            ds_list_add(global.craft_index, key);  
	        } 
	    }
	}	
}
