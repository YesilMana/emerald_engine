function takipci_oda_baslangic(){
	if variable_global_exists("takipciler_list") && !takipci_olusmayan_odalar {
		for (var i = 0; i < ds_list_size(global.takipciler_list); i++) {
			var obje_ismi = global.takipciler_list[| i];
			var obje_id = asset_get_index(obje_ismi);
			var karakter_dog_x = global.karakter_bilgileri[? "konum_x"];
			var karakter_dog_y = global.karakter_bilgileri[? "konum_y"] - 2;
			if global.cikolata.x != 0 {
				karakter_dog_x = global.cikolata.x;
				karakter_dog_y = global.cikolata.y;
			}
			
			if !instance_exists(obje_id) {
				var insancik = instance_create_depth(karakter_dog_x, karakter_dog_y, 0, obje_id);
				insancik.npc = true;
				//show_message("Oluştu: " + object_get_name(obje_id));
			}

			var global_ismim = global.takipci_global_isimleri[? obje_ismi];
			if global_ismim != undefined variable_global_set(global_ismim, 1);
		}
	}
}

function npc_oda_dogum() {
	var oda_ismi = room_get_name(room);
	npc_rastgele_olusum();
	var oda_listi = global.takipci_konumlari_list[? oda_ismi];
	if (oda_listi != undefined) {
		for (var i = 0; i < ds_list_size(oda_listi); i++) {
			var karakter_dog_x = global.cikolata.x;
			var karakter_dog_y = global.cikolata.y;
			var npc_mapi = oda_listi[| i];
			var obje_ismi_1 = oda_listi[| i];
			var obje_ismi = obje_ismi_1[? "npc_isim"];
			var obje_id = asset_get_index(obje_ismi);
			if npc_mapi != undefined {	
				var karakter_dogma_oda = npc_mapi[? "npc_oda"];
				karakter_dog_x = npc_mapi[? "npc_konum_x"];
				karakter_dog_y = npc_mapi[? "npc_konum_y"];
				var ilk_x = npc_mapi[? "ilk_x"];
				var ilk_y = npc_mapi[? "ilk_y"];

				var dogur = instance_create_depth(karakter_dog_x, karakter_dog_y, 0, obje_id);
				if (!is_undefined(ilk_x) && !is_undefined(ilk_y)) {
					dogur.kayit_x = ilk_x;
					dogur.kayit_y = ilk_y;
				}
		
				var _yon = npc_mapi[? "npc_yon"];
		
				if _yon == "sag" {
					dogur.sprite_index = dogur.karakter_animasyon.Yan;
					dogur.image_xscale = 1;
				}
				else if _yon == "sol" {
					dogur.sprite_index = dogur.karakter_animasyon.Yan;
					dogur.image_xscale = -1;
				}
				else if _yon == "on" {
					dogur.sprite_index = dogur.karakter_animasyon.On;
				}
				else if _yon == "arka" {
					dogur.sprite_index = dogur.karakter_animasyon.Arka;
				}
				dogur.npc = true;
			}	
		}
	}
}

function npc_rastgele_olusum() {
	if is_undefined(global.takipci_konumlari_list) exit;
	if is_undefined(global.takipci_konumlari_rastgele) exit;
    var oda_isim = room_get_name(room);
    var oda_list = global.takipci_konumlari_list[? oda_isim];
    
    if (is_undefined(oda_list)) {
        oda_list = ds_list_create();
        ds_map_add_list(global.takipci_konumlari_list, oda_isim, oda_list);
    }
    var tum_list = global.takipci_konumlari_rastgele[? oda_isim];
    if (is_undefined(tum_list)) exit;
    for (var i = 0; i < ds_list_size(tum_list); i++) { 
        var olusacak = tum_list[| i];
        
        // Güvenlik kontrolü
        if (is_undefined(olusacak)) continue;
        
        var olustu_mu = olusacak[? "olustu"];
        if (olustu_mu == 1) continue;
        
        var olusum_x1 = olusacak[? "olusum_x1"];
        var olusum_x2 = olusacak[? "olusum_x2"];
        var olusum_y1 = olusacak[? "olusum_y1"];
        var olusum_y2 = olusacak[? "olusum_y2"];
        
        var olusum_sayisi_1 = olusacak[? "sayisi_1"];
        var olusum_sayisi_2 = olusacak[? "sayisi_2"];
        var olusum_sayisi = irandom_range(olusum_sayisi_1, olusum_sayisi_2);
        
        var npc_isim = olusacak[? "npc_isim"];
        
        for (var h = 0; h < olusum_sayisi; h++) {
            var yeni_map = ds_map_create();
            var olusacak_konum_x = random_range(olusum_x1, olusum_x2);
            var olusacak_konum_y = random_range(olusum_y1, olusum_y2);
            
            ds_map_add(yeni_map, "npc_isim", npc_isim);
            ds_map_add(yeni_map, "npc_konum_x", olusacak_konum_x);
            ds_map_add(yeni_map, "npc_konum_y", olusacak_konum_y);
            
            // Oluşturduğumuz veya var olduğunu doğruladığımız listeye ekle
            ds_list_add(oda_list, yeni_map);
            ds_list_mark_as_map(oda_list, ds_list_size(oda_list) - 1);
        }
        
        // Spawn işleminin tamamlandığını işaretle
        olusacak[? "olustu"] = 1;
    }
}