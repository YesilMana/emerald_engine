function envanter_kontrol_surekli(esya_isim, sayi = 1){
	if is_string(esya_isim) {
		var esya_id = kodunu_al(esya_isim);
	}
	
	else {
		var esya_id = esya_isim;
	}
	var envanterdeki = global.envanter[esya_id];
	if !is_undefined(envanterdeki) {
		if global.envanter[esya_id] >= sayi {
			return true;	
		}
	}
	
	else {
		return false;	
	}
}