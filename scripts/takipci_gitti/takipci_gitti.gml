function takipci_gitti(){
	for (var i = 0; i < array_length(global.tum_npc); i++) {
		var cisim = global.tum_npc[i];
		if instance_exists(cisim) {
			cisim.takip_sirasi = 0;
		}
	}
}