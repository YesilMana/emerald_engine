function hayvan_kacis(){
	
	if !audio_is_playing(kacis_ses) {
		kacis_ses = audio_play_sound_on(yayici, hayvan_ses_ismi(obje_ismi, "kacis"), false, 1, global.ses_seviyesi, , random_range(0.9, 1.1));
	}
	
	if instance_exists(global.cikolata) {
		var final_uzaklik = 0;
		anlik_hiz = hiz_kosma;
		if hayvan_rastgele_sayac % 60 == 0 { 
			repeat(4) {
				var git_x = irandom_range(ilk_x - devriye_yaricapi, ilk_x + devriye_yaricapi);	
				var git_y = irandom_range(ilk_y - devriye_yaricapi, ilk_y + devriye_yaricapi);	
			
				var uzaklik = point_distance(git_x, git_y, global.cikolata.x, global.cikolata.y);
			
				if uzaklik > final_uzaklik {
					final_uzaklik = uzaklik;
					en_uzak_x = git_x;
					en_uzak_y = git_y;
				}
			}
		}
		
		if en_uzak_x != 0 && en_uzak_y != 0 {
			hayvan_git(en_uzak_x, en_uzak_y, anlik_hiz);
		}
		else if en_uzak_x == 0 && en_uzak_y == 0 {
			sprite_index = asset_get_index("spr_" + obje_ismi + "_" + "idle");
		}	
		
	}
}