function satir_sayisi(_metin) {
    var sayi = 1; // en az bir satır var
    var len  = string_length(_metin);
    for (var i = 1; i <= len; i++) {
        var ch = string_char_at(_metin, i);
        // satır ayırıcıya göre kontrol
        if (ch == "#" || ch == chr(10)) { // '#' veya '\n'
            sayi++;
        }
    }
    return sayi;
}
