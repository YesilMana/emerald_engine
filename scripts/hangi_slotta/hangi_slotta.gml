//Bir nesnenin envanterde olup olmadığını söyler. 
//Envanterde yoksa bir sonraki boş slotu bulur.

function hangi_slotta(esya_id, sandik_mi = undefined){
	var list = global.envanter_list;
	if sandik_mi != undefined {
		list = sandik_mi;
	}
	for (var i = 0; i < ds_list_size(list); i++) {
		var liste_arastirma_mapi = list[| i];
		var esya_ismi = liste_arastirma_mapi[? "esya"];
		if esya_ismi != -1 {
			var id_str = string_delete(esya_ismi, 1, 5);
			var esya_numara = real(id_str);
			if esya_numara == esya_id {
				return i;
			}
		}
	}
	var bos_slot = bos_slotu_bul();
	return bos_slot;
}

//Envanterdeki bir nesnenin kaçıncı sırada olduğunu vererek o sıradaki nesnenin
//envanterdeki sırasını öğrenmek için kullanılır
//Mesela envanterde 3 tane aynı nesneden varsa bu üçünü sıralar ve "deger"
//değişkeninde yazılan sıradakinin envanter numarasını döndürür

function siradakini_bul(deger, esya_id) { 
	var sayac = 1;
	for (var i = 0; i < ds_list_size(global.envanter_list); i++) {
		var liste_arastirma_mapi = global.envanter_list[| i];
		var esya_ismi = liste_arastirma_mapi[? "esya"];
		if esya_ismi != -1 {
			var id_str = string_delete(esya_ismi, 1, 5);
			var esya_numara = real(id_str);
			if esya_numara == esya_id {
				if sayac == deger {
					return i;	
				}
				sayac += 1;
			}
		}
	}
	return undefined;	
}


function mumkun_olani_bul(deger, esya_id) { 
	var sayac = 1;
	for (var i = 0; i < ds_list_size(global.envanter_list); i++) {
		var liste_arastirma_mapi = global.envanter_list[| i];
		var esya_ismi = liste_arastirma_mapi[? "esya"];
		if esya_ismi != -1 {
			var id_str = string_delete(esya_ismi, 1, 5);
			var esya_numara = real(id_str);
			if esya_numara == esya_id {
				if deger == true {
					return i;	
				}
				sayac += 1;
			}
		}
	}
	return undefined;	
}

//Bir nesnenin envanterde olup olmadığını söyler. 
//Envanterde yoksa -1 döndürür
function slot_bos_mu(esya_id) { //İd numarası döndürüyor
	for (var i = 0; i < ds_list_size(global.envanter_list); i++) {
		var liste_arastirma_mapi = global.envanter_list[| i];
		var esya_ismi = liste_arastirma_mapi[? "esya"];
		if esya_ismi != -1 {
			var id_str = string_delete(esya_ismi, 1, 5);
			var esya_numara = real(id_str);
			if esya_numara == esya_id {
				return i;	
			}
		}
	}
	return -1;
}

function slot_bos_mu_sandik(esya_id, sandik_list) { //İd numarası döndürüyor
	for (var i = 0; i < ds_list_size(sandik_list); i++) {
		var liste_arastirma_mapi = sandik_list[| i];
		var esya_ismi = liste_arastirma_mapi[? "esya"];
		if esya_ismi != -1 {
			var id_str = string_delete(esya_ismi, 1, 5);
			var esya_numara = real(id_str);
			if esya_numara == esya_id {
				return i;	
			}
		}
	}
	return -1;
}

function kac_slotta_var(_id) {
	var adet_sayisi = 0;
	for (var i = 0; i < ds_list_size(global.envanter_list); i++) {
		var liste_arastirma_mapi = global.envanter_list[| i];
		var esya_ismi = liste_arastirma_mapi[? "esya"];
		if esya_ismi != -1 {
			var id_str = string_delete(esya_ismi, 1, 5);
			var esya_numara = real(id_str);
			if esya_numara == _id {
				adet_sayisi += 1;	
			}
		}
	}
	
	return adet_sayisi;
}