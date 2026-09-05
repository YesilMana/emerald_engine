function kirildiysa_yenisini_ver(esya_id, saglamlik_degeri){
	if envanter_kontrol_surekli(esya_id, 1) == true && !global.ele_alindi {
		var slotu = hangi_slotta(esya_id);
		var saglamligi_1 = global.envanter_list[| slotu];
		var saglamligi_2 = saglamligi_1[? "saglamlik"];
		
		if saglamligi_2 < saglamlik_degeri && saglamligi_2 != 0 {
			envanterden_azalt(esya_id, 1);
			global.ele_alindi = false;
			envantere_ekle(esya_id, 1);
			show_debug_message("tencere eklendi");
		}
	}
}