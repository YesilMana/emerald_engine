function karakter_yurume(hiz, numara, obje, animasyon_hizi = noone) {
	if (!instance_exists(obje)) exit;
	var sistem = variable_global_get("karakter_gitme_" + string(numara));
	
	if sistem == -1 {
		obje.image_index = 0;
		global.karakter_yurutuluyor = false;
		variable_global_set("karakter_gitme_" + string(numara), 0);
		if (instance_exists(obje)) obje.gidiyor = false;	
	}
	
	if (sistem != 1) {
		exit;
	}
	
	// --- DELTA TIME EKLENTİSİ ---
	var hedef_fps = 60; 
	var dt_carpani = delta_time / (1000000 / hedef_fps);
	var guncel_hiz = hiz * dt_carpani;
	// ----------------------------

	// 1. GÜVENLİK KONTROLLERİ
	
	
	if (!global.karakter_yuruyebilir) {
		obje.image_index = 0;
		exit;
	}
	
	var liste_adi = "yurume_liste_" + string(numara);
	var liste = global.yurume_map[? string(numara)];
	var devam_edecek = variable_global_get("karakter_gitme_devam_edecek_" + string(numara));
	
	if (obje == global.cikolata) global.karakter_yurutuluyor = true;
	obje.gidiyor = true;
	
	// 2. LİSTE KONTROLÜ
	if (is_undefined(liste) || ds_list_size(liste) == 0) {
		obje.image_index = 0;
		global.karakter_yurutuluyor = false;
		numaraya_gore(numara);
		variable_global_set("karakter_gitme_" + string(numara), 0);
		if obje == global.cikolata global.konusma_basladi = false;
		if (instance_exists(obje)) obje.gidiyor = false;
		if numara == global.hareket_kamera_numarasi && global.hareket_kamera_basladi {
			global.hareket_kamera_basladi = false;
			global.hareket_kamera_numarasi = false;
			global.kamera_takibi = global.cikolata;
			instance_destroy(obj_gorunmez_cocuk);
		}
		
		kamera_hizi(10);
		exit;
	}
	
	// 3. HEDEF VERİSİNİ ALMA
	var hedef = liste[| 0];

	// --- BEKLEME (DELAY) SİSTEMİ GÜNCELLEMESİ ---
	if (array_length(hedef) == 3) {
		var orijinal_delay = hedef[2]; // Örn: 240

		// DÜZELTME: Sayacımız yoksa veya 'bekleme bitti' (-1) durumundaysa yeni süreyi yükle.
		// Artık <= 0 kullanmıyoruz, böylece 0'a düştüğünde kendini tekrar doldurmayacak!
		if (!variable_instance_exists(obje, "bekleme_sayaci") || obje.bekleme_sayaci == -1) {
			obje.bekleme_sayaci = orijinal_delay;
		}

		// Süreyi eksilt (dt_carpani ile fps düşüşlerine karşı korumalı)
		obje.bekleme_sayaci -= 1 * dt_carpani; 

		// Eğer sayaç hala sıfırın üzerindeyse beklemeye devam et
		if (obje.bekleme_sayaci > 0) {
			obje.image_index = 0; 
			exit; 
		} 
		else {
		    // Bekleme SÜRESİ BİTTİ!
			if (devam_edecek) {
				ds_list_add(liste, hedef); // Döngü varsa listenin sonuna at
			}
			
			ds_list_delete(liste, 0); // Mevcut bekleme hedefini sil
			
			// EN ÖNEMLİ KISIM: Bir sonraki bekleme noktası için sayacı 'boş/hazır' konuma (-1) getir.
			obje.bekleme_sayaci = -1; 
			exit; // Bu frame'i bitir, sonraki frame yürümeye geçsin
		}
	}

	// 4. HAREKET VE MESAFE HESAPLAMA
	var xx = hedef[0];
	var yy = hedef[1];
	var mesafe = point_distance(obje.x, obje.y, xx, yy);

	// Durma sistemi kontrolü
	if (obje != global.cikolata && !karakterler_yurume_durma) || (obje == global.cikolata) {
		if (mesafe <= guncel_hiz) {
			obje.x = xx;
			obje.y = yy;
		
			// --- DÖNGÜ: Ulaşılan noktayı silmeden önce sona ekliyoruz ---
			if (devam_edecek) {
				ds_list_add(liste, hedef);
			}
			// Sonra baştan siliyoruz. Böylece liste hiç bitmiyor.
			ds_list_delete(liste, 0);
		} 
		else {
			// HAREKET ETME VE ANİMASYON
			var yon = point_direction(obje.x, obje.y, xx, yy);
		
			var hareket_x = lengthdir_x(guncel_hiz, yon);
			var hareket_y = lengthdir_y(guncel_hiz, yon);
		
			obje.x += hareket_x;
			obje.y += hareket_y;

			var spritesi = obje.karakter_animasyon;
			var scalem = abs(obje.image_yscale); 

			if (abs(hareket_x) > abs(hareket_y)) {
				obje.sprite_index = spritesi.Yan;
				obje.image_xscale = (hareket_x > 0) ? scalem : -scalem; 
			} 
			else {
				obje.image_xscale = scalem; 
				if (hareket_y > 0) {
					obje.sprite_index = spritesi.On; 
				} else {
					obje.sprite_index = spritesi.Arka; 
				}
			}
			
			var index_bolumu = 8;
			if animasyon_hizi != noone index_bolumu = animasyon_hizi;
			obje.image_index = global.timer / index_bolumu;
		}
	}
	else {
		obje.image_index = 0;	
	}
}