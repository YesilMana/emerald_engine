function gorev_sil(numara) {
	// JSON Güvenlik Kontrolü: Görev ID'si JSON içinde var mı?
	var gorev_veri = global.gorev_json[? string(numara)];
	if is_undefined(gorev_veri) exit;
	
	var stringim = gorev_veri[? "gorev"];
	if is_undefined(stringim) || stringim == "" exit;

	var bulma = ds_list_find_index(global.gorevler, stringim);
	if bulma != -1 {
		ds_list_delete(global.gorevler, bulma);	
		ds_list_delete(global.gorev_aciklamalari, bulma);
		global.aktif_gorevler[? string(numara)] = 0;
		
		// Bildirim sayısının sıfırın altına düşmesini engelle
		global.guncel_bildirim = max(0, global.guncel_bildirim - 1);
		global.bakilan_bildirim = max(0, global.bakilan_bildirim - 1);
	}
}

function gorev_ekle(numara, aciklama_stringi = noone) {
	// JSON Güvenlik Kontrolü: Görev ID'si JSON içinde var mı?
	var gorev_veri = global.gorev_json[? string(numara)];
	if is_undefined(gorev_veri) exit;

	var stringim = gorev_veri[? "gorev"];
	var aciklama = gorev_veri[? "aciklama"];
	if aciklama_stringi != noone aciklama = aciklama_stringi;
	
	if is_undefined(stringim) || stringim == "" exit;
	
	var bulma = ds_list_find_index(global.gorevler, stringim);
	if bulma != -1 exit;
	
	ds_list_add(global.gorevler, stringim);
	if !is_undefined(aciklama) ds_list_add(global.gorev_aciklamalari, aciklama);
	else ds_list_add(global.gorev_aciklamalari, "");	
	
	// ds_map_add yerine "?" (accessor) kullanıldı.
	// Böylece silinen bir görev tekrar eklendiğinde değeri 0'dan başarıyla 1'e güncellenir.
	global.aktif_gorevler[? string(numara)] = 1;
	
	global.guncel_bildirim += 1;
	audio_play_sound(global.sfx_bildirim, 1, false);
	audio_sound_gain(global.sfx_bildirim, global.muzik_seviyesi / 7);
	global.bildirim_simgesi_boyut = 5;
}