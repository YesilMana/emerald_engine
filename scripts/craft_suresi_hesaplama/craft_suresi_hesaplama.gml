/// @description Craft edilirken kullanılacak olan ekipman ile ilgili kritik bilgileri hesaplar
function craft_suresi_hesaplama() {
    
    var craft_bilgi = global.craft_bilgi[? "esya_" + string(global.craft_kontrol_id)];
    var craft_zorluk = craft_bilgi != undefined ? craft_bilgi[? "craft_zorluk"] : undefined;
    
    if (craft_zorluk != undefined) {
        global.nesne_dayaniklilik_dusus = (craft_zorluk * 2) * global.uretilecek;
        if oda_hizli global.craft_suresi = craft_zorluk * 30;
        if oda_yavas global.craft_suresi = craft_zorluk * 15;
    } else {
        global.nesne_dayaniklilik_dusus = 10;
        if oda_hizli global.craft_suresi = 120;
        if oda_yavas global.craft_suresi = 60;
    }
    
    var ekipman_slot = siradakini_bul(global.yapim_secim, global.secilmis_nesne_yapim_malzemesi_id);
    
    if (ekipman_slot == undefined) {
        ekipman_slot = hangi_slotta(global.secilmis_nesne_yapim_malzemesi_id);
    }
    
	if ekipman_slot != 999 {
	    var ekipman_bilgi = global.envanter_list[| ekipman_slot];
		if ekipman_bilgi[? "saglamlik"] != undefined {
			global.nesne_dayaniklilik_deger = ekipman_bilgi[? "saglamlik"];
		}
	}
	
	else {
		global.nesne_dayaniklilik_deger = 100;
	}
	
    
    if (global.secilmis_nesne_yapim_malzemesi_id != undefined 
        && global.yapim_malzemesi_eksik == false 
        && craft_zorluk != undefined) {
        
        if (global.nesne_dayaniklilik_deger - (craft_zorluk * 2) < global.nesne_dayaniklilik_dusus) {
            global.nesne_dayaniklilik_asiyor = true;
        } else {
            global.nesne_dayaniklilik_asiyor = false;
        }
        
        if (global.nesne_dayaniklilik_deger < global.nesne_dayaniklilik_dusus) {
            global.craft_tusu_baslama_dayaniklilik = true;
        } else {
            global.craft_tusu_baslama_dayaniklilik = false;
        }
    } else {
        global.craft_tusu_baslama_dayaniklilik = false;
        global.nesne_dayaniklilik_asiyor = false;
    }
}