function gorev_aktif_mi(gorev_numarasi){
	var gorev_stringi = global.gorev_json[? string(gorev_numarasi)][? "gorev"];
	var icerik = ds_list_find_index(global.gorevler, gorev_stringi);
	
	if icerik == -1 {
		return false;
	}
	
	else {
		return true;	
	}
}