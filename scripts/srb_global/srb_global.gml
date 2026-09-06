function srb_global(){
	scribble_add_macro("saskinlik", srb_saskinlik_ses_calma);
	scribble_add_macro("titret", srb_ekran_titreme);
}


function srb_karanlik_tumu() {
	global.karanlik_azalma = true;
	global.karanlik_artis = false;        
	global.konusma_basladi = false;
	global.karanlik_artis = false;
	global.hikaye_kontrolleri_64 = false;	
}

function srb_karanlik_acilma(data) {
    if (data != undefined) {
        global.karanlik_hizi = real(data);
    } else {
        global.karanlik_hizi = 0.01;
    }
    
    global.karanlik_azalma = true;
    return "";
}

function srb_saskinlik_ses_calma() {
	audio_play_sound(global.sfx_konusma_saskinlik, 1, false);
	audio_sound_gain(global.sfx_konusma_saskinlik, global.ses_seviyesi);
	return "";
}

function srb_ekran_titreme() {
	ekran_titret(10, 30);
	return "";
}
