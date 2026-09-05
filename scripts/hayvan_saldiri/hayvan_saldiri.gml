function hayvan_saldiri(){
	//show_message("spr_" + obje_ismi + "_saldiri_" + string(kullanilan_saldiri))
	if zaman_dur exit;
	sprite_index = asset_get_index("spr_" + obje_ismi + "_saldiri_" + string(kullanilan_saldiri));
	if image_index >= (image_number - 1) && instance_exists(global.cikolata) && oyuncu_uzaklik < en_uzak_menzil {
		var geri_tepme = point_direction(x, y, global.cikolata.x, global.cikolata.y);
		var hasar_boyutu = variable_global_get(obje_ismi + "_hasar_" + string(kullanilan_saldiri) + "_miktar");
		
		var dx = lengthdir_x(hasar_boyutu, geri_tepme);
        var dy = lengthdir_y(hasar_boyutu, geri_tepme);
		
		hareket_sureci = hayvan_hareket.idle;
		
		global.cikolata.x += dx;
		global.cikolata.y += dy;
		ekran_titret(10, 20);
		global.stat_minik_opaklik[1] = 4;
		hasar_ses();
		if global.zorluk == 2 stat_degisim("can", 0, hasar_boyutu);
	}
	
	if image_index < (image_number - 1) && oyuncu_uzaklik > en_uzak_menzil {
		hareket_sureci = hayvan_hareket.idle;	
	}
	
}

function hasar_ses(ses_turu = noone) {
	if ses_turu == noone audio_play_sound(global.sfx_hasar, 1, false, global.ses_seviyesi);
	else audio_play_sound(ses_turu, 1, false, global.ses_seviyesi);
}

function olum_ses() {
	if !audio_is_playing(global.sfx_olum) audio_play_sound(global.sfx_olum, 1, false, global.ses_seviyesi);
}	
