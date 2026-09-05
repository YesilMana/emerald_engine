function can_surekli_degisim(){
	if global.kalori > 20 && global.su > 20 && global.sicaklik > 20 {
		stat_degisim("can", 0.0001, 0);	
	}
	sifirlandi_mi(global.kalori, 0.002);
	sifirlandi_mi(global.su, 0.003);
	sifirlandi_mi(global.sicaklik, 0.004);
	olum_tetikleyicisi();
}

function sifirlandi_mi(sifirlanan, dusus) {
	if sifirlanan <= 1 {
		if !zaman_dur {
			global.can -= dusus;
			global.can_azaliyor = true;
		}
		return true;
	}
}

function olum_tetikleyicisi() {
	if global.can <= 0 {
		oldur();
	}
}

function can_dusme_draw() {
	static opakizm = 0;
	if global.can_azaliyor {
		opakizm += 0.008;
		
		if opakizm >= 0.4 opakizm = 0;
		
		if instance_exists(global.cikolata) && !zaman_dur && !global.sprite_serbest draw_sprite_ext(global.cikolata.sprite_index, global.cikolata.image_index, global.cikolata.x, global.cikolata.y, global.cikolata.image_xscale, global.cikolata.image_yscale, global.cikolata.image_angle, c_red, opakizm);
		global.can_azaliyor = false;
	}
	
	else {
		if instance_exists(global.cikolata) && !zaman_dur && !global.sprite_serbest  draw_sprite_ext(global.cikolata.sprite_index, global.cikolata.image_index, global.cikolata.x, global.cikolata.y, global.cikolata.image_xscale, global.cikolata.image_yscale, global.cikolata.image_angle, c_white, 0.1);	
	}
}	