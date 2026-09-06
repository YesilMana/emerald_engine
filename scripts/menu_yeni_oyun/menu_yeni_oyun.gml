function menu_yeni_oyun(){
	dosya_sil("kullanici.json");
    dosya_sil("craft_" + global.dil + ".json");
    dosya_sil("craft_cache_" + global.dil + ".buf");
    dosya_sil("user_cache.buf");
	dosya_sil("npc_konumlari.json");
	dosya_sil("npc_konumlari.buf");
	dosya_sil("sandiklar.buf");
	dosya_sil("sandiklar.json");
	dosya_sil("settings.ini");
	game_restart();
}