function hayvan_ganimet_dusme(){
	var ganimet_listesi = variable_global_get(obje_ismi + "_ganimet_listesi");
	
	for (var i = 0; i < ds_list_size(ganimet_listesi); i++) {
		var liste = ganimet_listesi[| i];
		var esya_isim = liste[? "esya"];
		var sans = liste[? "sans"];
		var miktar = liste[? "miktar"];
		var esya = asset_get_index("obj_bulunan_" + esya_isim);
		
		var sansli_sayi = irandom(100);
		if sansli_sayi < sans {
			var tolerans = random_range(-5, 5);
			var olusacak_obje = instance_create_layer(x + tolerans, y + tolerans, "esyalar", esya);
			olusacak_obje.mevcut_adet = miktar;
			olusacak_obje.dinamik = true;
		}
	}
}