if (variable_instance_exists(id, "ev_temeli")) {
	draw_sprite_ext(ev_temeli, 0, x, y, image_xscale, image_yscale, image_angle, c_white, image_alpha);	
}

else {
	draw_sprite_ext(sprite_index, 0, x, y, image_xscale, image_yscale, image_angle, c_white, image_alpha);			
}

if (variable_instance_exists(id, "kapi")) {
    var _kx = variable_instance_exists(id, "kapi_x") ? kapi_x : x;
    var _ky = variable_instance_exists(id, "kapi_y") ? kapi_y : y;
    draw_sprite_ext(kapi, 0, _kx, _ky, 1, 1, 0, c_white, 1);    
}

if (variable_instance_exists(id, "pencere_sayisi")) {
    for (var i = 1; i <= pencere_sayisi; i++) {
        var isim_sprite = "pencere_" + string(i);
        var isim_x = "pencere_x_" + string(i);
        var isim_y = "pencere_y_" + string(i);
        
        if (variable_instance_exists(id, isim_sprite)) {
            var spr = variable_instance_get(id, isim_sprite);
            
            var _px = variable_instance_exists(id, isim_x) ? variable_instance_get(id, isim_x) : x;
            var _py = variable_instance_exists(id, isim_y) ? variable_instance_get(id, isim_y) : y;
            
            draw_sprite_ext(spr, 0, _px, _py, 1, 1, 0, c_white, 1);
        }
    }
}