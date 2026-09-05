function olum_draw(){
	if global.olum_ekrani {
		var hedef = 1;
		if global.can < 0.6 var hiz = 0.2;
		else var hiz = 0.2;
		global.can_opaklik = lerp(global.can_opaklik, hedef, hiz); 
		var cam = view_camera[0];
	    var cam_x = camera_get_view_x(cam);
	    var cam_y = camera_get_view_y(cam);
		var cam_w = camera_get_view_width(cam);
		var cam_h = camera_get_view_height(cam);
		var scale = 1.3;
		if global.android scale = 1.7;
		draw_sprite_ext(spr_olum_ekrani, global.timer / 20, cam_x, cam_y, scale, scale, 0, c_white, global.can_opaklik);
		var renk = global.alt_baslik;
		var mouse_uzaklik = point_distance(mouse_x, mouse_y, cam_x + (cam_w / 2), cam_y + cam_h - (cam_h / 4));
		var mouse_maksimum = 40;
		
		if mouse_uzaklik < mouse_maksimum renk = c_white;
		olum_yazisi(cam_x, cam_y, cam_w, cam_h, renk);
		
		
		if mouse_uzaklik < mouse_maksimum && mouse_check_button_pressed(mb_left) {
			ini_open("settings.ini");
			ini_write_real("ayarlar", "devam", 1);
			ini_close();
			game_restart();
		}
	}
}

function olum_yazisi(cam_x, cam_y, cam_w, cam_h, renk) {
	draw_set_halign(fa_center);
	draw_set_valign(fa_center);
	draw_set_color(global.baslik);
	draw_set_alpha(global.can_opaklik);
	if global.olum_ekrani_yazi == "" draw_text_transformed(cam_x + cam_w / 2, cam_y + (cam_h / 4), global.genel_yazilar[60], 0.5, 0.5, 0);
	else draw_text_transformed(cam_x + cam_w / 2, cam_y + (cam_h / 4), global.olum_ekrani_yazi, 0.5, 0.5, 0);
	draw_set_color(renk);
	draw_text_transformed(cam_x + (cam_w / 2), cam_y + cam_h - (cam_h / 4), global.genel_yazilar[257], global.envanter_yazi_scale * 2, global.envanter_yazi_scale * 2, 0);
	draw_set_alpha(1);
}

function oldur(olum_sirasinda_yazacak = "") {
	global.olum_ekrani_yazi = olum_sirasinda_yazacak;
	global.olum_ekrani = true;
	olum_ses();
}