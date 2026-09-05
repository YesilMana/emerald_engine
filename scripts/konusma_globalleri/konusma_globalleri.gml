function konusma_globalleri(){
	var veri = global.oyun_ici_veriler;
	global.konusma_vince_belcinar_1 = veri[? "konusma_vince_belcinar_1"];
	global.bolum_1 = veri[? "bolum_1"];
	global.bolum_2 = veri[? "bolum_2"];
	global.bolum_3 = veri[? "bolum_3"];
	global.bolum_4 = veri[? "bolum_4"];
	global.zorluk = veri[? "zorluk"];
	global.akonit_sevgi = veri[? "akonit_sevgi"];
	global.petunya_sevgi = veri[? "petunya_sevgi"];
	global.cikolata_spritesi = veri[? "cikolata_spritesi"];
	global.hikaye_kontrolleri_map = veri[? "hikaye_kontrolleri_map"];
	global.konusma_rengi = c_maroon;
	global.karakter_gitme_map = veri[? "karakter_gitme_map"];
	global.karakter_gitme_devam_edecek_map = veri[? "karakter_gitme_devam_edecek_map"];
	global.hikaye_aktiflik_map = veri[? "hikaye_aktiflik_map"];
	global.kayit_turuncusu = veri[? "kayit_turuncusu"];
	for (var i = 1; i <= ds_map_size(global.karakter_gitme_map); i++) {
		variable_global_set("karakter_gitme_" + string(i), global.karakter_gitme_map[? string(i)]);
	}
	for (var i = 1; i <= ds_map_size(global.hikaye_kontrolleri_map); i++) {
		variable_global_set("hikaye_kontrolleri_" + string(i), global.hikaye_kontrolleri_map[? string(i)]);
	}
	for (var i = 1; i <= ds_map_size(global.karakter_gitme_devam_edecek_map); i++) {
		variable_global_set("karakter_gitme_devam_edecek_" + string(i), global.karakter_gitme_devam_edecek_map[? string(i)]);
	}
	global.secili_karakter = variable_global_get(global.cikolata_spritesi);
	global.karakter_yurutuluyor = false;
}