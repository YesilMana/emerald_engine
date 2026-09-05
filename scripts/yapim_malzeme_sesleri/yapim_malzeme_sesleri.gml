function yapim_malzeme_sesleri(){
	if global.secilmis_nesne_yapim_malzemesi_id != undefined {
		ses_oynat(variable_global_get("sfx_craft_" + string(global.secilmis_nesne_yapim_malzemesi_id)), 1, 0, 1);	
	}
}