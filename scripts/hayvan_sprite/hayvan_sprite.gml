function hayvan_sprite(){
	if global.timer % 10 == true {
		var sprite_string_devami = sprite_string_donus(hareket_sureci);
		sprite_index = asset_get_index("spr_" + obje_ismi + "_" + sprite_string_devami);
	}
}