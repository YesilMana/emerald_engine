function saat_cizim(){
	if global.envanter_ekrani_gorunme && false {
		var cam = view_camera[0];
	    var cam_x = camera_get_view_x(cam);
	    var cam_y = camera_get_view_y(cam);
		var cam_w = camera_get_view_width(cam);
		var cam_h = camera_get_view_height(cam);
		
		var uzaklik = 20;
		var saat_x = cam_x + cam_w - uzaklik;
		var saat_y = cam_y + uzaklik;
		
		if global.saat < 10 {
			var kisim_saat = "0" + string(global.saat);
		}
		
		else {
			kisim_saat = string(global.saat);
		}
		
		if global.dakika < 10 {
			var kisim_dakika = "0" + string(global.dakika);
		}	
		
		else {
			var kisim_dakika = string(global.dakika);	
		}
		draw_set_halign(fa_right);
		draw_set_valign(fa_right);
		sayfa_yaz(saat_x, saat_y, kisim_saat + "." + kisim_dakika, global.envanter_yazi_scale, , global.alt_baslik);
	}
}