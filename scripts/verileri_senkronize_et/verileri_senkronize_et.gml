/// @function verileri_senkronize_et_guvenli(default_map, player_map)
function verileri_senkronize_et(_default_map, _player_map) {
   // if (!ds_exists(_default_map, ds_type_map) || !ds_exists(_player_map, ds_type_map)) return;

    var _key = ds_map_find_first(_default_map);
    var _limit = ds_map_size(_default_map); // Güvenlik sınırı
    var _count = 0;

    while (!is_undefined(_key) && _count < _limit) {
        _count++;
        
        // Eğer bu ana anahtar (örn: "gorevler" veya "yeni_ozellik") oyuncuda yoksa
        if (!ds_map_exists(_player_map, _key)) {
            var _val = _default_map[? _key];
            
            // Veri tipine göre temiz kopyalama yap
            if (is_real(_val) && ds_exists(_val, ds_type_map)) {
                var _copy = ds_map_create();
                ds_map_copy(_copy, _val);
                ds_map_add_map(_player_map, _key, _copy);
                show_debug_message("Yeni kategori eklendi: " + string(_key));
            } 
            else if (is_real(_val) && ds_exists(_val, ds_type_list)) {
                var _copy = ds_list_create();
                ds_list_copy(_copy, _val);
                ds_map_add_list(_player_map, _key, _copy);
                show_debug_message("Yeni liste eklendi: " + string(_key));
            }
            else {
                _player_map[? _key] = _val;
                show_debug_message("Yeni veri eklendi: " + string(_key));
            }
        }
        
        _key = ds_map_find_next(_default_map, _key);
    }
}