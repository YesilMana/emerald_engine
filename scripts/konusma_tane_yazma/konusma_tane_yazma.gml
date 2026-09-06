function konusma_tane_yazma(){
	//Konuşma'nın harf harf yazılmasını sağlar
    if (global.yazi_index < string_length(global.yazi_tam_metin)) {
        global.yazi_index += global.yazi_hiz;
        global.yazi_yazilacak_metin = string_copy(global.yazi_tam_metin, 1, global.yazi_index);
    }
}