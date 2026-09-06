function hayvan_create(isim){
	obje_ismi = isim;
	hayvan_bilgileri = global.hayvanlar_tumu[? obje_ismi];
	hareket_sureci = hayvan_hareket.idle;
	carpisildi = false;
	kontrol_suresi = room_speed * 12;
	
	if (!variable_instance_exists(id, "ilk_x") && !variable_instance_exists(id, "ilk_y")) {
		ilk_x = x;
		ilk_y = y;
	}
	script_faz = asset_get_index("scr_" + obje_ismi + "_faz");
	script_create = asset_get_index("scr_" + obje_ismi + "_create");
		
	varinca_bekleme_suresi = irandom_range(variable_global_get(obje_ismi + "_varinca_bekleme_suresi_1") * room_speed, variable_global_get(obje_ismi + "_varinca_bekleme_suresi_2") * room_speed);
	var hiz_tolerans = 0.3;
	hiz_yurume = random_range(variable_global_get(obje_ismi + "_hiz_yurume") - hiz_tolerans, variable_global_get(obje_ismi + "_hiz_yurume") + hiz_tolerans);
	hiz_kosma = variable_global_get(obje_ismi + "_hiz_kosma");
	devriye_yaricapi = variable_global_get(obje_ismi + "_devriye_yaricapi");
	devriye_noktasi_belirle();
	anlik_hiz = hiz_yurume;
	en_uzak_menzil = 0;
	oyuncu_uzaklik = 9999;
	kullanilan_saldiri = 1;
	alacagi_hasar = 0;
	ilk_hareket_noktasi_uzaklik = 0;
	maksimum_kovalama = variable_global_get(obje_ismi + "_takip_mesafesi");
	can = variable_global_get(obje_ismi + "_can");
	temel_can = can;
	kacma_cani = variable_global_get(obje_ismi + "_kacma_cani") / 100;
	en_uzak_x = 0;
	en_uzak_y = 0;
	cizim_x = x;
	cizim_y = y - 15;
	kalkan = variable_global_get(obje_ismi + "_kalkan");
	temel_kalkan = kalkan;
	hayvan_rastgele_sayac = irandom(120);
	hayvan_en_uzak_menzil_ayarlama();
	farkli_noktalara_hareket = irandom_range(300, 1200);
	farkli_kontrol = false;
	rast_x = 0;
	rast_y = 0;
	scale_temel = image_xscale;
	xscale = scale_temel;
	
	player_id = irandom(999999);
	flash = 0;  // 0 ise parlama yok, 1 ise tam beyaz
	flash_hizi = 0.04; // Parlamanın sönme hızı (Ne kadar yüksekse o kadar çabuk söner)
	hasar_aldi = false;
	can_bari_olusma_yukseklik = 20;
	
	
	yayici = audio_emitter_create();
	var referans_mesafe = 10;
	var maksimum_mesafe = 100;
	var dusus_carpani = 1;

	audio_emitter_falloff(yayici, referans_mesafe, maksimum_mesafe, dusus_carpani);
	hareket_ses = noone;
	kacis_ses = noone;
	kovalama_ses = noone;
	
	
	if script_create != -1 {
		script_execute(script_create);
	}
	
}

function hayvan_step() {
	if (variable_instance_exists(id, "kayit_x") && variable_instance_exists(id, "kayit_y")) {
		ilk_x = kayit_x;
		ilk_y = kayit_y;
	}
	derinlik(id);
	if script_faz != -1 {
		script_execute(script_faz);
	}
	else {
		hayvan_faz_degisimi();
	}
	odayi_asmama(id, anlik_hiz);
	hayvan_rastgele_sayac += 1;
}

function hayvan_draw() {
	var golge = asset_get_index("spr_" + obje_ismi + "_" + "golge");
	if image_alpha != 0 draw_sprite(golge, 0, x, y);
	if hareket_sureci == hayvan_hareket.hasar_yeme {
		//hayvan_hasar_bildirme();	
	}
	else {
		cizim_x = x;
		cizim_y = y - 15;	
	}
	
	if false { //obje_ismi == "obj_boss_cicek_1" 
		
	}
	else {
		hayvan_can_gosterme();
	}
	draw_self();
	hayvan_hasar_parlama();
}