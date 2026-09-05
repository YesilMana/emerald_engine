function hayvan_hasar_efekt(){
	if global.silah_hasar_turu == "kesici" {
		hayvan_kesici_efekt();
	}
	if global.silah_hasar_turu == "ezici" {
		hayvan_ezici_efekt();
	}
	flash = 0.7;
}

function hayvan_ezici_efekt() {
	repeat(12) {
		var x_ = x + random_range(-10, 10);
		var y_ = y + random_range(-10, 10);
		instance_create_layer(x_, y_ - 10, "esyalar", obj_hayvan_hasar_ezici);
	}	
}

function hayvan_kesici_efekt() {
	instance_create_layer(x, y - 10, "esyalar", obj_hayvan_hasar_kesici);
		
	repeat(4) {
		var x_ = x + random_range(-10, 10);
		var y_ = y + random_range(-10, 10);
		instance_create_layer(x_, y_ - 10, "esyalar", obj_hayvan_hasar_ezici);
	}	
}

function hayvan_hasar_parlama() {
	// Eğer flash değeri 0'dan büyükse, üzerine beyaz bir katman çizelim
	if (flash > 0) {
		var renk = c_white;
	    // 1. Büyüyü aç: GPU ayarlarından "Sis" efektini açıyoruz
	    // Bu, çizilen her şeyi düz renge boyar.
	    gpu_set_fog(true, renk, 0, 0);

	    // 2. Yengeci tekrar çiziyoruz
	    // Ama bu sefer opaklığını (alpha) "flash" değişkenine bağlıyoruz
	    // Böylece flash azaldıkça beyazlık da silikleşecek.
	    draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, c_white, flash);

	    // 3. Büyüyü kapat: Yoksa oyundaki HER ŞEY beyaz olur :)
	    gpu_set_fog(false, renk, 0, 0);
	}
}