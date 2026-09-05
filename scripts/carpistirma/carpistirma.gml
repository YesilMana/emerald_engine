function carpistirma(obje) {
	//Karakterin çarpışacağı objeler (yeni obje eklemek için tüm satırın çoğaltılıp o satırdaki yerine yeni obje yazılmalıdır)
    global.carpisildi = false;
	if instance_exists(obje) {
		with (obje) {
			var carpma = false;
			if (nesne_carpmama(obj_blok)) { carpma = true; }//Son satırı tamamen kopyalayıp aşağıya yapıştır
			if (nesne_carpmama(obj_depolama_temel)) { carpma = true; }//Son satırı tamamen kopyalayıp aşağıya yapıştır
			if (nesne_carpmama(obj_agac)) { carpma = true; }//Son satırı tamamen kopyalayıp aşağıya yapıştır
			if (nesne_carpmama(obj_cit_yan)) { carpma = true; }//Son satırı tamamen kopyalayıp aşağıya yapıştır
			if (nesne_carpmama(obj_cit_dik)) { carpma = true; }//Son satırı tamamen kopyalayıp aşağıya yapıştır
			if (nesne_carpmama(obj_cali)) { carpma = true; }//Son satırı tamamen kopyalayıp aşağıya yapıştır
			if (nesne_carpmama(obj_ev_temel)) { carpma = true; }//Son satırı tamamen kopyalayıp aşağıya yapıştır
			if (nesne_carpmama(obj_mezar_tasi_1)) { carpma = true; }//Son satırı tamamen kopyalayıp aşağıya yapıştır
			if (nesne_carpmama(obj_yatak)) { carpma = true; }//Son satırı tamamen kopyalayıp aşağıya yapıştır
			if (nesne_carpmama(obj_blok_capraz)) { carpma = true; }//Son satırı tamamen kopyalayıp aşağıya yapıştır
			if (nesne_carpmama(obj_tabure)) { carpma = true; }//Son satırı tamamen kopyalayıp aşağıya yapıştır
			if (nesne_carpmama(obj_televizyon_unitesi)) { carpma = true; }//Son satırı tamamen kopyalayıp aşağıya yapıştır
			if (nesne_carpmama(obj_masa)) { carpma = true; }//Son satırı tamamen kopyalayıp aşağıya yapıştır
			if (nesne_carpmama(obj_nene)) { carpma = true; }//Son satırı tamamen kopyalayıp aşağıya yapıştır
			if (nesne_carpmama(obj_nene_mezar)) { carpma = true; }//Son satırı tamamen kopyalayıp aşağıya yapıştır
			if (nesne_carpmama(obj_berdan_tabela)) { carpma = true; }//Son satırı tamamen kopyalayıp aşağıya yapıştır
			if (nesne_carpmama(obj_engel_duvari)) { carpma = true; }//Son satırı tamamen kopyalayıp aşağıya yapıştır
			if (nesne_carpmama(obj_berdan_iceri_1)) { carpma = true; }//Son satırı tamamen kopyalayıp aşağıya yapıştır
			if (nesne_carpmama(obj_berdan_iceri_2)) { carpma = true; }//Son satırı tamamen kopyalayıp aşağıya yapıştır
			if (nesne_carpmama(obj_lavabo)) { carpma = true; }//Son satırı tamamen kopyalayıp aşağıya yapıştır
			if (nesne_carpmama(obj_tuvalet)) { carpma = true; }//Son satırı tamamen kopyalayıp aşağıya yapıştır
			if (nesne_carpmama(obj_devrilmis_agac)) { carpma = true; }//Son satırı tamamen kopyalayıp aşağıya yapıştır
			if (nesne_carpmama(obj_tugla_yigini)) { carpma = true; }//Son satırı tamamen kopyalayıp aşağıya yapıştır
			if (nesne_carpmama(obj_hastane_serum)) { carpma = true; }//Son satırı tamamen kopyalayıp aşağıya yapıştır
			if (nesne_carpmama(obj_hastane_yatak)) { carpma = true; }//Son satırı tamamen kopyalayıp aşağıya yapıştır
			if (nesne_carpmama(obj_sera_dis)) { carpma = true; }//Son satırı tamamen kopyalayıp aşağıya yapıştır
			if (nesne_carpmama(obj_agac_1)) { carpma = true; }//Son satırı tamamen kopyalayıp aşağıya yapıştır
			if (nesne_carpmama(obj_sandalye)) { carpma = true; }//Son satırı tamamen kopyalayıp aşağıya yapıştır
			if (nesne_carpmama(obj_yatak_2)) { carpma = true; }//Son satırı tamamen kopyalayıp aşağıya yapıştır
			if (nesne_carpmama(obj_tahta_sandik)) { carpma = true; }//Son satırı tamamen kopyalayıp aşağıya yapıştır
			if (nesne_carpmama(obj_kucuk_sandik)) { carpma = true; }//Son satırı tamamen kopyalayıp aşağıya yapıştır
			if (nesne_carpmama(obj_metal_sandik)) { carpma = true; }//Son satırı tamamen kopyalayıp aşağıya yapıştır
			if (nesne_carpmama(obj_tahta_masa)) { carpma = true; }//Son satırı tamamen kopyalayıp aşağıya yapıştır
			if (nesne_carpmama(obj_tahta_bank)) { carpma = true; }//Son satırı tamamen kopyalayıp aşağıya yapıştır
			if (nesne_carpmama(obj_metal_masa)) { carpma = true; }//Son satırı tamamen kopyalayıp aşağıya yapıştır
			if (nesne_carpmama(obj_tahta_dolap)) { carpma = true; }//Son satırı tamamen kopyalayıp aşağıya yapıştır
			if (nesne_carpmama(obj_klima)) { carpma = true; }//Son satırı tamamen kopyalayıp aşağıya yapıştır
			if (nesne_carpmama(obj_tahta_sandiklar)) { carpma = true; }//Son satırı tamamen kopyalayıp aşağıya yapıştır
			if (nesne_carpmama(obj_krallik_kayalar)) { carpma = true; }//Son satırı tamamen kopyalayıp aşağıya yapıştır
			if (nesne_carpmama(obj_blok1)) { carpma = true; }//Son satırı tamamen kopyalayıp aşağıya yapıştır
			if (nesne_carpmama(obj_cit)) { carpma = true; }//Son satırı tamamen kopyalayıp aşağıya yapıştır
			if (nesne_carpmama(obj_cit_2)) { carpma = true; }//Son satırı tamamen kopyalayıp aşağıya yapıştır
			if (nesne_carpmama(obj_cit_3)) { carpma = true; }//Son satırı tamamen kopyalayıp aşağıya yapıştır
			if (nesne_carpmama(obj_ev_renklendirilmis)) { carpma = true; }//Son satırı tamamen kopyalayıp aşağıya yapıştır
			if (nesne_carpmama(obj_saglik_ocagi)) { carpma = true; }//Son satırı tamamen kopyalayıp aşağıya yapıştır
			if (nesne_carpmama(obj_eczane)) { carpma = true; }//Son satırı tamamen kopyalayıp aşağıya yapıştır
			if (nesne_carpmama(obj_park)) { carpma = true; }//Son satırı tamamen kopyalayıp aşağıya yapıştır
			if (nesne_carpmama(obj_kargo_subesi)) { carpma = true; }//Son satırı tamamen kopyalayıp aşağıya yapıştır
			if (nesne_carpmama(obj_kargo_subesi_yan)) { carpma = true; }//Son satırı tamamen kopyalayıp aşağıya yapıştır
			if (nesne_carpmama(obj_copluk)) { carpma = true; }//Son satırı tamamen kopyalayıp aşağıya yapıştır
			if (nesne_carpmama(obj_agac_1_1)) { carpma = true; }//Son satırı tamamen kopyalayıp aşağıya yapıştır
			if (nesne_carpmama(obj_bakkal)) { carpma = true; }//Son satırı tamamen kopyalayıp aşağıya yapıştır
			if (nesne_carpmama(obj_blok1)) { carpma = true; }//Son satırı tamamen kopyalayıp aşağıya yapıştır
			if (nesne_carpmama(obj_agac_1)) { carpma = true; }//Son satırı tamamen kopyalayıp aşağıya yapıştır
			if (nesne_carpmama(obj_agac_1_1)) { carpma = true; }//Son satırı tamamen kopyalayıp aşağıya yapıştır
			if (nesne_carpmama(obj_yatak_3)) { carpma = true; }//Son satırı tamamen kopyalayıp aşağıya yapıştır
			if (nesne_carpmama(obj_utu_masasi)) { carpma = true; }//Son satırı tamamen kopyalayıp aşağıya yapıştır
			if (nesne_carpmama(obj_masa_ve_puf)) { carpma = true; }//Son satırı tamamen kopyalayıp aşağıya yapıştır
			if (nesne_carpmama(obj_buzdolabi_2)) { carpma = true; }//Son satırı tamamen kopyalayıp aşağıya yapıştır
			if (nesne_carpmama(obj_kanepe)) { carpma = true; }//Son satırı tamamen kopyalayıp aşağıya yapıştır
			if (nesne_carpmama(obj_dolap_2)) { carpma = true; }//Son satırı tamamen kopyalayıp aşağıya yapıştır
			if (nesne_carpmama(obj_cekmece)) { carpma = true; }//Son satırı tamamen kopyalayıp aşağıya yapıştır

			if variable_instance_exists(id, "carpisildi") {
				caripsildi = carpma;
			}
		}
	}
}
