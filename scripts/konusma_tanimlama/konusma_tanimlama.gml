//function konusma_tanimlama() {
	// JSON dosyasını yükle
	ini_dosya_okuma();

	// Tüm dosyayı tek seferde buffer ile oku (string concat döngüsü yerine)
	var buff = buffer_load(global.dil + ".json");
	var json_string = buffer_read(buff, buffer_string);
	buffer_delete(buff);

	// Olası UTF-8 BOM temizliği (json_parse hata verirse bu satırları aç)
	if (string_byte_at(json_string, 1) == 239) {
	    json_string = string_delete(json_string, 1, 3);
	}

	// JSON'u parse et
	var json_data = json_parse(json_string);

	// Genel yazıları yükle
	global.genel_yazilar = json_data.genel;

	// Konuşmaları yükle
	var konusmalar_data = json_data.konusmalar;
	var konusma_keys = variable_struct_get_names(konusmalar_data);
	scribble_anim_shake(5, 0.4);
	var col_erinus = hex_to_color("944850"); 
	var col_vince = make_color_rgb(180, 40, 40);
	var col_altin = make_color_rgb(255, 215, 0);
	var col_baslik = hex_to_color("cbb880");
	var col_alt_baslik = hex_to_color("f4edc9");
	// 2. Bu renkleri Scribble'a öğret
	scribble_color_set("c_erinus", col_erinus);
	scribble_color_set("c_vince", col_vince);
	scribble_color_set("c_altin", col_altin);
	scribble_color_set("col_baslik", col_baslik);
	scribble_color_set("col_alt_baslik", col_alt_baslik);
	// Array'leri başlat
	global.konusmalar = [];
	global.konusan_spriteler = [];
	global.diyenler = [];
	global.konusma_secenek = [];
	global.konusma_tetikleyici = [];
	// Her konuşmayı işle
	for (var i = 0; i < array_length(konusma_keys); i++) {
	    var konusma_id = real(konusma_keys[i]);
	    var konusma = konusmalar_data[$ konusma_keys[i]];
    
	    // Yazıları yükle
	    global.konusmalar[konusma_id] = konusma.yazilar;
	
		// --- DÜZELTME BAŞLANGICI ---
	    if (variable_struct_exists(konusma, "ifadeler")) {
	        global.konusan_spriteler[konusma_id] = konusma.ifadeler;
	    } else {
	        var yazi_uzunlugu = array_length(konusma.yazilar);
	        global.konusan_spriteler[konusma_id] = array_create(yazi_uzunlugu, "");
	    }
	    // --- DÜZELTME BİTİŞİ ---
    
	    // Diyenleri yükle
	    global.diyenler[konusma_id] = konusma.diyenler;
    
	    // Seçenekleri yükle
	    global.konusma_secenek[konusma_id] = [];
	    var toplam_yazi = array_length(konusma.yazilar);
    
	    for (var k = 0; k < toplam_yazi; k++) {
	        global.konusma_secenek[konusma_id][k] = [];
	        global.konusma_secenek[konusma_id][k][1] = "";
	        global.konusma_secenek[konusma_id][k][2] = "";
	    }
    
		if (variable_struct_exists(konusma, "secenekler")) {
			var secenekler = konusma.secenekler;
		    var secenek_keys = variable_struct_get_names(secenekler);
    
		    for (var j = 0; j < array_length(secenek_keys); j++) {
		        var yazi_index = real(secenek_keys[j]);
		        var secenek_array = secenekler[$ secenek_keys[j]];
		        var secenek_sayisi = array_length(secenek_array);
				var kontrol_sayacim = 2;
		        global.konusma_secenek[konusma_id][yazi_index][1] = secenek_array[0];
		        global.konusma_secenek[konusma_id][yazi_index][2] = secenek_array[1];
				repeat(25) {
				    if (secenek_sayisi > kontrol_sayacim) {
					    global.konusma_secenek[konusma_id][yazi_index][kontrol_sayacim + 1] = secenek_array[kontrol_sayacim];
						kontrol_sayacim += 1;
					}
				}
		
		    }
		}
	    global.konusma_tetikleyici[konusma_id] = 0;
	}
	konusma_sistemi_yukle();
//}