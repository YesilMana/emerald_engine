function her_oda_stepin_baslangici() {//Senlik bir şey yok
	if (!global.android && !global.klavye_kontrolleri) || global.tablet_modu || (!global.android && global.klavye_kontrolleri && !global.tablet_modu) global.craft_baslangic_x = 130;
	if (global.android && !global.tablet_modu) || (!global.android && !global.tablet_modu && global.klavye_kontrolleri) global.craft_baslangic_x = 200;
	if !global.android && global.klavye_kontrolleri && !global.tablet_modu {
		global.RES_W = global.yatay_yukseklik;	
	}
	if global.android && !global.tablet_modu {
		global.RES_W = global.yatay_yukseklik;
	}
	
	if yakinlik(obj_depolama_temel) && (global.secildimmi_zemin == noone || bos_slotu_bul() == 999) {
		if global.z_basildi {
			yenile();
			sandik_yakinlik_kontrol();
			ates_yakinlik_kontrol();
			global.envanter_ekrani_gorunme = true;
			global.envanter_sekme = global.sekme_numara_sandik;
		}
	}
}	