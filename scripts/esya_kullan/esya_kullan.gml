function esya_kullan(){
	if (global.envanter_kullan_basildi || (!global.android && mouse_check_button_pressed(mb_right))) && !zaman_dur && !karakter_yuruyemez && !global.hikaye_kontrolleri_55 {
		var esya_kullan_1 = global.envanter_list[| global.mini_envanter_secili]; //seçili nesnenin envanter koordinatı
		var esya_kullan_2 = esya_kullan_1[? "esya"]; //Seçili nesnenin kodu
		if esya_kullan_2 != -1 {
			var esya_kullan_3 = kodunu_al(esya_kullan_2);
			var arda = asset_get_index("esya_kullanim_" + string(esya_kullan_3));
			if arda != -1 {
				global.kullanilan_esya = esya_kullan_2;	
				global.kullanildi_esya = esya_kullan_3;
			}
			script_cagir("esya_kullanim_" + string(esya_kullan_3));
		}
	}
}