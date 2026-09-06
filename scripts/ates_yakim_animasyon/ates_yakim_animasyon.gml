function ates_yakim_animasyon(){
	var yapim_suresi = global.ates_yakim_suresi_temel * room_speed;
	
	if global.ates_tetiklenme {
		ses_oynat(global.sfx_ates_yakim_baslama, 1, 0, 1, 80);
		global.ates_sayac = yapim_suresi;
		global.ates_yakim_basladi = true;
		global.ates_tetiklenme = false;
		global.ates_yakim_suresi = global.ates_yakim_suresi_temel;
	}
	
	if global.ates_yakim_basladi && global.ates_yakim_suresi > 0 {
		global.ates_yakim_suresi -= 1;
	}
	
	if global.ates_yakim_suresi == 0 && global.ates_yakim_basladi {
		global.ates_yakim_basladi = false;
		audio_stop_sound(global.sfx_ates_yakim_baslama);
		yenile();
	}
}