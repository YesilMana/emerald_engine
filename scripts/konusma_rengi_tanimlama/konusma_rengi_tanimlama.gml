function konusma_rengi_tanimlama(diyenler){
	global.anlik_konusan_kisi = isim_obje_eslestirme(diyenler);
	if global.anlik_konusan_kisi == noone global.anlik_konusan_kisi = global.cikolata;
	
    switch (diyenler) {
        // Açık Kırmızı (Pelin & İç Ses)
        case "Pelin":
        case "İç Ses":
            global.konusma_rengi = hex_to_color("FF6B6B");
            global.konusan_kisi_sayisi = 6;
            break;

        // Açık Mavi
        case "Eymen":
            global.konusma_rengi = hex_to_color("70D6FF");
            global.konusan_kisi_sayisi = 1;
            break;

        // Hafif Koyu Mor
        case "Helda":
            global.konusma_rengi = hex_to_color("B388EB");
            global.konusan_kisi_sayisi = 4;
            break;

        // Parlak Kırmızı
        case "Halil Bakkal":
        case "Halil bakkal":
            global.konusma_rengi = hex_to_color("FF3333");
            global.konusan_kisi_sayisi = 2;
            break;

        // Koyu Kırmızı
        case "Vince":
        case "vince":
            global.konusma_rengi = hex_to_color("D62246");
            global.konusan_kisi_sayisi = 2;
            break;

        // Askeri Yeşili
        case "Asker":
        case "asker":
            global.konusma_rengi = hex_to_color("8DA15D");
            global.konusan_kisi_sayisi = 5;
            break;

        // Mavi
        case "Ozan":
        case "ozan":
            global.konusma_rengi = hex_to_color("3A86FF");
            global.konusan_kisi_sayisi = 3;
            break;

        // --- JSON İÇERİĞİNDEN ÇIKARILAN KARAKTERLER ---

        // Ares Kargo Temsilcisi (Şirket turuncusu)
        case "Ares Kargo Temsilcisi":
            global.konusma_rengi = hex_to_color("FFA200");
            global.konusan_kisi_sayisi = 5;
            break;

        // Telsiz (Dijital yeşil)
        case "Telsiz":
            global.konusma_rengi = hex_to_color("57E389");
            global.konusan_kisi_sayisi = 5;
            break;

        // Ali Deniz (Açık turkuaz)
        case "Ali Deniz":
            global.konusma_rengi = hex_to_color("48CAE4");
            global.konusan_kisi_sayisi = 3;
            break;

        // İlhan (Sarımtırak kehribar)
        case "İlhan":
            global.konusma_rengi = hex_to_color("F4D06F");
            global.konusan_kisi_sayisi = 3;
            break;

        // Esma (Yumuşak pembe)
        case "Esma":
            global.konusma_rengi = hex_to_color("FF99C8");
            global.konusan_kisi_sayisi = 6;
            break;

        // Hamza (Sıcak karamel)
        case "Hamza":
            global.konusma_rengi = hex_to_color("E09F3E");
            global.konusan_kisi_sayisi = 3;
            break;

        // Bilal (Çelik mavisi / gri)
        case "Bilal":
            global.konusma_rengi = hex_to_color("90A4AE");
            global.konusan_kisi_sayisi = 2;
            break;

        // Bilinmeyen / Gizemli Konuşmacı (Buz grisi)
        case "...":
            global.konusma_rengi = hex_to_color("CFD8DC");
            global.konusan_kisi_sayisi = 1;
            break;

        default:
            global.konusma_rengi = hex_to_color("B3B3B3");
            global.konusan_kisi_sayisi = 1;
            break;
    }
}