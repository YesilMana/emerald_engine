function tum_oyun_calisacak(){
	//Oyun boyunca her karede çalışacak olan kodlar. (Fazla kod yazmak optimizasyon problemlerine neden olabilir)
	tuslar_gorunmezlik();
	yurume();
	if !duraklatmak tus_ini();
	konusma_tane_yazma();
	carpistirma_tumu();
	enerji_dolma();
	takipci_tumu();
	gizli_komutlar();
	devam_etme_sonrasi();
	yakinlik_belirleme();
	surekli_yenilenme();
	en_yakin_obje_belirleme();
	muzik_calma();
	oyun_hemen_basla();
	
	if !oyun_disi_odalar {
		esya_yapim_animasyon();
		ates_yakim_animasyon();
		genel_bekleme_animasyon();
		surekli_calisacak_stat_degisim();
		saat_ilerleme();
		su_surekli_azalma();
		yorgunluk_surekli_azalma();
		kalori_surekli_azalma();
		can_surekli_degisim();
		efekt_sayac();
		ates_sure_hesaplama();
		kilic_surekli_calisma();
		surekli_hikaye();
		geri_sayim_step();
	}
	sinirlama();//Mutlaka sonda olmalı
}