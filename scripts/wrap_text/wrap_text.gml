function wrap_text(_text, _maxd) {
    var max_genislik = 20;
    var _max;
    
    if (_maxd != undefined) {
        _max = _maxd;
    } else {
        _max = max_genislik;
    }

    var yazi = string(_text);
    var len = string_length(yazi);
    
    var current_line_len = 0; // O anki satırın uzunluğu
    var last_space = -1;      // En son gördüğümüz boşluğun indeksi

    // 1'den başlayarak harf harf tarıyoruz
    for (var i = 1; i <= len; i++) {
        var char = string_char_at(yazi, i);

        // 1. Eğer zaten bir alt satır karakteri varsa (\n), sayacı sıfırla!
        // Bu senin yaşadığın sorunu çözen kısımdır.
        if (char == "\n") {
            current_line_len = 0;
            last_space = -1;
            continue;
        }

        // Sayacı artır
        current_line_len++;

        // Boşluk gördüysek konumunu kaydet (Geri dönüp bölmek gerekirse diye)
        if (char == " ") {
            last_space = i;
        }

        // 2. Maksimum genişliği geçtik mi?
        if (current_line_len > _max) {
            if (last_space != -1) {
                // En son gördüğümüz boşluğu silip yerine \n koyuyoruz
                yazi = string_delete(yazi, last_space, 1);
                yazi = string_insert("\n", yazi, last_space);
                
                // Sayacı güncelle: 
                // Şu anki konum (i) ile son boşluk arasındaki fark yeni satırın başlangıcı olur.
                current_line_len = i - last_space;
                last_space = -1; // Boşluğu harcadık, sıfırla
            } else {
                // Eğer hiç boşluk yoksa (çok uzun bir kelimeyse) yapacak bir şey yok,
                // ya kelimeyi ortadan böleriz ya da taşmasına izin veririz.
                // Okunabilirlik için taşmasına izin vermek genelde daha iyidir.
            }
        }
    }

    return yazi;
}