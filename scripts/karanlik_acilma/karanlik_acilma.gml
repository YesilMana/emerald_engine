function karanlik_acilma(seviye = 0.01){
	if global.karanlik == undefined exit;
	if global.karanlik <= 0 {
		global.karanlik_azalma = false;
		global.karanlik = 0;
		exit;
	} 
	global.karanlik -= seviye;
}

function karanlik_artma(seviye = 0.01) {
	if global.karanlik == undefined exit;
	if global.karanlik >= 1 {
		global.karanlik_artis = false;
		global.karanlik = 1;
		exit;
	}
	global.karanlik += seviye;	
}

function karart(saniye = 1) {
	global.karanlik = saniye;	
	global.karanlik_azalma = true;
}

function karanlik_cizim() {
	if global.karanlik == undefined {
		show_debug_message("LAN KARANLIK NERDE!");
		exit;
	}
	draw_set_colour(c_black);
	draw_set_alpha(global.karanlik);
	draw_rectangle(-200, -200, 5000, 5000, false);
	
	draw_set_alpha(1);
	draw_set_colour(c_white);
}