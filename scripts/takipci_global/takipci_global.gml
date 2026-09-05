function takipci_global(){
	//Oyunun başında tanımlanan globaller kısmına konulacak.
	global.takip_eden_sprite = global.sati_animasyon; 
	global.takip_basladi = true;
	global.takipci_sayisi = 1;
	global.takipci_uzakliklari = 30;
	global.takipci_yer_degistirme_hizi = global.cikolata_hareket_hizi;
	global.gidecek_1_x = 0;
	global.gidecek_2_x = 0;
	global.gidecek_3_x = 0;
	global.gidecek_4_x = 0;
	global.gidecek_5_x = 0;
	global.gidecek_6_x = 0;
	global.gidecek_7_x = 0;
	global.gidecek_8_x = 0;
	global.gidecek_9_x = 0;
	global.gidecek_10_x = 0;
	global.gidecek_11_x = 0;
	global.gidecek_12_x = 0;
	global.gidecek_13_x = 0;
	global.gidecek_14_x = 0;
	global.gidecek_15_x = 0;
	global.gidecek_16_x = 0;
	global.gidecek_17_x = 0;
	global.gidecek_18_x = 0;
	global.gidecek_19_x = 0;
	global.gidecek_20_x = 0;

	global.gidecek_1_y = 0;
	global.gidecek_2_y = 0;
	global.gidecek_3_y = 0;
	global.gidecek_4_y = 0;
	global.gidecek_5_y = 0;
	global.gidecek_6_y = 0;
	global.gidecek_7_y = 0;
	global.gidecek_8_y = 0;
	global.gidecek_9_y = 0;
	global.gidecek_10_y = 0;
	global.gidecek_11_y = 0;
	global.gidecek_12_y = 0;
	global.gidecek_13_y = 0;
	global.gidecek_14_y = 0;
	global.gidecek_15_y = 0;
	global.gidecek_16_y = 0;
	global.gidecek_17_y = 0;
	global.gidecek_18_y = 0;
	global.gidecek_19_y = 0;
	global.gidecek_20_y = 0;
	global.sira = [];
	for (var i = 1; i <= 20; i++) {
		global.sira[i] = 0;	
	}
	global.helda_takip = false;
	global.eymen_takip = false;
	global.halil_takip = false;
	global.ozan_takip = false;
	global.sati_takip = false;
	global.hamza_takip = false;
	global.vince_takip = false;
	global.bilal_takip = false;
	
	
	global.tum_npc = [];
	global.tum_npc[0] = obj_npc_sati;
	global.tum_npc[1] = obj_npc_helda;
	global.tum_npc[2] = obj_npc_eymen;
	global.tum_npc[3] = obj_npc_halil;
	
	
}