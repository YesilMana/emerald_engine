function chatterbox_satir_atlama(){
	if (ChatterboxIsWaiting(global.chatterbox_dosyasi)) {
		var alan_x1 = (room_width / 2) - sprite_get_width(spr_menu);
		var alan_y1 = global.kontrol_menusu_sabit_y;
		var alan_x2 = (room_width / 2) + sprite_get_width(spr_menu);
		var alan_y2 = room_height - global.secenekler_kismi_aciklik;

		var _mouse_alan_icinde = point_in_rectangle(mouse_x, mouse_y, alan_x1, alan_y1, alan_x2, alan_y2);

		if (_mouse_alan_icinde) {
			if (mouse_wheel_up()) {
				metin_hedef_kaydirma += metin_kaydirma_hizi;
			}
			if (mouse_wheel_down()) {
				metin_hedef_kaydirma -= metin_kaydirma_hizi;
			}
		}
		
		if global.satir_atla {
			if (chatterbox_duraklatildi) {
				chatterbox_duraklatildi = false;
				chatterbox_sonraki_pause_index++;
			}
			else if (chatterbox_gosterilen_karakter < chatterbox_ayristirma.toplam_karakter) {
				chatterbox_gosterilen_karakter = chatterbox_ayristirma.toplam_karakter;
			}
			else {
				ChatterboxContinue(global.chatterbox_dosyasi);
				konusma_degisimi_algilama();
			}	
		}
		global.satir_atla = false;
	}
}