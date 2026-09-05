function odaya_git(degisecek_numara, oda_ismi, konum_x, konum_y, kosul, verilecek_bilgi){
	if variable_instance_exists(id, "numara") && numara == degisecek_numara && !global.karakter_yurutuluyor {
		if kosul != undefined && !kosul {
			if verilecek_bilgi != undefined bilgi_ver(verilecek_bilgi);
			exit;
		}
        
        show_debug_message("1 - room_goto çalışacak");
        show_debug_message(room_get_name(oda_ismi));
		room_goto(oda_ismi);
        
        show_debug_message("2 - her_oda_degistirince_yasanacaklar çalışacak");
		her_oda_degistirince_yasanacaklar();
        
        show_debug_message("3 - global degiskenler atandı, ozel_oda_degistirme_kodlari çalışacak");
		global.karakter_dogur_x = konum_x;
		global.karakter_dogur_y = konum_y;
		ozel_oda_degistirme_kodlari(degisecek_numara);
        
        show_debug_message("4 - karart çalışacak");
		karart(1);
        
        show_debug_message("5 - FONKSİYON BAŞARIYLA BİTTİ");
		global.son_degistirilen_oda = degisecek_numara;
	}
}