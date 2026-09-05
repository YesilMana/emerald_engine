function makrolar(){
	//Kolay kodlama için makrolar
	#macro karakter_yuruyemez (global.konusma_basladi || global.harita_uzaklasti || global.envanter_ekrani_gorunme || oyun_dur || (global.kilic_sallaniyor > 0) || global.karakter_yurutuluyor || global.karanlik > 0.4 || hikaye_karakter_yurume_engelle)
	#macro gui_yok_olma (oyun_dur || global.hikaye_kontrolleri_45 || global.harita_uzaklasti)
	#macro konusma_baslayamaz (global.genel_yakim_basladi || global.envanter_ekrani_gorunme || global.olum_ekrani || global.karanlik > 0.4)
	#macro zaman_dur (global.konusma_basladi || global.envanter_ekrani_gorunme || global.genel_yakim_basladi || global.olum_ekrani || global.karanlik > 0.7)
	#macro boss_zaman_dur (global.konusma_basladi || global.envanter_ekrani_gorunme || global.olum_ekrani || global.karanlik > 0.1)
	#macro oyun_dur (global.genel_yakim_basladi || global.olum_ekrani || global.karakter_yurutuluyor)
	#macro yurume_tusuna_basilmiyor (!global.yukari_basildi && !global.asagi_basildi && !global.sol_basildi && !global.sag_basildi)
	#macro x_let (global.x_basilabilir)
	#macro z_let (global.z_basilabilir)
	#macro oda_hizli (room_speed == 60)
	#macro oda_yavas (room_speed == 30)
	#macro takipci_olusmayan_odalar (oyun_disi_odalar)
	#macro mouse_acik (!gui_yok_olma || global.olum_ekrani)
	#macro joystick_kapali (global.envanter_ekrani_gorunme)
	#macro ates_malzemesi_gorunme (((global.craft_ekrani_satir) <= global.craft_malzeme_baslama + 3) && (global.craft_malzeme_baslama) <= global.craft_ekrani_satir + 1)
	#macro yapim_malzemesi_gorunme (global.secilmis_nesne_yapim_malzemesi_id != undefined && ((global.craft_ekrani_satir) <= global.craft_malzeme_baslama + 2) && (global.craft_malzeme_baslama) <= global.craft_ekrani_satir + 2)
	#macro hikaye_karakter_yurume_engelle (global.hikaye_kontrolleri_87 || global.hareket_kamera_basladi || global.kamera_takibi != global.cikolata)
	#macro z_tus_yok_olma (oyun_dur)
	#macro karakterler_yurume_durma (global.envanter_ekrani_gorunme || global.olum_ekrani)
	#macro yeniden_baslamayacak_odalar (oyun_disi_odalar)
	#macro oyuncu_komut_veremez (global.hikaye_kontrolleri_121 || global.hikaye_kontrolleri_45)
	#macro odayi_asacak_odalar (false)
	#macro harita_uzaklasacak_odalar (room == rm_mahalle_1)
	
	//Mekanikler
	#macro mekanik_ates true
	#macro mekanik_saat true
	#macro mekanik_su true
	#macro mekanik_yorgunluk true
	#macro mekanik_yemek true
	//Kullanımlar
	#macro su_depo (global.su < global.su_maksimum - 3)
	#macro kalori_depo (global.kalori < global.kalori_maksimum)
	#macro sicaklik_depo (global.sicaklik < global.sicaklik_maksimum)
	#macro can_depo (global.can < global.can_maksimum)
	#macro z_yanmayacak_objeler (obj_yatak)
	#macro yagmur_yagmayacak_odalar (false)
	#macro icerideki_odalar (false)
	#macro takipciler_carpabilecek (false)

	
	#macro oyun_disi_odalar (room == rm_menu || room == rm_menu_2 || room == rm_menu_6 || room == rm_menu_7 || room == rm_menu_4 || room == rm_opening)
	#macro sis_olusacak_odalar (false)
	#macro yaprak_olusacak_odalar (false)
	#macro kamera_buyuk_odalar (oyun_disi_odalar)
}