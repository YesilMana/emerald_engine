function sabit_konusmalar(){
    // ID'nin -1 olmadığını ve çağrılacak dizinin içinde bu ID'nin var olduğunu kontrol ediyoruz
    if (global.aktif_konusma_id != -1 && global.aktif_konusma_id < array_length(global.konusmalar)) {
        konusma_tetikleme(global.aktif_konusma_id, global.aktif_konusma_basla, global.aktif_konusma_obje);
    } else if (global.aktif_konusma_id != -1) {
        // Oyunun çökmesini engelledik ama loglara hata basarak hangi ID'nin eksik olduğunu görelim
        show_debug_message("UYARI: " + string(global.aktif_konusma_id) + " ID'li konuşma dizide bulunamadı!" + string(room_get_name(room)));
		if room == rm_opening {
			game_restart();
		}
    }
}