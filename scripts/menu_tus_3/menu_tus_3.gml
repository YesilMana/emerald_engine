function menu_tus_3(){
	yazicik = global.genel_yazilar[107];
	if mouse_check_button_pressed(mb_left) && global.timer > (global.aktiflik_timer + 5) && (global.android || global.klavye_kontrolleri) {
		onay_ekrani_goster(global.genel_yazilar[111], , , 3);
	}
	
	if global.tablet_modu cizim_rengi = hex_to_color("88c153");
	if !global.tablet_modu cizim_rengi = hex_to_color("f05948");
	if !global.android && !global.klavye_kontrolleri cizim_rengi = hex_to_color("7d7972");
	
	
}