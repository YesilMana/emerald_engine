function kullanilan_kalori(){
	var craft_zorluk_1 = global.craft_bilgi[? "esya_" + string(global.craft_kontrol_id)];
	var craft_zorluk_2 = craft_zorluk_1[? "craft_zorluk"];
	var craft_zorluk = 60;
	if craft_zorluk_2 != undefined {
		craft_zorluk = craft_zorluk_2 * global.craft_zorluk_deger_artis;
		global.kullanilan_kalori = craft_zorluk_2;
	}
		
	else {
		global.kullanilan_kalori = 0;
	}
}