function envanter_makro(){
	#macro craft_secim_yapildi (global.craft_ekrani_secim != 0)
	#macro craft_json_fazlaliklar (map_key != "uretim_icin_gereken" && map_key != "uretim_adedi" && map_key != "siniflama" && map_key != "uretim_suresi" && map_key != "craft_zorluk" && map_key != "ates")
	#macro duraklatmak (global.craft_basladi || global.craft_tus_tiklandi || global.ates_yakim_basladi || oyun_dur)
	#macro baloncuk_gorunme (global.baloncuk_gorunurluk && global.envanter_ekrani_gorunme)
	#macro mini_baloncuk_gorunme (global.mini_envanter_baloncuk && !global.envanter_ekrani_gorunme)
}