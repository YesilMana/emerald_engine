function srb_global(){
	scribble_add_macro("saskinlik", srb_saskinlik_ses_calma);
	scribble_add_macro("titret", srb_ekran_titreme);
	scribble_add_macro("bakis", srb_konusana_don);
	scribble_add_macro("don", srb_rastgele_don);
	scribble_add_macro("dur", function() {global.hikaye_kontrolleri_87 = true;});
	scribble_add_macro("devam", function() {global.hikaye_kontrolleri_87 = false;});
	scribble_add_macro("git", function(numara) {
		karakter_git(numara);	
	});
}


function srb_karanlik_tumu() {
	global.karanlik_azalma = true;
	global.karanlik_artis = false;        
	global.konusma_basladi = false;
	global.karanlik_artis = false;
	
}

function srb_karanlik_acilma(data) {
    if (data != undefined) {
        global.karanlik_hizi = real(data);
    } else {
        global.karanlik_hizi = 0.01;
    }
    
    global.karanlik_azalma = true;
    return "";
}

function srb_saskinlik_ses_calma() {
	audio_play_sound(global.sfx_konusma_saskinlik, 1, false);
	audio_sound_gain(global.sfx_konusma_saskinlik, global.ses_seviyesi);
	return "";
}

function srb_ekran_titreme() {
	ekran_titret(10, 30);
	return "";
}

function srb_rastgele_don(donecek, yon) {
	var temel_karakter = isim_obje_eslestirme(donecek);
	
	karakter_yonunu_don(temel_karakter, yon);
	
	return "";
}

function srb_konusana_don(donecek, donulecek, birbirine_bakacak = true) {
	var temel_karakter = isim_obje_eslestirme(donecek);
	var bakilacak_karakter = isim_obje_eslestirme(donulecek);
	
	var yonelim = iki_kisi_yon_hesapla(temel_karakter, bakilacak_karakter);
	
	karakter_yonunu_don(temel_karakter, yonelim);
	
	if birbirine_bakacak {
		var yonelim_2 = iki_kisi_yon_hesapla(bakilacak_karakter, temel_karakter);
		karakter_yonunu_don(bakilacak_karakter, yonelim_2);
	}
	return "";
}


