function gorev_kayittan_yukleme(){
	global.guncel_bildirim = 0;
	global.bakilan_bildirim = 0;
	global.gorevler = ds_list_create();
	global.gorev_aciklamalari = ds_list_create();
	var map_uzunluk = ds_map_size(global.gorev_json);
	if map_uzunluk >= 1 {
		for (var i = 1; i <= map_uzunluk; i++) {
			var gorev = global.aktif_gorevler[? string(i)];
			if !is_undefined(gorev) && gorev == 1 {
				gorev_ekle(i);	
			}
		}
	}
}

function gorev_kaydet() {
	
}