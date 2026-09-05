function menu_tus_5(){
	if mouse_check_button_pressed(mb_left) && global.timer > (global.aktiflik_timer + 5) {
		onay_ekrani_goster(global.genel_yazilar[116], , , 5);
	}
}