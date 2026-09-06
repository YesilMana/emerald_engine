if (instance_exists(global.cikolata)) {
    var en_yakin = instance_nearest(global.cikolata.x, global.cikolata.y, obj_konusma_parent);
    
    if (en_yakin != noone && en_yakin == global.en_yakin_obje) {
        with (global.cikolata) {
            if (place_meeting(x, y, en_yakin)) {
                global.z_renklendi = true;
                if (en_yakin.object_index == z_yanmayacak_objeler && !global.konusma_basladi) {
                    global.z_renklendi = false;
                }

                var _isim = object_get_name(en_yakin.object_index);
                var _son_alt_cizgi = string_last_pos("_", _isim);
                var _numara_str = string_copy(_isim, _son_alt_cizgi + 1, string_length(_isim) - _son_alt_cizgi);
                var _numara = real(_numara_str);
                
                konusma_hazirla(_numara, true);
            }
        }
    }
}