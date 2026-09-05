function bildirim_create(){
	var cam = view_camera[0];
	var cam_x = camera_get_view_x(cam);
	var cam_y = camera_get_view_y(cam);
	var cam_w = camera_get_view_width(cam);
	var cam_h = camera_get_view_height(cam);
	
	kenar_uzaklik_x = 20;
	if global.android kenar_uzaklik_x = 25;
	kenar_uzaklik_y = 120;
	if global.android kenar_uzaklik_y = 25;
	
	x = cam_x + cam_w - kenar_uzaklik_x;
	y = cam_y + kenar_uzaklik_y;
	sabit_x = x;
	sabit_y = y;
	global.bildirim_sabit_scale = 0.7;
	if global.android global.bildirim_sabit_scale = 0.8;
	global.bildirim_simgesi_boyut = global.bildirim_sabit_scale;
	image_xscale = global.bildirim_simgesi_boyut;
	image_yscale = global.bildirim_simgesi_boyut;
	
	
	depth = -10000;
}

function bildirim_step() {
	if oyun_disi_odalar || zaman_dur || gui_yok_olma {
		image_alpha = 0;
		exit;
	}
	image_alpha = 0.8;
	var cam = view_camera[0];
	var cam_x = camera_get_view_x(cam);
	var cam_y = camera_get_view_y(cam);
	var cam_w = camera_get_view_width(cam);
	var cam_h = camera_get_view_height(cam);
	

	x = cam_x + cam_w - kenar_uzaklik_x;
	y = cam_y + kenar_uzaklik_y;
	
	var sallanma = 0.3;
	if global.guncel_bildirim > global.bakilan_bildirim {
		image_index = 1;
		image_alpha = 1;
		x += random_range(-sallanma, sallanma);
		y += random_range(-sallanma, sallanma);
	}
	else if global.guncel_bildirim == global.bakilan_bildirim && global.guncel_bildirim == 0 {
		image_index = 0;	
		image_alpha = 0;
	}
	
	else if global.guncel_bildirim == global.bakilan_bildirim && global.guncel_bildirim > 0 {
		image_index = 2;	
		image_alpha = 0.3;
	}
	
	var _fark = abs(global.bildirim_simgesi_boyut - global.bildirim_sabit_scale);

	if (_fark > 0.01) {
	    // Fark büyükken hız yüksek olur, fark küçüldükçe hız logaritmik olarak dibe vurur.
	    // 0.4 çarpanını animasyonun genel hızıyla oynamak için değiştirebilirsin.
	    var _dinamik_hiz = _fark * 0.08; 
    
	    // Hızın aşırı düşüp animasyonun kilitlenmesini engellemek için bir alt taban (0.02) koyuyoruz
	    _dinamik_hiz = max(_dinamik_hiz, 0.02); 
    
	    global.bildirim_simgesi_boyut = lerp(global.bildirim_simgesi_boyut, global.bildirim_sabit_scale, _dinamik_hiz);
	} else {
	    global.bildirim_simgesi_boyut = global.bildirim_sabit_scale;
	}   

	x -= (global.bildirim_simgesi_boyut - global.bildirim_sabit_scale) * 35;
	image_xscale = global.bildirim_simgesi_boyut;
	image_yscale = global.bildirim_simgesi_boyut;
	
	for (var i = 0; i < 5; i++) {
	    var mx = device_mouse_x(i);
	    var my = device_mouse_y(i);
    
		if point_distance(x, y, mx, my) < 25 {
			if device_mouse_check_button_pressed(i, mb_left) && image_alpha > 0 {
				global.baloncuk_gorunurluk = false;
				yenile();
				sandik_yakinlik_kontrol();
				if global.envanter_ekrani_gorunme == 0 global.envanter_ekrani_gorunme = 1;
				else if global.envanter_ekrani_gorunme == 1 && global.envanter_sekme == global.sekme_numara_gorevler global.envanter_ekrani_gorunme = 0;
				global.envanter_sekme = global.sekme_numara_gorevler;
			}
		}
	}
}