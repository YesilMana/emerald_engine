opaklik = global.envanter_ekrani_gorunme && global.bilgi_onay;

if !global.bilgi_onay {
	instance_destroy();	
	instance_destroy(obj_bilgi_onay_tusu);	
	instance_destroy(obj_bilgi_red_tusu);	
}

if (global.envanter_ekrani_gorunme) == false && !oyun_disi_odalar {
	global.bilgi_onay = false;	
}

if oyun_disi_odalar && global.bilgi_onay {
	opaklik = 1;
}