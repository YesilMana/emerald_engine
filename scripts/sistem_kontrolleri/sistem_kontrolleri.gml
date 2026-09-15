function sistem_kontrolleri(){
	if keyboard_check(vk_backspace) {
		if keyboard_check_pressed(ord("G")) {
			global.chatterbox_verileri.kaydet(1);	
		}
		if keyboard_check_pressed(ord("H")) {
			global.chatterbox_verileri.yukle(1);	
		}
		if (keyboard_check_pressed(ord("V"))) {
		    var metin = "";
		    var anahtarlar = struct_get_names(global.secenek_etiketleri);
		    var uzunluk = array_length(anahtarlar);
    
		    for (var i = 0; i < uzunluk; i++) {
		        var mevcut_anahtar = anahtarlar[i];
		        var mevcut_deger = global.secenek_etiketleri[$ mevcut_anahtar];
        
		        metin += "Seçenek " + mevcut_anahtar + ": " + string(mevcut_deger) + "\n";
		    }
    
		    show_debug_message(metin);
		}
	}
	
	global.timer += 1;
	
}