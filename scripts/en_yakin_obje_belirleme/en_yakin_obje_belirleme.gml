function en_yakin_obje_belirleme(){
    if (global.timer % 1 == 0) {
        if (!instance_exists(global.cikolata)) return; 

        var en_yakin = noone; 
        var son_uzaklik = 99999999;
        var liste_boyutu = ds_list_size(global.yakinlik_list);
		var obje_debug_isim = "";
		
        var mevcut_obje_turu = noone;

        for (var i = 0; i < liste_boyutu; i++) {
            mevcut_obje_turu = global.yakinlik_list[| i];
           
                var nearest = instance_nearest(global.cikolata.x, global.cikolata.y, mevcut_obje_turu);
				if nearest == noone continue;
                var uzaklik = point_distance(global.cikolata.x, global.cikolata.y, nearest.x, nearest.y);
                
                if (uzaklik < son_uzaklik) {
					if variable_instance_exists(nearest, "takip_ediliyor") && nearest.takip_ediliyor == true{
						continue;
					}
                    son_uzaklik = uzaklik;
                    en_yakin = nearest; // KAZANAN ID BU
					obje_debug_isim = global.yakinlik_list[| i];
                }
            
        }
        global.en_yakin_obje = en_yakin;
		global.debug_1 = obje_debug_isim;
    }
}