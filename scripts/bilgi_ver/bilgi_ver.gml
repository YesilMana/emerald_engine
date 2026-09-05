function bilgi_ver(giris, gorunurluk = 2, ses = true) { 
    var stringim = ""; 

    // --- 1. ADIM: Tür Kontrolü (Senin yazdığın kısım, çok güzel ve güvenli) ---
    if (is_string(giris)) {
        stringim = giris;
    } 
    else if (is_real(giris)) {
        if (giris < array_length(global.genel_yazilar)) {
            stringim = global.genel_yazilar[giris];
        } else {
            show_debug_message("Hata: Gecersiz index");
            return; // Hatalıysa çık
        }
    }

    // --- 2. ADIM: Listede var mı kontrolü (YENİ SİSTEM) ---
    // Artık listede diziler (array) olduğu için, her elemanın 0. indeksini (metni) kontrol ediyoruz.
    var bulma = -1;
    var liste_boyutu = ds_list_size(global.bilgiler);
    
    for (var i = 0; i < liste_boyutu; i++) {
        var eleman = global.bilgiler[| i]; // Listedeki diziyi al
        if (eleman[0] == stringim) {       // Dizinin içindeki metin, aradığımız metin mi?
            bulma = i;                     // Bulduysak indeksini kaydet
            break;                         // Aramayı sonlandır
        }
    }
    
    // --- 3. ADIM: Yoksa listeye ekle (YENİ SİSTEM) ---
    if (bulma == -1) {
        
        // YENİLİK: Artık bir Dizi ekliyoruz. 
        // 300 değeri, yazının ekranın dışından ne kadar sağdan başlayacağını belirler.
        var baslangic_kaymasi = 300; 
		
        ds_list_add(global.bilgiler, [stringim, baslangic_kaymasi]); 
        
        // Ses çalma mantığı (global.bilgiler_tumu listesi düz metin tuttuğu için aynen kalıyor)
        if (ses && ds_list_find_index(global.bilgiler_tumu, stringim) == -1) {
            audio_play_sound(global.sfx_bildirim, 1, false);
            audio_sound_gain(global.sfx_bildirim, global.muzik_seviyesi / 7);
        }
        ds_list_add(global.bilgiler_tumu, stringim);
    }

    // --- 4. ADIM: Görünürlüğü ayarla ---
    global.bilgi_gorunurluk = gorunurluk;
}
