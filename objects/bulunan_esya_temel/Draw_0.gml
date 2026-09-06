var golge_kalinlik = 1;
draw_sprite_ext(sprite_index, image_index, x - golge_kalinlik, y + golge_kalinlik, image_xscale, image_yscale, image_angle, c_black, 0.3);

if global.secildimmi_zemin == id && point_distance(global.cikolata.x, global.cikolata.y, x, y) < global.esya_alma_uzaklik {
	kendini_ciz(global.gui_renk, 1);
}

else {
	kendini_ciz(c_white, 1);
}


