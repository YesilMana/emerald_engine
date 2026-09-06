function ates_sure_degistir(ates_no, degisecek_sure){
    // Önce haritanın (DS Map) bellekte gerçekten var olup olmadığına bakıyoruz
    if (ds_exists(global.ates_map, ds_type_map)) {
        var ates = global.ates_map[? string(ates_no)];
        if (!is_undefined(ates)) {
            ates[? "sure"] = degisecek_sure;
        }
    }
}

function ates_sure_getir(ates_no) {
    if (ds_exists(global.ates_map, ds_type_map)) {
        var ates = global.ates_map[? string(ates_no)];
        if (!is_undefined(ates)) {
            return ates[? "sure"];
        }
    }
    return 0; // Eğer harita veya ateş yoksa çökmesin, 0 dönsün
}