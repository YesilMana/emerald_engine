function secenek_getir(){
	if !hk("hk_1") {
		var secenek_sayisi = ChatterboxGetOptionCount(global.chatterbox_dosyasi);
		if secenek_sayisi == 0 exit;
		for (var i = 0; i < secenek_sayisi; i++) {
			var secenek_tusu = instance_create_depth(0, 0, 0, obj_secenekler);
			secenek_tusu.secenek_metni = ChatterboxGetOption(global.chatterbox_dosyasi, i);
			secenek_tusu.secenek_numarasi = i;
			var degerim = global.secenek_etiketleri[$ string(i)];
			secenek_tusu.deger = degerim;
		}
		hk_duzenle("hk_1", 1);
	}
}