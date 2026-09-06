function ates_yakacak_kontrol(){
	if global.ates_mekanigi {
		global.ates_yakacaklar = [];
		global.ates_kibritler = [];


				var isleme = global.ates_yakacaklar;
				var tum_list = global.siniflandirma_yakacak;
				var son_ogeg = global.ates_yakacak_son;
		

		
			for (var i = 0; i < son_ogeg; i++) {
				var isim_1 = tum_list[| i];
				var isim_2 = string_copy(isim_1, 6, string_length(isim_1) - 5);
				var esya_no = real(isim_2);
				if global.envanter[esya_no] > 0  {
					array_push(isleme, isim_1);
				}
			}
		
		
	
				var isleme = global.ates_kibritler;
				var tum_list = global.siniflandirma_kibrit;
				var son_ogeg = global.ates_kibrit_son;
		
		
			for (var i = 0; i < son_ogeg; i++) {
				var isim_1 = tum_list[| i];
				var isim_2 = string_copy(isim_1, 6, string_length(isim_1) - 5);
				var esya_no = real(isim_2);
				if global.envanter[esya_no] != 0 {
					array_push(isleme, isim_1);
				}
			}
	
	
	}
}

/*
var eleman_1 = secili_1[| i];
var eleman_i = string_copy(eleman_1, 6, string_length(eleman_1) - 5);  // "esya_" den sonrasını al
eleman_sayisi = real(eleman_i);