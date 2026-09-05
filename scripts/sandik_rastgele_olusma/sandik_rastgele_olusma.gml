function sandik_rastgele_olusma(){
    // 1. Sandık Ana Verisine Ulaş
    var sandik_map = global.sandiklar_tumu[? string(global.en_yakin_sandik.sandik_no)];
    var kapasite = sandik_map[? "kapasite"];
    if sandik_map[? "olustu"] == 0 {
	    if (ds_map_exists(sandik_map, "icerik")) {
	        ds_list_destroy(sandik_map[? "icerik"]); 
	    }

	    var yeni_icerik_listesi = ds_list_create();
    
	    for (var i = 0; i <= kapasite; i++) { 
	        var bos_slot_map = ds_map_create();
	        ds_map_add(bos_slot_map, "esya", -1);
	        ds_map_add(bos_slot_map, "durum", 1);
	        ds_map_add(bos_slot_map, "adet", 0);
        
	        ds_list_add(yeni_icerik_listesi, bos_slot_map);

	        ds_list_mark_as_map(yeni_icerik_listesi, i);
	    }
    
	    ds_map_add_list(sandik_map, "icerik", yeni_icerik_listesi);
    
	    var rastgele_esya_havuzu = sandik_map[? "rastgele"]; 
		sandik_map[? "olustu"] = 1;
		if is_undefined(rastgele_esya_havuzu){
			exit;
		}
    
	    for (var i = 0; i < ds_list_size(rastgele_esya_havuzu); i++) {
        
	        var esya_data = rastgele_esya_havuzu[| i]; 
	        var ihtimal = esya_data[? "ihtimal"];
	        var rastgele_sayi = irandom(100);
        
	        if (ihtimal < rastgele_sayi) {
	            continue;    
	        }
        
	        var olusacak_esya_isim = esya_data[? "esya"];
	        var olusacak_sayi = irandom_range(esya_data[? "adet_1"], esya_data[? "adet_2"]);
        
	        var bulunan_slot_map = undefined; 
        
	        for (var h = 0; h < kapasite; h++) {
            
	            var denenen_slot_index = irandom_range(1, kapasite); 
            
	            var hedef_slot_map = yeni_icerik_listesi[| denenen_slot_index];
            
	            if (hedef_slot_map[? "esya"] == -1) {
	                bulunan_slot_map = hedef_slot_map; 
	                break; 
	            }
	        }
        
	        if (is_undefined(bulunan_slot_map)) {
	            continue;
	        }
        
	        bulunan_slot_map[? "esya"] = olusacak_esya_isim;
	        bulunan_slot_map[? "adet"] = olusacak_sayi;
	        bulunan_slot_map[? "saglamlik"] = 100;
	    }
	}
	
}