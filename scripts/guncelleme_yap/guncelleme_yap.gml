function guncelleme_yap(){
    var _oyuncunun_surumu = 0;
    if (ds_map_exists(global.envanter_json_1, "save_surum")) {
        _oyuncunun_surumu = global.envanter_json_1[? "save_surum"];
    }
    if (_oyuncunun_surumu < 2) {
       //json_guncelleme_ekle("v1_sandik_guncelleme.json", global.sandiklar_tumu);
	   //json_guncelleme_sil("v1_esya_silme.json", global.envanter_json_1);
    }
	
	if (_oyuncunun_surumu < 3) {
        //json_guncelleme_ekle("guncelleme_v2.json", "esya_konumlari");
    }

    global.envanter_json_1[? "save_surum"] = 1;
}

function json_guncelleme_ekle(json_dosya_adi, hedef_global) {
    if (file_exists(json_dosya_adi)) {
        
        // 0. Güvenlik
        if (!ds_exists(hedef_global, ds_type_map)) return;

        // 1. Dosyayı Oku
        var _file = file_text_open_read(json_dosya_adi);
        var _str = "";
        while (!file_text_eof(_file)) _str += file_text_readln(_file);
        file_text_close(_file);
        
        var _yama_ana_map = json_decode(_str);
        // 2. JSON'daki EN TEPE anahtarları gezmeye başla (Örn: "3", "5", "esya_konumlari"...)
        var _root_key = ds_map_find_first(_yama_ana_map);
        
        while (!is_undefined(_root_key)) {
            var _yama_verisi = _yama_ana_map[? _root_key];
            
            // --- ANAHTAR EŞLEŞTİRME (String "3" -> Real 3) ---
            var _oyuncu_icerik = undefined;
            var _hedef_anahtar = _root_key;

            // A) Direkt String olarak ara
            if (ds_map_exists(hedef_global, _hedef_anahtar)) {
                _oyuncu_icerik = hedef_global[? _hedef_anahtar];
            }
            // B) Bulamazsan ve sayıysa, Sayı olarak ara
            else if (string_digits(_hedef_anahtar) == _hedef_anahtar) {
                var _sayisal_anahtar = real(_hedef_anahtar);
                if (ds_map_exists(hedef_global, _sayisal_anahtar)) {
                    _oyuncu_icerik = hedef_global[? _sayisal_anahtar];
                    _hedef_anahtar = _sayisal_anahtar; 
                }
            }
            
            // C) Hala yoksa oluştur (Oyuncuya yeni özellik ekleniyor)
            // (Eğer içerik bir map/list ise ona göre oluşturacağız, şimdilik map varsayalım)
            if (is_undefined(_oyuncu_icerik)) {
                if (ds_exists(_yama_verisi, ds_type_map)) {
                    _oyuncu_icerik = ds_map_create();
                    ds_map_add_map(hedef_global, _hedef_anahtar, _oyuncu_icerik);
                }
            }

            // --- İÇERİĞİ GÜNCELLEME (Detaylara İn) ---
            // Eğer anahtarın içi bir MAP ise (örn: sandık detayları)
            if (ds_exists(_yama_verisi, ds_type_map) && ds_exists(_oyuncu_icerik, ds_type_map)) {
                
                var _alt_key = ds_map_find_first(_yama_verisi);
                while (!is_undefined(_alt_key)) {
                    var _alt_veri = _yama_verisi[? _alt_key];
                    
                    // DURUM A: LİSTE EKLEME (icerik: [...])
                    if (ds_exists(_alt_veri, ds_type_list)) {
                        if (!ds_map_exists(_oyuncu_icerik, _alt_key)) {
                            ds_map_add_list(_oyuncu_icerik, _alt_key, ds_list_create());
                        }
                        var _oyuncu_liste = _oyuncu_icerik[? _alt_key];
                        // Listeyi kopyala
                        for (var i = 0; i < ds_list_size(_alt_veri); i++) {
                            var _k = _alt_veri[| i];
                            if (ds_exists(_k, ds_type_map)) {
                                var _kopya = ds_map_create();
                                ds_map_copy(_kopya, _k);
                                ds_list_add(_oyuncu_liste, _kopya);
                                ds_list_mark_as_map(_oyuncu_liste, ds_list_size(_oyuncu_liste)-1);
                            }
                        }
                    }
                    else {
                        if (!ds_map_exists(_oyuncu_icerik, _alt_key)) {
                             if (ds_exists(_alt_veri, ds_type_map)) {
                                 var _yeni_map = ds_map_create();
                                 ds_map_copy(_yeni_map, _alt_veri);
                                 ds_map_add_map(_oyuncu_icerik, _alt_key, _yeni_map);
                             } else {
                                 _oyuncu_icerik[? _alt_key] = _alt_veri;
                             }
                        }
                    }
                    _alt_key = ds_map_find_next(_yama_verisi, _alt_key);
                }
            }
            _root_key = ds_map_find_next(_yama_ana_map, _root_key);
        }
        ds_map_destroy(_yama_ana_map);
    }
}

function json_guncelleme_sil(json_dosya_adi, hedef_global) {
    if (file_exists(json_dosya_adi)) {
        
        if (!ds_exists(hedef_global, ds_type_map)) return;

        var _file = file_text_open_read(json_dosya_adi);
        var _str = "";
        while (!file_text_eof(_file)) _str += file_text_readln(_file);
        file_text_close(_file);
        
        var _yama_ana_map = json_decode(_str);
        
        // Kökten tarama
        var _root_key = ds_map_find_first(_yama_ana_map);
        
        while (!is_undefined(_root_key)) {
            var _yama_verisi = _yama_ana_map[? _root_key];
            
            // Anahtar Eşleştirme (String/Real)
            var _oyuncu_icerik = undefined;
            
            if (ds_map_exists(hedef_global, _root_key)) {
                _oyuncu_icerik = hedef_global[? _root_key];
            } else if (string_digits(_root_key) == _root_key) {
                var _sayisal = real(_root_key);
                if (ds_map_exists(hedef_global, _sayisal)) {
                    _oyuncu_icerik = hedef_global[? _sayisal];
                }
            }
            
            // Eğer silinecek ana hedef bulunduysa
            if (!is_undefined(_oyuncu_icerik)) {
                
                // DURUM 1: JSON'da karşılığı boş veya düz değerse -> KOMPLE SİL
                // Örn: "hava_gorunum": 1
                if (!ds_exists(_yama_verisi, ds_type_map) && !ds_exists(_yama_verisi, ds_type_list)) {
                     // Eğer silinen şey bir Map ise hafızadan da temizle
                    if (ds_exists(_oyuncu_icerik, ds_type_map)) ds_map_destroy(_oyuncu_icerik);
                    
                    // Anahtarı sil (String veya Real olmasına dikkat ederek)
                    if (ds_map_exists(hedef_global, _root_key)) ds_map_delete(hedef_global, _root_key);
                    else ds_map_delete(hedef_global, real(_root_key));
                }
                
                // DURUM 2: İçine girip spesifik silme
                else if (ds_exists(_yama_verisi, ds_type_map)) {
                    var _alt_key = ds_map_find_first(_yama_verisi);
                    while (!is_undefined(_alt_key)) {
                        var _alt_veri = _yama_verisi[? _alt_key];
                        
                        // LİSTE İÇİNDEN SİLME
                        if (ds_exists(_alt_veri, ds_type_list) && ds_map_exists(_oyuncu_icerik, _alt_key)) {
                            var _oyuncu_liste = _oyuncu_icerik[? _alt_key];
                            // Cımbızla Silme Döngüsü
                            for (var i=0; i<ds_list_size(_alt_veri); i++) {
                                var _kriter = _alt_veri[| i];
                                for (var k=ds_list_size(_oyuncu_liste)-1; k>=0; k--) {
                                    var _obj = _oyuncu_liste[| k];
                                    var _eslesiyor = true;
                                    // Kriter kontrolü...
                                    var _kk = ds_map_find_first(_kriter);
                                    while(!is_undefined(_kk)){
                                        if(!ds_map_exists(_obj, _kk) || _obj[? _kk] != _kriter[? _kk]) {
                                            _eslesiyor = false; break;
                                        }
                                        _kk = ds_map_find_next(_kriter, _kk);
                                    }
                                    if (_eslesiyor) {
                                        ds_map_destroy(_obj);
                                        ds_list_delete(_oyuncu_liste, k);
                                    }
                                }
                            }
                        }
                        // BASİT ANAHTAR SİLME
                        else {
                            if (ds_map_exists(_oyuncu_icerik, _alt_key)) ds_map_delete(_oyuncu_icerik, _alt_key);
                        }
                        
                        _alt_key = ds_map_find_next(_yama_verisi, _alt_key);
                    }
                }
            }
            
            _root_key = ds_map_find_next(_yama_ana_map, _root_key);
        }
        ds_map_destroy(_yama_ana_map);
    }
}