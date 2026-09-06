function envanter_ekrani_ozellestirme_globaller(){
	
	if (!global.android && !global.klavye_kontrolleri) || global.tablet_modu || (!global.android && global.klavye_kontrolleri && !global.tablet_modu) global.craft_baslangic_x = 130;
	if (global.android && !global.tablet_modu) || (!global.android && !global.tablet_modu && global.klavye_kontrolleri) global.craft_baslangic_x = 200;
	global.craft_baslangic_y = 115;
	global.craft_yatay_atlama = 38;
	global.craft_dikey_atlama = 34;
	global.craft_asagi_satira_gecis = 5;
	global.craft_sayfa_bitis_satiri = 4;
	global.mouse_yakinlik = 15;
	global.envanter_yazi_scale = 0.17;
	global.baloncuk_scale = global.envanter_yazi_scale;
	global.craft_tus_scale = global.envanter_yazi_scale + 0.06;
}