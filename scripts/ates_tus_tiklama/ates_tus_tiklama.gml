function ates_tus_tiklama(){
	if global.ates_mekanigi {
		var ates = global.en_yakin_ates;
		if global.atese_yakin {
			if mouse_check_button_pressed(mb_left) { //Tıklanma
				var yakacak_kontrol = global.envanter[global.ates_yakacak_secilmis_no];
				var kibrit_kontrol = global.envanter[global.ates_kibrit_secilmis_no];
				var yaniyor_0 = global.ates_map[? string(global.en_yakin_ates.ates_no)];
				if yaniyor_0[? "sure"] == false {
					if global.ates_kibrit_secilmis_no != 0 && global.ates_yakacak_secilmis_no != 0 && yakacak_kontrol > 0 && kibrit_kontrol > 0 {
						var ihtimal = global.ates_kibrit_secilmis_ihtimal;
						var cark_cevir = irandom(100);
						if ihtimal >= cark_cevir {
							var eklenecek_sure_1 = global.ates_yakacak_secilmis_sure;
							yaniyor_0[? "sure"] += eklenecek_sure_1;
							yaniyor_0[? "sure"] += global.ates_yakim_suresi_tekil;
						
							//Yanacak nesne silme
							var craft_slot = hangi_slotta(global.ates_yakacak_secilmis_no);	
							var craft_konum = global.envanter_list[| craft_slot];
							craft_konum[? "adet"] -= 1;
							if craft_konum[? "adet"] <= 0 {
								craft_konum[? "esya"] = -1;	
							}
						
						}
						
						else {
							bilgi_ver(128, 5);	
						}
					
						//Kibrit silme
						var craft_slot = hangi_slotta(global.ates_kibrit_secilmis_no);	
						var craft_konum = global.envanter_list[| craft_slot];
						craft_konum[? "adet"] -= 1;
						if craft_konum[? "adet"] <= 0 {
							craft_konum[? "esya"] = -1;	
						}
						yenile();
						global.ates_tetiklenme = true;
							var ses = sfx_button_tiklama;
							audio_play_sound(ses, 1, false);
							audio_sound_gain(ses, global.ses_seviyesi);
					}
				
				}	
			
				else if yaniyor_0[? "sure"] >= 1 && yakacak_kontrol > 0 {
					var eklenecek_sure_1 = global.ates_yakacak_secilmis_sure;
					yaniyor_0[? "sure"] += eklenecek_sure_1;
					yaniyor_0[? "sicaklik"] += random_range(0.001, 0.0001);
					global.ates_parlama = true;
					ses_oynat(global.sfx_ates_parlama, 1, 0, 0, 99);
					//Yanacak nesne silme
					var craft_slot = hangi_slotta(global.ates_yakacak_secilmis_no);	
					var craft_konum = global.envanter_list[| craft_slot];
					craft_konum[? "adet"] -= 1;
					if craft_konum[? "adet"] <= 0 {
						craft_konum[? "esya"] = -1;	
					}
					envanter_analiz_et();
					ates_yakacak_kontrol();
					yakacak_kontrol = global.envanter[global.ates_yakacak_secilmis_no];
					if yakacak_kontrol <= 0 {
						yenile();	
					}
				}
			}
		}
	}
}

function ates_secim_sifirla() {
					global.ates_yakacak_secilmis = "";
					global.ates_yakacak_secilmis_no = 0;
					global.ates_yakacak_secilmis_sure = 0;
					global.ates_kibrit_secilmis = "";
					global.ates_kibrit_secilmis_no = 0;
					global.ates_kibrit_secilmis_ihtimal = 0;
}	