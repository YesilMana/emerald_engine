scale = global.envanter_scale;
var kategori_1 = global.siniflandirma_esyalar[? "esya_" + string(global.craft_kontrol_id)];
opaklik = global.envanter_ekrani_gorunme && global.envanter_sekme == global.sekme_numara_ayarlar && (kategori_1 == 0 || kategori_1 == undefined);
image_alpha = opaklik;
if point_distance(x, y, mouse_x, mouse_y) < mouse_yakinlik && opaklik && !duraklatmak {
	scale = global.envanter_scale + 0.1;
	if mouse_check_button_pressed(mb_left) {
		global.isleme_tetik = true;
		if sprite_index = spr_ok_sag {
			if global.ses_seviyesi > 0.90 global.ses_seviyesi = -0.05;
			global.ses_seviyesi += 0.05
		}
		if sprite_index = spr_ok_sol {
			global.ses_seviyesi -= 0.05
			if global.ses_seviyesi < 0 global.ses_seviyesi = 0.95;
		}
		ini_kaydet();
	}
}

image_xscale = scale;
image_yscale = scale;

	var cam = view_camera[0];
    var cam_x = camera_get_view_x(cam);
    var cam_y = camera_get_view_y(cam);
    var d_y = display_get_gui_height();
    var d_x = display_get_gui_width()

if sprite_index == spr_ok_sag {
	x = cam_x + (d_x / 2) + 60;
	y = cam_y + (d_y / 2) - 30;
}

else if sprite_index == spr_ok_sol {
	x = cam_x + (d_x / 2) - 60;
	y = cam_y + (d_y / 2) - 30;
}

