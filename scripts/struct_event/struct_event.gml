function struct_create() {
	global.kontrol_menu_ekran = new kontrol_menusu();
}
function struct_step(){
	global.kontrol_menu_ekran.menu_acil_tetikleme();
	global.kontrol_menu_ekran.menu_acil();
	global.kontrol_menu_ekran.menu_kapan();
	global.kontrol_menu_ekran.tus_etkilesim();
	global.kontrol_menu_ekran.menu_gec_tusu_aktiflik_sorgula();
	global.kontrol_menu_ekran.menu_sekme_secimi();
}
function struct_draw(){
	global.kontrol_menu_ekran.menu_temel_cizim();
	global.kontrol_menu_ekran.menu_sekme_cizim();
}