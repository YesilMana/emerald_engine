function envanter_ekrani_step(){
	opaklik = global.envanter_ekrani_gorunme;
	if global.menu_tus_basildi && !duraklatmak && !global.konusma_basladi && !oyuncu_komut_veremez {
		global.craft_opaklik_kontrol = true;
		if global.envanter_ekrani_gorunme == 0 {
			global.envanter_ekrani_gorunme = 1;
			craft_ekrani_acma();
		}
		else if global.envanter_ekrani_gorunme == 1 && !global.ele_alindi {
			global.envanter_sekme = global.sekme_numara_envanter;
			global.envanter_ekrani_gorunme = 0;
			craft_ekrani_kapama();
		}
	}
	if global.ayar_tus_basildi && !duraklatmak && !global.konusma_basladi && !oyuncu_komut_veremez {
		global.craft_opaklik_kontrol = true;
		if global.envanter_ekrani_gorunme == 0 {
			global.envanter_ekrani_gorunme = 1;
			craft_ekrani_acma();
			global.envanter_sekme = global.sekme_numara_ayarlar;
		}
		else if global.envanter_ekrani_gorunme == 1 && !global.ele_alindi {
			global.envanter_sekme = global.sekme_numara_envanter;
			global.envanter_ekrani_gorunme = 0;
			craft_ekrani_kapama();
		}
	}
}