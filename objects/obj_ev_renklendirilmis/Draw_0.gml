
if yaniyor {
	draw_sprite_ext(yanan_sprite, 1, x, y, image_xscale, image_yscale, 0, c_white, 1);
	for (var i = 0; i < alev_sayisi; i++) {
		var _x_temel = variable_instance_get(id, "alev_x_" + string(i));
		var _y_temel = variable_instance_get(id, "alev_y_" + string(i));
		
		var _x = x + _x_temel;
		var _y = y - _y_temel;
		draw_sprite_ext(spr_ates_1, global.timer / 5, _x, _y, 1, 1, 0, c_white, random_range(0.8, 1));	
	}
}
else {
	draw_self();
}	