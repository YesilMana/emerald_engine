function envanterden_azalt(nesne_id, azaltilacak){
	envanter_analiz_et();
	if global.envanter[nesne_id] > 0 {
		var envanter_koordinat = hangi_slotta(nesne_id);
		var liste = global.envanter_list[| envanter_koordinat];
		var yeni_adet = liste[? "adet"] - azaltilacak;
		liste[? "adet"] = yeni_adet;	
		if yeni_adet <= 0 {
			liste[? "esya"] = -1;	
		}
		envanter_analiz_et();
	}
}

function envantere_ekle(nesne_id, adet, saglamlikim = 100) {
	envanter_analiz_et();
	var envanter_koordinat = bos_slotu_bul();
	if is_undefined(global.siniflandirma_silahlar[? "esya_" + string(nesne_id)]) && is_undefined(global.siniflandirma_esyalar[? "esya_" + string(nesne_id)]) {
		envanter_koordinat = hangi_slotta(nesne_id);
	}
	if envanter_koordinat != 999 {
		var liste = global.envanter_list[| envanter_koordinat];
		var yeni_adet = liste[? "adet"] + adet;
		liste[? "adet"] = yeni_adet;	
		liste[? "esya"] = "esya_" + string(nesne_id);
		liste[? "saglamlik"] = saglamlikim;
		global.envanter[nesne_id] += adet;
		envanter_analiz_et();
		var isim = global.item_names[? "esya_" + string(nesne_id)];
		var eklenecek_isim = global.genel_yazilar[327]
		bilgi_ver(eklenecek_isim);
		bilgi_ver(isim);
	}
	
	else {
		esya_yerde_olustur(nesne_id, adet);	
		var isim = global.item_names[? "esya_" + string(nesne_id)];
		var eklenecek_isim = global.genel_yazilar[328];
		bilgi_ver(eklenecek_isim);
		bilgi_ver(isim);
	}
}	

function envanterdeki_adet(nesne_id) {
	envanter_analiz_et();
	if global.envanter[nesne_id] > 0 {
		var envanter_koordinat = hangi_slotta(nesne_id);
		var liste = global.envanter_list[| envanter_koordinat];
		return liste[? "adet"];
	}
	else return 0;
}