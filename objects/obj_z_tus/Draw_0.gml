if z_tus_yok_olma && sprite_index != spr_harita_tus exit;
if sprite_index != spr_menu_tus {
	if global.envanter_ekrani_gorunme {
		opaklik = 0;
		exit;
	}
}
else {
	if global.harita_uzaklasti {
		opaklik = 0;
		exit;
	}
}
if sprite_index == spr_harita_tus {
	if global.karakter_yurutuluyor {
		opaklik = 0;
		exit;
	}
}

if sprite_index != spr_z_tus {
	if global.konusma_basladi {
		opaklik = 0;
		exit;
	}
}
else {
	if global.konusma_basladi && global.android {
		opaklik = 1;	
	}
}
if ((global.z_renklendi || global.z_renklendi_android) && sprite_index == spr_z_tus) {
	if !global.harita_uzaklasti	{
		if global.android opaklik = 1;
	}
	else {
		opaklik = 0;	
	}

	if !global.android && !global.e_spam_cikmayacak {
		//kendini_ciz(hex_to_color("c15000"), true);
		draw_sprite_ext(spr_e_spam, image_index, x, y - 15, image_xscale, image_yscale, 0, hex_to_color("c15000"), 1);
		//var scale = random_range(0.4, 0.6);
		//if instance_exists(global.cikolata) draw_sprite_ext(spr_sari_nokta, global.timer / 30, global.cikolata.x, global.cikolata.y - 35, image_xscale * scale, image_yscale * scale, image_angle, global.gui_renk, random_range(0.2, 0.4));
	}

	if global.android {
		kendini_ciz(hex_to_color("c1863e"), true);
	}
	global.z_renklendi = false;
	global.z_renklendi_android = false;
	global.e_spam_cikmayacak = false;
}
else {
	if sprite_index != spr_harita_tus && global.android {
		kendini_ciz(global.gui_renk);
	}
	else kendini_ciz(global.gui_renk, true)
}

if global.konusma_basladi && sprite_index == spr_z_tus && global.android {
	opaklik = 1;
	kendini_ciz(hex_to_color("c1863e"), true);
}
