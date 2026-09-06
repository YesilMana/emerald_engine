function takip_birak(global_ismi, obje_ismi){
	variable_global_set(global_ismi, 0);
	if instance_exists(obje_ismi) {
		obje_ismi.takip_basladi = false;
		var takib = obje_ismi.takip_sirasi;
		//global.sira[takib] = 0;
		for (var i = 1; i <= 20; i++) {
			global.sira[i] = 0;	
		}
		obje_ismi.takip_sirasi = 0;
		obje_ismi.takip_ediliyor = false;
	
		var npc_isim = object_get_name(obje_ismi);
		var listemin = ds_list_find_index(global.takipciler_list, npc_isim);
		if listemin != -1 {
			ds_list_delete(global.takipciler_list, listemin);	
		}
		takipci_gitti();
	}
}
