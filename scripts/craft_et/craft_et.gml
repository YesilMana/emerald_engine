function craft_et(){
		if global.craft_edildi {
			
			global.craft_tetiklenme = true;
			var craft_edilen = global.craft_kontrol_id; 
			var craft_zorluk_1 = global.craft_bilgi[? "esya_" + string(global.craft_kontrol_id)];
			var craft_zorluk_2 = craft_zorluk_1[? "craft_zorluk"];
			var craft_zorluk = 60;
			if craft_zorluk_2 != undefined {
				craft_zorluk = craft_zorluk_2 * global.craft_zorluk_deger_artis;
				global.kullanilan_kalori = craft_zorluk_2;
				global.kullanilan_su = craft_zorluk_2 * (random_range(0.5, 1.5));
			}
			
			else {
				global.kullanilan_kalori = 0;
				global.kullanilan_su = 0;
			}
			
			if (global.secilmis_nesne_yapim_malzemesi_id != undefined && global.yapim_malzemesi_eksik == false) {
				var biskuvi_0 = siradakini_bul(global.yapim_secim, global.secilmis_nesne_yapim_malzemesi_id);
				if biskuvi_0 == undefined biskuvi_0 = hangi_slotta(global.secilmis_nesne_yapim_malzemesi_id);
				var biskuvi_1 = global.envanter_list[| biskuvi_0];
				var biskuvi_2 = biskuvi_1[? "saglamlik"];
				var biskuvi_3 = biskuvi_2 - global.nesne_dayaniklilik_dusus;
				biskuvi_1[? "saglamlik"] = biskuvi_3;
				if biskuvi_1[? "saglamlik"] <= 0 {
					var biskuvi_4 = global.envanter_list[| biskuvi_0];
					biskuvi_4[? "adet"] = 0;
					biskuvi_4[? "esya"] = -1;
					biskuvi_4[? "saglamlik"] = 0;
				}
			}
			craft_tetiklenme(global.craft_kontrol_id);
			alet_analizi();
			
			// Üretilecek adet belirleme
			var esya_ds_map_1 = global.craft_bilgi[? "esya_" + string(global.craft_kontrol_id)];
			var esya_ds_map_2 = esya_ds_map_1[? "uretim_adedi"];
			var uretilecek = global.uretilecek;
			if esya_ds_map_2 != undefined {
				uretilecek = esya_ds_map_2 * global.uretilecek;	
			}
			
			var kategori_1 = global.siniflandirma_esyalar[? "esya_" + string(global.craft_kontrol_id)];
			var craft_slot = bos_slotu_bul();
			if kategori_1 == undefined || kategori_1 == 0 {
				craft_slot = hangi_slotta(craft_edilen);	
			}
			var craft_konum = global.envanter_list[| craft_slot];
			
			var yeni_craft_adet = craft_konum[? "adet"] + uretilecek; //Buraya daha fazla sayı yazılabilir
			envantere_ekle(craft_edilen, uretilecek);
			for(var i = 0; i < array_length(global.craft_gerekenler_id); i++) {
				var numara = global.craft_gerekenler_id[i];
				var esya_konum = hangi_slotta(numara);
				var liste = global.envanter_list[| esya_konum];
				envanterden_azalt(numara, (global.craft_gerekenler_adet[i] * global.uretilecek));
			}
			//kalori_kullanim();
			envanter_analiz_et();
			yenile();
			global.uretilecek = 1;	
		}
}