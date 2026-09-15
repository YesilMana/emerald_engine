function chatterbox_verileri() constructor {
    aktif_dosya = "main";
    aktif_node = "Start";
	tum_string = "";
	secenek_yukseklik = {};
	son_secenek_anlik = 0;
	son_secenek_tum = 0;
	
	oyuncu_statlari = {
		sabir: 0,
		empati: 0,
		otorite: 0,
		sefkat: 0
	}
	
	cocuk_statlari = {
		ozguven: 0,
		isyan: 0,
		sevgi: 0,
		guven: 0
	}
	
	for (var i = 0; i < 1000; i++) {
		self[$ "hk_" + string(i)] = 0;
	}
	
	cocuk_stat_ekle = function(stat_ismi, eklenecek) {
		self.cocuk_statlari[$ stat_ismi] = real(self.cocuk_statlari[$ stat_ismi]) + eklenecek;
	}
	oyuncu_stat_ekle = function(stat_ismi, eklenecek) {
		self.oyuncu_statlari[$ stat_ismi] = real(self.oyuncu_statlari[$ stat_ismi]) + eklenecek;
	}

	cocuk_stat_cek = function(stat_ismi) {
		return self.cocuk_statlari[$ stat_ismi];
	}
	
	oyuncu_stat_cek = function(stat_ismi) {
		return self.oyuncu_statlari[$ stat_ismi];
	}

    veri_ekle = function(_veri_anahtari, _deger) {
        self[$ _veri_anahtari] = _deger;
    };
	
	veri_duzen = function(_veri_anahtari, eklenecek) {
	    if (variable_struct_exists(self, _veri_anahtari) && !is_undefined(veri_oku(_veri_anahtari))) {
	        self[$ _veri_anahtari] = veri_oku(_veri_anahtari) + eklenecek;
	    } 
	    else {
	        self[$ _veri_anahtari] = eklenecek;
	    }
	}

    veri_oku = function(_veri_anahtari) {
        if (variable_struct_exists(self, _veri_anahtari)) {
            return self[$ _veri_anahtari];
        }
        return undefined;
    };
	
	tum_stringe_ekle = function(eklenecek_string) {
		if (is_undefined(eklenecek_string)) return;
	    tum_string += eklenecek_string + "\n";    
	    var _max_karakter = 1500; 
	    var _uzunluk = string_length(tum_string);

	    if (_uzunluk > _max_karakter) {
	        var _baslangic = _uzunluk - _max_karakter + 1;
        
	        tum_string = string_copy(tum_string, _baslangic, _max_karakter);
        
	        var _ilkin_konumu = string_pos("\n", tum_string);
	        if (_ilkin_konumu > 0) {
	            tum_string = string_copy(tum_string, _ilkin_konumu + 1, string_length(tum_string) - _ilkin_konumu);
	        }
	    }
	}

    kaydet = function(_slot, _mevcut_chatterbox = global.chatterbox_dosyasi) {
        var _kaydedilecek_paket = {};

        var _tum_anahtarlar = struct_get_names(self);
        var _sayi = array_length(_tum_anahtarlar);

        for (var i = 0; i < _sayi; i++) {
            var _k = _tum_anahtarlar[i];
            var _v = self[$ _k];
            if (!is_method(_v)) {
                _kaydedilecek_paket[$ _k] = _v;
            }
        }
        if (_mevcut_chatterbox != undefined) {
            _kaydedilecek_paket.aktif_node = ChatterboxGetCurrent(_mevcut_chatterbox);
			_kaydedilecek_paket.aktif_dosya = global.aktif_dosya_ismi;
            aktif_node = _kaydedilecek_paket.aktif_node;
        } else {
			_kaydedilecek_paket.aktif_dosya = global.aktif_dosya_ismi;
            _kaydedilecek_paket.aktif_node = aktif_node;
        }

        var _dosya_adi = "kayit" + string(_slot) + ".json";
        var _dosya = file_text_open_write(_dosya_adi);
        file_text_write_string(_dosya, json_stringify(_kaydedilecek_paket));
        file_text_close(_dosya);

        show_debug_message("Tüm dinamik verilerle birlikte kaydedildi");
    };

    yukle = function(_slot) {
        var _dosya_adi = "kayit" + string(_slot) + ".json";
        if (!file_exists(_dosya_adi)) return false;

        var _dosya = file_text_open_read(_dosya_adi);
        var _json_string = "";
		var _json_string = file_text_read_string(_dosya);
        file_text_close(_dosya);

        var _yuklenen_veri = json_parse(_json_string);
        var _anahtarlar = struct_get_names(_yuklenen_veri);
        var _sayi = array_length(_anahtarlar);

        for (var i = 0; i < _sayi; i++) {
            var _k = _anahtarlar[i];
            self[$ _k] = _yuklenen_veri[$ _k];
        }
        global.aktif_dosya_ismi = aktif_dosya; 
        global.chatterbox_dosyasi = global.chatterbox_dosyalar[$ aktif_dosya];
        
        ChatterboxJump(global.chatterbox_dosyasi, aktif_node);
        return true;
    };
}