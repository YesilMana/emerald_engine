function ini_dosya_okuma(){
	ini_open("settings.ini");
	var an = (os_type == os_android || os_type == os_ios);
	var hikaye_aktif = 0;


	//Senin kullanacağın alan =======================================================
	//an = 1; //Oyunu mobil modda denemek istersen an = 1; yap
	global.sifirlama_sayisi = 36; //Eğer oyunu sıfırlamak istersen 1 arttır
	
	//Senin kullanacağın alan =======================================================
	
	
	
	
	
	
	
	
	
		
	
	
	
	
	
	
	
	
	
		
	
	
	
	
	
	
	
	
	
	
	
	
	//Bunlara dokunma!
	var _secilen_dil = dil_kontrolu();
	hikaye_aktif = ini_read_real("ayarlar", "hikaye_tamamen_aktif_mi", 0);
	global.android = ini_read_real("ayarlar", "android", an);
	global.tablet_modu = ini_read_real("ayarlar", "tablet_modu", 0);
	global.ses_seviyesi = ini_read_real("ayarlar", "ses_seviyesi", 0.95);
	global.muzik_seviyesi = ini_read_real("ayarlar", "muzik_seviyesi", 0.6);
	global.sifirla = ini_read_real("ayarlar", "sifirla_" + string(global.sifirlama_sayisi), 1);
	global.demo = ini_read_real("ayarlar", "demo", an);
	global.dil = ini_read_string("ayarlar", "dil", _secilen_dil);
	global.devam_et = ini_read_real("ayarlar", "devam", 0);
	
	global.toplam_ini_okuma = ini_read_real("ayarlar", "toplam_ini_okuma", 200);
	
	for (var i = 1; i < global.toplam_ini_okuma; i++) {
		variable_global_set("ini_" + string(i), ini_read_real("ayarlar", "ini_" + string(i), 0));	
	}
	
	for (var i = 1; i < 100; i++) {
		if hikaye_aktif == 0 {
			variable_global_set("hikaye_aktiflik_" + string(i), ini_read_real("ayarlar", "hikaye_aktiflik_" + string(i), hikaye_aktif));	
		}
		else {
			variable_global_set("hikaye_aktiflik_" + string(i), 1);
		}
	}
	
	ini_close(); 
	
	ini_open("silinmeyecek.ini");
	global.tam_surum = ini_read_real("satin_alimlar", "tam_surum", 0);
	if os_type != os_android global.tam_surum = true;
	global.demo_bitti = ini_read_real("oyuncu", "demo_bitti", 0);
	global.almaktan_vazgecti = ini_read_real("oyuncu", "almaktan_vazgecti", 0);
	global.ilk_defa_tam_surum_oluyor = ini_read_real("oyuncu", "ilk_defa_tam_surum_oluyor", 0);
	ini_close();
	
	global.sfx_ates_parlama = sfx_ates_parlama;
	global.sfx_ates_yanma = sfx_ates_yanma;
	global.sfx_ates_yanma_2 = sfx_ates_yanma;
	global.sfx_craft_6 = sfx_craft_6;
	global.sfx_craft_5 = sfx_craft_5;
	global.sfx_craft_1 = sfx_craft_1
	global.sfx_craft_35 = sfx_craft_35;
	global.sfx_ates_yakim_baslama = sfx_ates_yakim_baslama;
	global.sfx_sahil = sfx_sahil;
	global.sfx_marti = sfx_marti;
	global.sfx_kumru = sfx_kumru;
	global.sfx_ye = sfx_ye;
	global.sfx_su_ic = sfx_su_ic;
	global.sfx_craft_kibrit = sfx_craft_kibrit;
	global.sfx_cali_etkilesim = sfx_cali_etkilesim;
	global.sfx_bildirim = sfx_bildirim;
	global.sfx_konusma_saskinlik = sfx_konusma_saskinlik;
	global.sfx_yaprak_yurume = sfx_yaprak_yurume;
	global.sfx_tokat = sfx_tokat;
	global.sfx_kapi_tiklama = sfx_kapi_tiklama;
	global.sfx_kurek = sfx_kurek;
	global.sfx_olum = sfx_olum;
	global.sfx_hasar = sfx_hasar;
	global.sfx_metal_vurma = sfx_metal_vurma;
	global.sfx_vince_catisma = sfx_vince_catisma;
	global.mus_gun_shoot = mus_gun_shoot;
	
	global.sfx_yagmur_1 = sfx_yagmur_1;
	global.sfx_thunder = sfx_thunder;
	global.sfx_yagmur_iceri = sfx_yagmur_iceri;
	global.sfx_thunder_iceri = sfx_thunder_iceri;
	
	global.sfx_orman_1 = sfx_orman_1;
	global.sfx_orman_2 = sfx_orman_2;
	global.sfx_orman_3 = sfx_orman_3;
	global.sfx_orman_4 = sfx_orman_4;
	global.sfx_orman_5 = sfx_orman_5;
	global.sfx_orman_6 = sfx_orman_6;
	global.sfx_orman_7 = sfx_orman_7;
	
	global.sfx_hasar_verme_1 = sfx_hasar_verme_1;
	global.sfx_hasar_verme_2 = sfx_hasar_verme_1;
	
	global.sfx_savurma_1 = sfx_savurma_1;
	global.sfx_savurma_2 = sfx_savurma_2;	
	global.sfx_yerden_alma_1 = sfx_yerden_alma_1;

	global.sfx_kalp_atisi = sfx_kalp_atisi;
	global.mus_menu = mus_menu;
	
	global.sfx_obj_hayvan_fare_hareket = sfx_obj_hayvan_fare_hareket;
	global.sfx_obj_hayvan_fare_olum = sfx_obj_hayvan_fare_olum;
	global.sfx_obj_hayvan_fare_saldiri = sfx_obj_hayvan_fare_saldiri;
	global.sfx_obj_hayvan_fare_kacis = sfx_obj_hayvan_fare_kacis;
	global.sfx_obj_hayvan_fare_hasar_yeme = sfx_obj_hayvan_fare_hasar_yeme;
	
	global.sfx_obj_hayvan_kopek_hareket = sfx_obj_hayvan_kopek_hareket;
	global.sfx_obj_hayvan_kopek_olum = sfx_obj_hayvan_kopek_olum;
	global.sfx_obj_hayvan_kopek_saldiri = sfx_obj_hayvan_kopek_saldiri;
	global.sfx_obj_hayvan_kopek_kacis = sfx_obj_hayvan_kopek_kacis;
	global.sfx_obj_hayvan_kopek_hasar_yeme = sfx_obj_hayvan_kopek_hasar_yeme;
	
	global.sfx_obj_hayvan_kucuk_yengec_hareket = sfx_obj_hayvan_kucuk_yengec_hareket;
	global.sfx_obj_hayvan_kucuk_yengec_olum =sfx_obj_hayvan_kucuk_yengec_olum;
	global.sfx_obj_hayvan_kucuk_yengec_saldiri = sfx_obj_hayvan_kucuk_yengec_saldiri;
	global.sfx_obj_hayvan_kucuk_yengec_kacis = sfx_obj_hayvan_kucuk_yengec_kacis;
	global.sfx_obj_hayvan_kucuk_yengec_hasar_yeme = sfx_obj_hayvan_kucuk_yengec_kacis;
}
