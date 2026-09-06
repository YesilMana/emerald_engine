function carpistirma_tumu(){
	if yurume_tusuna_basilmiyor == false || global.timer % 30 == true {
		carpistirma(obj_cikolata);
	}
	
	if takipciler_carpabilecek {
		
	}
	
	if global.timer % 240 == 0 {
		for (var i = 0; i < ds_list_size(global.hayvanlar_bellek); i++) {
			var obje_index = asset_get_index(global.hayvanlar_bellek[| i])
			if (obje_index > -1) {
	            carpistirma(obje_index);
	        }
		}
	}
	
	if !odayi_asacak_odalar odayi_asmama(global.cikolata);
	for (var i = 0; i < ds_list_size(global.hayvanlar_bellek); i++) {
		var obje_index = asset_get_index(global.hayvanlar_bellek[| i])
		if (obje_index > -1) {
            odayi_asmama(obje_index, 2);
        }
	}
}