function secim_globalleri(){
	//Seçimlerin tanımlamaları
	global.secim_yapiliyor = false;
	global.yapilmis_secim = 1;
	global.maksimum_secenek = 3;
	global.secenek_1_y = 150;
	global.secenek_2_y = 159;
	if global.tablet_modu || (!global.android && global.tablet_modu) || (!global.android && !global.klavye_kontrolleri) {
		global.secenek_1_y = 192;	
		global.secenek_2_y = 201;	
	}
	global.secim_sayfasi_1 = 1;
	global.secim_sayfasi_2 = 2;
	global.secim_konum = 1;
	global.secim_degisti = false;
}

function secenek_ayarlama() {
	if global.yapilmis_secim > global.secim_sayfasi_1 {
		global.secim_konum = 2;	
	}
	if global.yapilmis_secim < global.secim_sayfasi_2 {
		global.secim_konum = 1;	
	}
	if global.yapilmis_secim > global.secim_sayfasi_2 {
		global.secim_sayfasi_1 = global.yapilmis_secim - 1;
		global.secim_sayfasi_2 = global.yapilmis_secim; //Eğer seçenekler alttaki seçeneği geçerse
		global.secim_konum = 2;
	}
	
	if global.yapilmis_secim < global.secim_sayfasi_1 {
		global.secim_sayfasi_1 = global.yapilmis_secim; //Eğer seçenekler üstteki seçeneği geçerse
		global.secim_sayfasi_2 = global.yapilmis_secim + 1;
		global.secim_konum = 1;
	}
}