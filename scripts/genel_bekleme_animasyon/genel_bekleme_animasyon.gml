function genel_bekleme_animasyon(){
	var yapim_suresi = global.genel_bekleme_suresi_temel * room_speed;
	
	if global.genel_tetiklenme {
		global.genel_sayac = yapim_suresi;
		global.genel_yakim_basladi = true;
		global.genel_tetiklenme = false;
		if global.genel_bekleme_suresi == 0 global.genel_bekleme_suresi = global.genel_bekleme_suresi_temel;
	}
	
	if global.genel_yakim_basladi && global.genel_bekleme_suresi > 0 {
		global.genel_bekleme_suresi -= 1;
	}
	
	if global.genel_bekleme_suresi == 0 && global.genel_yakim_basladi {
		global.genel_yakim_basladi = false;
		global.kullanim_tek = "";
		global.genel_bekleme_suresi = 0;
		yenile();
	}
}


function bekleme_animasyonu_calistir(tetiklenme_sirasinda_yazacak = "", tetiklenme_suresi = 0, esya_kullanim_degilse_true_yaz = false) {
	global.genel_tetiklenme = true;
	global.genel_bekleme_suresi = tetiklenme_suresi * room_speed;
	if is_real(tetiklenme_sirasinda_yazacak) global.kullanim_tek = global.genel_yazilar[tetiklenme_sirasinda_yazacak];
	else global.kullanim_tek = tetiklenme_sirasinda_yazacak;
	if esya_kullanim_degilse_true_yaz global.kullanilan_esya = 1;
}