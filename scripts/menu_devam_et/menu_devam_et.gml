function menu_devam_et(){
	room_goto(global.json_oda_isim);
	global.devam_etme = true;
	shader_devam_et();
}

function shader_devam_et() {
	var referans = obj_shader_android;
	referans.color_tint[0] = global.shader_1;
	referans.color_tint[1] = global.shader_2;
	referans.color_tint[2] = global.shader_3;
	referans.tint_strength = global.shader_4;
	referans.contrast = global.shader_5;
	referans.saturation = global.shader_6;	
}