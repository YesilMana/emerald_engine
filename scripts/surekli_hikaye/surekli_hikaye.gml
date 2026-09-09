function bolumler() {
	
}





function gelistirici() {
	if keyboard_check(vk_backspace) && true {
		if keyboard_check(ord("O")) {
			kaydet();
		}
		if keyboard_check(ord("L")) {
			
		}
		if keyboard_check(ord("G")) {
			npc_konum_kaydetme_ozel(obj_npc_helda, room, global.cikolata.x + 60, global.cikolata.y, , , true);
			npc_konum_kaydetme_ozel(obj_npc_eymen, room, global.cikolata.x + 90, global.cikolata.y, , , true);
			npc_konum_kaydetme_ozel(obj_npc_halil, room, global.cikolata.x + 120, global.cikolata.y, , , true);
			npc_konum_kaydetme_ozel(obj_npc_ozan, room, global.cikolata.x + 140, global.cikolata.y, , , true);
			//npc_konum_kaydetme_ozel(obj_npc_sati, room, global.cikolata.x, global.cikolata.y, , , true);
			//npc_konum_kaydetme_ozel(obj_npc_hamza, room, global.cikolata.x, global.cikolata.y, , , true);
			//npc_konum_kaydetme_ozel(obj_npc_vince, room, global.cikolata.x, global.cikolata.y, , , true);
			//npc_konum_kaydetme_ozel(obj_npc_bilal, room, global.cikolata.x, global.cikolata.y, , , true);
			karakter_yonunu_don(obj_npc_helda, "sol");
			karakter_yonunu_don(obj_npc_eymen, "on");
			karakter_yonunu_don(obj_npc_halil, "arka");
			karakter_yonunu_don(obj_npc_ozan, "sag");
			/*global.helda_takip = true;
			global.eymen_takip = true;
			global.halil_takip = true;
			global.ozan_takip = true;
			global.sati_takip = true;
			global.hamza_takip = true;
			global.vince_takip = true;
			global.bilal_takip = true;*/
		}
		if keyboard_check(ord("B")) {
			konusma_baslat(1);
		}
	}
}