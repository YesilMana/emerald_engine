function genel_globaller() {
	
}

function esya_enum() {
	enum esya {
	    avare = 0,
	    basit_metal_tencere = 1,
	    hurda_metal = 2,
	    tahta_parcasi = 3,
	    civi = 4,
	    bicak = 5,
	    cekic = 6,
	    keskin_kenarli_metal = 7,
	    sert_metal_kulcesi = 8,
	    metal_kase = 9,
	    metal_plaka = 10,
	    kirik_mercek = 11,
	    dograma_tahtasi = 12,
	    kibrit = 13,
	    kibrit_kutusu = 14,
	    havuc = 15,
	    bos_su_sisesi = 16,
	    dolu_su_sisesi = 17,
	    domates = 18,
	    biber = 19,
	    sogan = 20,
	    yumurta = 21,
	    dilimlenmis_domates = 22,
	    dilimlenmis_biber = 23,
	    dilimlenmis_sogan = 24,
	    tahta_kase = 25,
	    menemen = 26,
	    sogansiz_menemen = 27,
	    sivi_yag = 28,
	    motor_yagi = 29,
	    salca = 30,
	    fasulye = 31,
	    cig_kopek_eti = 32,
	    kuru_fasulye_yemegi = 33,
	    super_marionun_orijinal_tarifi = 34,
	    caydanlik = 35,
	    yesil_cay = 36,
	    tahta_bardak = 37,
	    hazirlanmis_yesil_cay = 38,
	    kahve = 39,
	    hazirlanmis_kahve = 40,
	    cig_uskumru = 41,
	    somun_ekmek = 42,
	    un = 43,
	    marul = 44,
	    ekmek_arasi_uskumru = 45,
	    pismis_uskumru = 46,
	    yogurt = 47,
	    sut = 48,
	    yogurtlu_manti = 49,
	    inegol_kofte = 50,
	    tahta_sopa = 51,
	    cig_yengec_bacagi = 52,
	    ince_dal = 53,
	    pismis_yengec_bacagi = 54,
	    tahta_oyma_sanati = 55,
	    bogurtlen = 56,
	    oyuncak_kurbaga = 57,
	    kasetcalar_yakgitsin_mp3 = 58,
	    kasetcalar_son_ruya_senaryo = 59,
	    pismis_kopek_eti = 60,
	    guvenli_olmayan_su = 61,
	    kaynamis_su = 62,
		bogurtlenli_turta = 63,
		vince_turtasi = 64,
		ayi_kapani = 65,
		papatya = 66,
		papatya_cayi = 67,
		kapali_ayi_kapani = 68,
		damak_soleni_dergi_sayfasi_1 = 69,
		agri_kesici = 70,
		kurek_saci = 71,
		kurek = 72,
		cikolata = 73,
		fare_eti = 74,
		yilan_yastigi = 75,
		pismis_yilan_yastigi = 76,
		yilan_yastigi_merhemi = 77,
		karahindiba = 78,
		karahindiba_cayi = 79,
		nacak = 80,
		nacak_metali = 81,
		curumus_kutlama_turtasi = 82,
		tarcinli_karamelli_turta = 83,
		limonlu_dondurma = 84,
		lembas_ekmegi = 85,
		altin_elma = 86,
		sukunanin_parmagi = 87,
		wonka_cikolatasi = 88,
		pops_lolipop = 89,
		nuka_cola = 90,
		altin_bilet = 91,
		tas_ve_sopa = 92,
		pirinc = 93,
		cig_tavuk = 94,
		pismis_tavuk = 95,
		pirinc_pilavi = 96,
		tavuklu_pilav = 97,
		benzin_bidonu = 98,
		su_bidonu = 99,
		yangin_sondurme_tupu = 100,
		cop = 101,
		dikis_ipi = 102,
		dikis_ignesi = 103
	}	
}


function ana_karakter_sprite_tanimlama() {
	global.cikolata_animasyon = {
	    Arka: spr_kaan_maskeli_arka,
	    On:   spr_kaan_maskeli_on,
	    Yan:  spr_kaan_maskeli_yan
	};
	global.kaan_animasyon_maskeli = {
	    Arka: spr_kaan_maskeli_arka,
	    On:   spr_kaan_maskeli_on,
	    Yan:  spr_kaan_maskeli_yan
	};
	global.kaan_animasyon_maskesiz = {
	    Arka: spr_kaan_maskesiz_arka,
	    On:   spr_kaan_maskesiz_on,
	    Yan:  spr_kaan_maskesiz_yan
	};
	global.buyuk_lale_animasyon = {
	    Arka: spr_buyuk_lale_arka,
	    On:   spr_buyuk_lale_on,
	    Yan:  spr_buyuk_lale_yan
	};
	global.sati_animasyon = {
	    Arka: spr_sati_arka_yurume,
	    On:   spr_sati_on_yurume,
	    Yan:  spr_sati_yan_yurume,
		Uzanma: spr_sati_uzanma
	};
	global.semih_animasyon = {
	    Arka: spr_semih_arka_yurume,
	    On:   spr_semih_on_yurume,
	    Yan:  spr_semih_yan_yurume
	};
	global.kadir_animasyon = {
	    Arka: spr_kadir_arka_yurume,
	    On:   spr_kadir_on_yurume,
	    Yan:  spr_kadir_yan_yurume
	};
	global.kadir_hastane_animasyon = {
	    Arka: spr_kadir_arka_yurume_hastane,
	    On:   spr_kadir_on_yurume_hastane,
	    Yan:  spr_kadir_yan_yurume_hastane
	};
	global.vince_animasyon = {
		 Arka: spr_vince_arka_yurume,
		 On: spr_vince_on_yurume,	
		 Yan: spr_vince_yan_yurume
	}
	global.vince_yangin_animasyon = {
		 Arka: spr_vince_arka_yurume_kanli,
		 On: spr_vince_on_yurume_kanli,	
		 Yan: spr_vince_yan_yurume_kanli
	}
	global.deli_animasyon = {
		 Arka: spr_deli_arka_yurume,
		 On: spr_deli_on_yurume,	
		 Yan: spr_deli_yan_yurume
	}
	global.krallik_asker_animasyon = {
		 Arka: spr_cicek_kralligi_asker_arka,
		 On: spr_cicek_kralligi_asker_on,	
		 Yan: spr_cicek_kralligi_asker_yan
	}
	global.krallik_asker_gri_animasyon = {
		 Arka: spr_cicek_kralligi_asker_gri_arka,
		 On: spr_cicek_kralligi_asker_gri_on,	
		 Yan: spr_cicek_kralligi_asker_gri_yan
	}
	global.erinus_anne_animasyon = {
		 Arka: spr_erinus_anne_arka_yurume,
		 On: spr_erinus_anne_on_yurume,	
		 Yan: spr_erinus_anne_yan_yurume
	}
	global.erinus_anne_animasyon = {
		 Arka: spr_erinus_anne_arka_yurume,
		 On: spr_erinus_anne_on_yurume,	
		 Yan: spr_erinus_anne_yan_yurume
	}
	global.oksalis_maskeli_animasyon = {
		Arka: spr_oksalis_arka_yurume,
		On: spr_oksalis_on_yurume,
		Yan: spr_oksalis_yan_yurume
	}
	global.oksalis_maskesiz_animasyon = {
		Arka: spr_oksalis_arka_yurume_maskesiz,
		On: spr_oksalis_on_yurume_maskesiz,
		Yan: spr_oksalis_yan_yurume_maskesiz
	}
	global.lilium_animasyon = {
		Arka: spr_lilium_arka_yurume,
		On: spr_lilium_on_yurume,
		Yan: spr_lilium_yan_yurume
	}
	global.berdan_asker_animasyon = {
		Arka: spr_berdan_asker_arka_yurume,
		On: spr_berdan_asker_on_yurume,
		Yan: spr_berdan_asker_yan_yurume
	}
	global.akonit_animasyon = {
		Arka: spr_akonit_arka_yurume,
		On: spr_akonit_on_yurume,
		Yan: spr_akonit_yan_yurume,
		Uzanma: spr_akonit_uzanma
	}
	global.akonit_asker_animasyon = {
		Arka: spr_akonit_asker_arka_yurume,
		On: spr_akonit_asker_on_yurume,
		Yan: spr_akonit_asker_yan_yurume,
		Uzanma: spr_akonit_uzanma
	}
	global.ardic_animasyon = {
		Arka: spr_ardic_arka_yurume,
		On: spr_ardic_on_yurume,
		Yan: spr_ardic_yan_yurume
	}
	global.minik_fare_animasyon = {
		Arka: spr_fare_arka_yurume,
		On: spr_fare_on_yurume,
		Yan: spr_fare_yan_yurume
	}
	global.kadir_asker_animasyon = {
		Arka: spr_kadir_asker_arka_yurume,
		On: spr_kadir_asker_on_yurume,
		Yan: spr_kadir_asker_yan_yurume
	}
	global.kadir_asker_fare_animasyon = {
		Arka: spr_kadir_asker_arka_yurume_fare,
		On: spr_kadir_asker_on_yurume_fare,
		Yan: spr_kadir_asker_yan_yurume_fare
	}
	global.atik_adam_animasyon = {
		Arka: spr_atik_arka,
		On: spr_atik_on,
		Yan: spr_atik_yan
	}
	global.mese_animasyon = {
		Arka: spr_mese_arka_yurume,
		On: spr_mese_on_yurume,
		Yan: spr_mese_yan_yurume
	}
	global.bahcivan_1_animasyon = {
		Arka: spr_bahcivan_arka_yurume,
		On: spr_bahcivan_on_yurume,
		Yan: spr_bahcivan_yan_yurume
	}
	global.bahcivan_2_animasyon = {
		Arka: spr_bahcivan_arka_yurume_1,
		On: spr_bahcivan_on_yurume_1,
		Yan: spr_bahcivan_yan_yurume_1
	}
	global.bahcivan_3_animasyon = {
		Arka: spr_bahcivan_arka_yurume_2,
		On: spr_bahcivan_on_yurume_2,
		Yan: spr_bahcivan_yan_yurume_2
	}
	global.cinnia_animasyon = {
		Arka: spr_cinnia_arka,
		On: spr_cinnia_on,
		Yan: spr_cinnia_yan
	}
	global.ozan_animasyon = {
		Arka: spr_ozan_arka,
		On: spr_ozan_on,
		Yan: spr_ozan_yan
	}
	global.ares_kargo_temsilcisi_animasyon = {
		Arka: spr_berdan_asker_arka_yurume,
		On: spr_berdan_asker_on_yurume,
		Yan: spr_berdan_asker_yan_yurume
	}
	global.pelin_animasyon = {
		Arka: spr_pelin_arka,
		On: spr_pelin_on,
		Yan: spr_pelin_yan
	}
	global.cikolata_scale = 1;

}