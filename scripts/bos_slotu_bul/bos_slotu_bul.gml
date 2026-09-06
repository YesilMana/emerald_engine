//Envanterde boş slot olup olmadığını kontrol eder. 
//Eğer boş slot bulursa numarasını döndürür
//Boş slot yoksa 999 döndürür

function bos_slotu_bul(liste = undefined){
	var list = global.envanter_list;
	if liste != undefined list = liste;
	for (var i = 1; i < ds_list_size(list); i++) {
		var slot = ds_list_find_value(list, i);
		var icerik = slot[? "esya"];
		var numara = 10000;
		//if esya_id != undefined numara = esya_id;
		var aktif_mi = slot[? "durum"];
		if (icerik == -1 || icerik == "esya_" + string(numara)) && aktif_mi == 1 {
			return i;	
		}
	}
	return 999;
}