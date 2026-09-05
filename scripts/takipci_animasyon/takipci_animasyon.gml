function takipci_animasyon(obj){
	var sira = 1;
	for (var i = 1; i <= 20; i++) {
		if (global.sira[i] == 0 && obj.takip_sirasi == 0) {
			sira = i;
			global.sira[i] = 1;
			obj.takip_sirasi = i;
			break;
		} else {
			sira = obj.takip_sirasi;
		}
	}
	
	obj.takip_ediliyor = true;

	var gecikme_miktari = 1;
	var hedef_index = sira * gecikme_miktari;
	var limit = array_length(global.gecmis_x) - 1;

	// Eğer yürüme engeli yoksa ve geçmiş dizisinde yeterli veri varsa
	if (instance_exists(obj) && !karakter_yuruyemez && !yurume_tusuna_basilmiyor) {
		
		if (limit >= 0) { // Dizi boş değilse
			// Eğer oyun yeni başladıysa ve dizi henüz hedef index kadar uzun değilse,
			// dizideki en eski veriyi (limit) kullan ki oyuncunun içinde toplansınlar.
			var kullanilacak_index = min(hedef_index, limit);
			var uzaklik = point_distance(obj.x, obj.y, global.cikolata.x, global.cikolata.y);
			var maksimum_uzaklik = 20 * sira;
			if uzaklik > maksimum_uzaklik {
				variable_global_set("gidecek_" + string(sira) + "_x", global.gecmis_x[kullanilacak_index]);
				variable_global_set("gidecek_" + string(sira) + "_y", global.gecmis_y[kullanilacak_index]);
			}
			
			var gidecek_x = variable_global_get("gidecek_" + string(sira) + "_x");
			var gidecek_y = variable_global_get("gidecek_" + string(sira) + "_y");
			
			var gidis_hizi = global.cikolata_hareket_hizi;
			
			var deger = obj.x - gidecek_x;
			var x_uzaklik = abs(deger);
			
				
			var deger2 = obj.y - gidecek_y;
			var y_uzaklik = abs(deger2); 
			
			var cizilecek = obj.karakter_animasyon;
		
				obj.image_index = 0;	
			if gidecek_x != 0 && gidecek_y != 0 {
				if y_uzaklik > 1 {
					if obj.y < gidecek_y {
						obj.y += gidis_hizi
						obj.sprite_index = cizilecek.On;
						obj.image_index = global.cikolata.image_index;
					}
					else if obj.y > gidecek_y {
						obj.y -= gidis_hizi;	
						obj.sprite_index = cizilecek.Arka;
						obj.image_index = global.cikolata.image_index;
					}
				}
			
				if x_uzaklik > 1 {
					if obj.x < gidecek_x {
						obj.x += gidis_hizi;
						obj.sprite_index = cizilecek.Yan;
						obj.image_xscale = 1;
						obj.image_index = global.cikolata.image_index;
					}
					else if obj.x > gidecek_x {
						obj.x -= gidis_hizi;	
						obj.sprite_index = cizilecek.Yan;
						obj.image_xscale = -1;
						obj.image_index = global.cikolata.image_index;
					}
				}
			}	
		}
		
		derinlik(obj);
	}
	
	if (yurume_tusuna_basilmiyor || karakter_yuruyemez) {
		obj.image_index = 0; // Durduklarında animasyonu sıfırla
	}
}

function tum_gidecekleri_oda_gecisi_duzenleme() {
	
	if !instance_exists(global.cikolata) exit;
	for (var i = 0; i < 20; i++) {
		variable_global_set("gidecek_" + string(i) + "_x", 0);
		variable_global_set("gidecek_" + string(i) + "_y", 0);	
	}
	global.gecmis_x = [];
	global.gecmis_y = [];
}
