function chatterbox_obje_create() {
    chatterbox_sistemi_baslat();
    chatterbox_degiskenleri_tanimla();
}

function chatterbox_obje_step() {
    if (!global.kontrol_menusu_acik || global.sekme != 1) exit;
    if (ChatterboxIsStopped(global.chatterbox_dosyasi)) exit;
    
    konusma_degisimi_algilama();
    chatterbox_satir_atlama();
    metin_tane_tane_yazma();
}

function chatterbox_obje_draw_gui() {
    if (!global.kontrol_menusu_acik || global.sekme != 1) exit;
    draw_set_color(c_white);

    // 1. Metni geçmiş ve güncel satır olarak ikiye ayır
    var _satirlar = chatterbox_satirlari_ayir();
    
    // 2. Yeni satıra geçildiyse daktilo efektini ve kaydırmayı sıfırla
    chatterbox_daktilo_guncelle(_satirlar.guncel);
    
    // 3. Efekt etiketleri eklenmiş son Scribble stringini oluştur
    var _renkli_metin = chatterbox_renkli_metin_olustur(_satirlar);
    
    // 4. Taşan kısımları hesapla, kaydırma yap ve ekrana çizdir
    chatterbox_metni_ekrana_cizdir(_renkli_metin);
}

// --- CREATE İÇİN YARDIMCI FONKSİYONLAR ---

function chatterbox_sistemi_baslat() {
    global.chatterbox_dosyalar = {};
    global.aktif_dosya_ismi = "main";

    var _klasor = "tabula_2/";
    var _dosya = file_find_first(_klasor + "*.yarn", fa_none);
    
    while (_dosya != "") {
        var _tam_yol = _klasor + _dosya;
        var _anahtar = string_replace(_dosya, ".yarn", "");
        
        ChatterboxLoadFromFile(_tam_yol);
        global.chatterbox_dosyalar[$ _anahtar] = ChatterboxCreate(_tam_yol);
        _dosya = file_find_next();
    }
    file_find_close();
    
    global.chatterbox_dosyasi = global.chatterbox_dosyalar[$ "main"];
    ChatterboxJump(global.chatterbox_dosyasi, "Start");
}

function chatterbox_degiskenleri_tanimla() {
    draw_set_font(fnt_iovan);
    scribble_font_set_default("fnt_iovan");
    global.chatterbox_verileri = new chatterbox_verileri();

    if (!variable_instance_exists(id, "son_metin")) {
        son_metin = "";
    }

    metin_hedef_kaydirma = 0;
    metin_gercek_kaydirma = 0;
    metin_kaydirma_yumusatma = 0.2;
    metin_kaydirma_hizi = 40;

    chatterbox_onceki_son_kisim = "";
    chatterbox_ayristirma = chatterbox_metni_ayristir("");
    chatterbox_gosterilen_karakter = 0;
    chatterbox_karakter_hizi = 0.9;
    chatterbox_duraklatildi = false;
    chatterbox_sonraki_pause_index = 0;
}


// --- DRAW GUI İÇİN YARDIMCI FONKSİYONLAR ---

function chatterbox_satirlari_ayir() {
    var _tum_metin = global.chatterbox_verileri.tum_string;
    var _son_satir_baslangici = string_last_pos("\n", _tum_metin);
    var _kesme_noktasi = 0;
    
    if (_son_satir_baslangici > 0) {
        _kesme_noktasi = string_last_pos_ext("\n", _tum_metin, _son_satir_baslangici - 1);
    }
    
    var _gecmis_metin = "";
    var _guncel_satir = "";
    
    if (_kesme_noktasi > 0) {
        _gecmis_metin = string_copy(_tum_metin, 1, _kesme_noktasi);
        _guncel_satir = string_copy(_tum_metin, _kesme_noktasi + 1, string_length(_tum_metin) - _kesme_noktasi);
    } else {
        _guncel_satir = _tum_metin;
    }
    
    // Verileri diğer fonksiyonların kullanabilmesi için struct olarak döndürüyoruz
    return {
        gecmis: _gecmis_metin,
        guncel: _guncel_satir,
        kesme_noktasi: _kesme_noktasi
    };
}

function chatterbox_daktilo_guncelle(_guncel_satir_ham) {
    if (_guncel_satir_ham != chatterbox_onceki_son_kisim) {
        chatterbox_onceki_son_kisim = _guncel_satir_ham;
        chatterbox_ayristirma = chatterbox_metni_ayristir(_guncel_satir_ham);
        
        chatterbox_gosterilen_karakter = 0;
        chatterbox_duraklatildi = false;
        chatterbox_sonraki_pause_index = 0;
        metin_hedef_kaydirma = 0;
    }
}

function chatterbox_renkli_metin_olustur(_satirlar) {
    var _gosterilen_index = floor(chatterbox_gosterilen_karakter);
    var _kesme_konumu = chatterbox_ayristirma.karakter_konumlari[_gosterilen_index];
    var _tam_temiz_metin = chatterbox_ayristirma.temiz_metin;

    var _gorunen_kisim = string_copy(_tam_temiz_metin, 1, _kesme_konumu);
    var _gizli_kisim = string_copy(_tam_temiz_metin, _kesme_konumu + 1, string_length(_tam_temiz_metin) - _kesme_konumu);

    var _gecmis_opakligi = "0.4";
    var _renkli_metin;
    
    if (_satirlar.kesme_noktasi > 0) {
        _renkli_metin = "[alpha," + _gecmis_opakligi + "]" + _satirlar.gecmis + "[/alpha]"
                      + "[shake]" + _gorunen_kisim + "[/shake]"
                      + "[alpha,0]" + _gizli_kisim + "[/alpha]";
    } else {
        _renkli_metin = "[shake]" + _gorunen_kisim + "[/shake]"
                      + "[alpha,0]" + _gizli_kisim + "[/alpha]";
    }
    
    return _renkli_metin;
}

function chatterbox_metni_ekrana_cizdir(_renkli_metin) {
    var _panel_sol = global.konum_x_sohbet_bas;
    var _panel_sag = global.konum_x_sohbet_son;
    var _sag_panel_genislik = (_panel_sag - _panel_sol) - 20;

    var _cizim_objesi = scribble(_renkli_metin)
        .starting_format("fnt_iovan", c_black)
        .wrap(_sag_panel_genislik)
        .line_height(45, 60)
        .align(fa_left, fa_top);

    var _gercek_yukseklik = _cizim_objesi.get_height();
    var _baslangic_y = global.kontrol_menusu_sabit_y + (global.kareler_kenar_bosluklari * 4);
    var _secenekler_y_siniri = display_get_gui_height() - global.secenekler_kismi_aciklik;
    var _max_izin_verilen_yukseklik = _secenekler_y_siniri - _baslangic_y - global.kareler_kenar_bosluklari;

    // Taşma ve yumuşak kaydırma hesaplamaları
    var _tasma_miktari = 0;
    if (_gercek_yukseklik > _max_izin_verilen_yukseklik) {
        _tasma_miktari = _gercek_yukseklik - _max_izin_verilen_yukseklik;
    }

    metin_hedef_kaydirma = clamp(metin_hedef_kaydirma, 0, _tasma_miktari);
    metin_gercek_kaydirma = lerp(metin_gercek_kaydirma, metin_hedef_kaydirma, metin_kaydirma_yumusatma);
    var _y_pozisyon = _baslangic_y - _tasma_miktari + metin_gercek_kaydirma;

    var _panel_ust = _baslangic_y;
    var _panel_alt = display_get_gui_height() - global.secenekler_kismi_aciklik;

    // Görünür alanı kısıtla (Scissor)
    gui_scissor_ayarla(
        _panel_sol, 
        _panel_ust, 
        _panel_sag - _panel_sol, 
        _panel_alt - _panel_ust
    );

    // Çizim işlemi
    _cizim_objesi.draw(_panel_sol + 10, _y_pozisyon);

    // Kısıtlamayı kaldır
    gpu_set_scissor(0, 0, display_get_gui_width(), display_get_gui_height());
}