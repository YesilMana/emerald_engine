function takipci_takip(global_ismi, obje_ismi){
	ds_map_add(global.takipci_global_isimleri, object_get_name(obje_ismi), global_ismi);
	if instance_exists(obje_ismi) {
		if variable_global_get(global_ismi) {
			var objemin_ismi = object_get_name(obje_ismi);
			if (ds_list_find_index(global.takipciler_list, objemin_ismi) == -1) {
			    ds_list_add(global.takipciler_list, objemin_ismi);
			}
			takipci_animasyon(obje_ismi);
		}
	}
}