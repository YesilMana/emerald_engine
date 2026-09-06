function hayvanlar_bellek_yukleme(hayvan_isim){
    // Ana veriyi çekiyoruz
    var hayvan_icerik = global.hayvanlar_tumu[? hayvan_isim];
    
    // Güvenlik kontrolü (Map yoksa hata vermesin)
    if (is_undefined(hayvan_icerik)) return;

    // --- 1. TEMEL BİLGİLER ---
    var harita_temel = hayvan_icerik[? "temel_bilgiler"];
    if (!is_undefined(harita_temel)) {
        variable_global_set(hayvan_isim + "_ad", harita_temel[? "ad"]);
    }

    // --- 2. SAĞLIK VE DENGE ---
    var harita_saglik = hayvan_icerik[? "saglik_durumu"];
    if (!is_undefined(harita_saglik)) { 
        variable_global_set(hayvan_isim + "_can", harita_saglik[? "can"]);
        variable_global_set(hayvan_isim + "_kalkan", harita_saglik[? "kalkan"]);
        variable_global_set(hayvan_isim + "_kacma_cani", harita_saglik[? "kacma_cani"]);
    }

    // --- 3. HAREKET FİZİĞİ ---
    var harita_hareket = hayvan_icerik[? "hareket"];
    if (!is_undefined(harita_hareket)) {
        variable_global_set(hayvan_isim + "_hiz_yurume", harita_hareket[? "hiz_yurume"]);
        variable_global_set(hayvan_isim + "_hiz_kosma", harita_hareket[? "hiz_kosma"]);
        variable_global_set(hayvan_isim + "_devriye_yaricapi", harita_hareket[? "devriye_yaricapi"]);
        variable_global_set(hayvan_isim + "_varinca_bekleme_suresi_1", harita_hareket[? "varinca_bekleme_suresi_1"]);
        variable_global_set(hayvan_isim + "_varinca_bekleme_suresi_2", harita_hareket[? "varinca_bekleme_suresi_2"]);
    }

    // --- 4. DİRENÇLER ---
    var harita_direnc = hayvan_icerik[? "direncler"];
    if (!is_undefined(harita_direnc)) {
        variable_global_set(hayvan_isim + "_direnc_kesici", harita_direnc[? "kesici"]);
        variable_global_set(hayvan_isim + "_direnc_ezici", harita_direnc[? "ezici"]);
        variable_global_set(hayvan_isim + "_direnc_ates", harita_direnc[? "ates"]);
        variable_global_set(hayvan_isim + "_direnc_zehir", harita_direnc[? "zehir"]);
    }

    // --- 5. YAPAY ZEKA ---
    var harita_ai = hayvan_icerik[? "yapay_zeka"];
    if (!is_undefined(harita_ai)) {
        variable_global_set(hayvan_isim + "_algilama_mesafesi", harita_ai[? "algilama_mesafesi"]);
        variable_global_set(hayvan_isim + "_takip_mesafesi", harita_ai[? "takip_mesafesi"]);
        variable_global_set(hayvan_isim + "_bekleme_suresi_min", harita_ai[? "bekleme_suresi_min"]);
        variable_global_set(hayvan_isim + "_bekleme_suresi_max", harita_ai[? "bekleme_suresi_max"]);
    }

    // --- 6. GÖRSEL (SPRITE) ---
    // Not: Asset ID'sini almak için asset_get_index kullanıyoruz.
    var harita_gorsel = hayvan_icerik[? "gorsel"];
    if (!is_undefined(harita_gorsel)) {

    }

    // --- 7. SALDIRI DETAYLARI (Karmaşık Yapı) ---
    var harita_saldiri = hayvan_icerik[? "saldiri"];
    if (!is_undefined(harita_saldiri)) {
        variable_global_set(hayvan_isim + "_saldirganlik", harita_saldiri[? "saldirgan"]);
        var max_saldiri = harita_saldiri[? "maksimum_saldiri"];
        variable_global_set(hayvan_isim + "_maksimum_saldiri", max_saldiri);

        // Her bir saldırı tipini döngüyle veya manuel alabiliriz. 
        // Senin yapın "hasar_1", "hasar_2" olduğu için manuel ekliyorum:
        
        for (var i = 1; i <= max_saldiri; i++) {
            var saldiri_key = "hasar_" + string(i);
            var detay_map = harita_saldiri[? saldiri_key];
            
            if (!is_undefined(detay_map)) {
                // Örn: global.kucuk_yengec_hasar_1_miktar
                var prefix = hayvan_isim + "_" + saldiri_key + "_";
                
                variable_global_set(prefix + "miktar", detay_map[? "miktar"]);
                variable_global_set(prefix + "tip", detay_map[? "tip"]); // string olarak ("kesici")
                variable_global_set(prefix + "menzil", detay_map[? "menzil"]);
            }
        }
    }

    // --- 8. GANİMET (Loot) ---
    // Ganimet bir liste olduğu için, global değişkene listenin ID'sini atıyoruz.
    // Daha sonra ds_list_find_value ile içini okuyabilirsin.
    var liste_ganimet = hayvan_icerik[? "ganimet"];
    if (!is_undefined(liste_ganimet)) {
        // Liste ID'sini kaydet: global.kucuk_yengec_ganimet_listesi
        variable_global_set(hayvan_isim + "_ganimet_listesi", liste_ganimet);
    }
}