function yakinlik(karakter_tipi, bir_canli_mi = undefined, z_renklen = true) {
	if (instance_number(karakter_tipi) == 0) return false;
    if (global.timer % 60 == 0) { 
        var obje_ismi = karakter_tipi;
        if (ds_list_find_index(global.yakinlik_list, obje_ismi) == -1) {
            ds_list_add(global.yakinlik_list, obje_ismi);    
             // show_debug_message("Listeye Eklendi: " + obje_ismi);
        }
    }
   
    if (!instance_exists(global.cikolata)) return false;

    var my_nearest_inst = instance_nearest(global.cikolata.x, global.cikolata.y, karakter_tipi);

	if (my_nearest_inst == noone) return false;

    if (global.en_yakin_obje != my_nearest_inst) return false;
	
	
	
    if (variable_instance_exists(my_nearest_inst, "takip_ediliyor")) {
         if (my_nearest_inst.takip_ediliyor == true) return false;
    }
	
    if (variable_instance_exists(my_nearest_inst, "gidiyor")) {
         if (my_nearest_inst.gidiyor == true) return false;
    }
	
    with (my_nearest_inst) {
        var gercek_genislik = sprite_get_width(sprite_index) * abs(image_xscale);
        var gercek_yukseklik = sprite_get_height(sprite_index) * abs(image_yscale);
        var collision_distance = ((gercek_genislik + gercek_yukseklik) / 2) + 6;

        if (point_distance(x, y, global.cikolata.x, global.cikolata.y) <= collision_distance) {
			if z_renklen {
				global.z_renklendi = true;
				if global.android global.z_renklendi_android = true;
				if karakter_tipi == z_yanmayacak_objeler && !global.konusma_basladi global.z_renklendi = false;
			}
            return true;
        }
    }
    
    return false;
}

function ic_ice(karakter_tipi) {
	if (global.timer % 30 == 0) { 
        var obje_ismi = karakter_tipi
        if (ds_list_find_index(global.yakinlik_list, obje_ismi) == -1) {
            ds_list_add(global.yakinlik_list, obje_ismi);     
        }
    }
	
	if (instance_number(karakter_tipi) == 0) return false;
    
    //if (!instance_exists(karakter_tipi)) return false;
    if (!instance_exists(global.cikolata)) return false;

    var my_nearest_inst = instance_nearest(global.cikolata.x, global.cikolata.y, karakter_tipi);
	//show_debug_message(my_nearest_inst);
	if my_nearest_inst == noone exit;
	
    if (global.en_yakin_obje != my_nearest_inst) {
		return false;
	}
	
    var _cakisma = false;
    
    var _hedef_obje_id = my_nearest_inst; 

    with (global.cikolata) {
        if (place_meeting(x, y, _hedef_obje_id)) {
			global.z_renklendi = true;
			if karakter_tipi == z_yanmayacak_objeler && !global.konusma_basladi global.z_renklendi = false;
            _cakisma = true;
        }
    }
    
    return _cakisma;
}

function cakisma(karakter_tipi) {
    if (!instance_exists(karakter_tipi)) return false;
    if (!instance_exists(global.cikolata)) return false;
	var _cakisma = false
    with (global.cikolata) {
        if (place_meeting(x, y, karakter_tipi)) {
            _cakisma = true;
        }
    }
    
    return _cakisma;
}