function geri_sayim_baslat(numara, sure_saniye) {
	if global.geri_sayim_sure_saniye <= 0 {
		global.geri_sayim_numara = numara;
		global.geri_sayim_sure_saniye = sure_saniye * 60;
	}
}

function geri_sayim_step() {//Geri sayımların sonucunda olacak şeyler burada görünür
	if global.geri_sayim_sure_saniye > 0 {
		global.geri_sayim_sure_saniye -= 1;
		if global.geri_sayim_sure_saniye == 1 {
			var tutucu = global.geri_sayim_numara;
			global.geri_sayim_numara = 0;
			global.geri_sayim_sure_saniye = 0;
			
			switch tutucu {
				case 1: 
					global.hikaye_kontrolleri_87 = false;
					karart(5);
					ara_sahne_yeni(spr_erinus_magara_ceset, 5);
					konusma_baslat(2);
					break;
				case 2: 
					npc_konum_kaydetme_ozel(obj_npc_kargo_askeri_1, room, 2800, 1600, , , true);
					karakter_git(7);
					break;
				case 4: 
					global.kamera_takibi = global.cikolata;
					geri_sayim_baslat(5, 2);
					kamera_hizi(8);
					break;
				case 5:
					kamera_hizi(10);
					global.hikaye_kontrolleri_87 = false;
					break;
				case 7:
					konusma_baslat(28);
					global.hikaye_kontrolleri_87 = false;
					break;
				case 8:
					game_restart();
					break;
			}
		
		}
	}
}