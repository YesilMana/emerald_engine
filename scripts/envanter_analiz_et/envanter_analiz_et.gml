/// @function envanter_analiz_et()
/// @description Envanteri sıfırlar ve global.envanter_list içindeki eşya miktarlarını toplar.
/// Not: Eşyaların kimlikleri "esya_x" formatında olmak zorunda (örneğin "esya_12").

function envanter_analiz_et() {

    // 1. ADIM: Envanteri sıfırla
    // Burada global.envanter[] dizisinin her elemanı 0'a çekiliyor.
    // Yani hiçbir eşya yokmuş gibi başlatılıyor.
	
    for (var i = 1; i <= global.envanter_son_oge; i++) {
        global.envanter[i] = 0;
    }
    
    // 2. ADIM: Envanter slotlarını tek tek kontrol et
    // global.envanter_list içinde her bir slot bir ds_map (eşya bilgisi) tutuyor.
    // Örneğin: { "esya": "esya_5", "adet": 3, "durum": 1 }
    for (var i = 0; i < ds_list_size(global.envanter_list); i++) {
        
        // Slot verilerini çek
        var slot = global.envanter_list[| i]; // listedeki i. slotu al
        var esya = slot[? "esya"];            // eşya adı/id'si
        var adet = slot[? "adet"];            // eşya adedi
        var durum = slot[? "durum"];          // slotun aktif olup olmadığı (1 = aktif, 0 = pasif/boş)
        
		//if adet < 0 slot[? "adet"] = 1;
		if adet < 0 {
			adet = 1;
			slot[? "adet"] = 1;
		}
        // 3. ADIM: Geçerli slot mu? (aktif ve eşya atanmış olmalı)
        if (durum == 1 && esya != -1 && esya != "" && adet > 0) {
            
            // Eşya adını string'e çevir
            var esya_str = string(esya);
            
            // Eşya ismi "esya_" ile başlıyorsa (örn: "esya_12")
            if (string_pos("esya_", esya_str) == 1) {

                var esya_id = real(string_delete(esya_str, 1, 5));
                if (esya_id >= 1 && esya_id <= global.envanter_son_oge) {
                    
					array_push(global.kontroli, esya_id);
                    global.envanter[esya_id] += adet;
                }
            }
        }
		
		
    }
}