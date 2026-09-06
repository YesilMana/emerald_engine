function oyun_hemen_basla() {
	if global.devam_et {
		menu_devam_et();
		global.devam_et = false;
		ini_open("settings.ini");
		ini_write_real("ayarlar", "devam", 0);
		ini_close();
	}
}