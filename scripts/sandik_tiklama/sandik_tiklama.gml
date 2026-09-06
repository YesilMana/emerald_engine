function sandik_tiklama(){
	var cam = view_camera[0];
	var cam_x = camera_get_view_x(cam);
	var cam_y = camera_get_view_y(cam);
	var sandik_uzaklik_max = 30;
	var sandik_uzaklik = point_distance(global.cikolata.x, global.cikolata.y, x, y);
	var mouse_uzaklik = point_distance(mouse_x, mouse_y, x, y);
	var mouse_uzaklik_max = 20;
	
	if (sandik_uzaklik < sandik_uzaklik_max) && !karakter_yuruyemez && !zaman_dur {
		if (mouse_uzaklik < mouse_uzaklik_max) {
			global.z_renklendi = true;
			global.z_renklendi_android = true;
			if mouse_check_button_pressed(mb_left) {
				global.envanter_ekrani_gorunme = true;
				global.envanter_sekme = global.sekme_numara_sandik;
				sandik_yakinlik_kontrol();
				sandik_rastgele_olusma();	
			}
		}
	}
}