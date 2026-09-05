function obje_konusmalari(obje_id) {
    if (obje_id == -1) {
        show_debug_message("HATA: isminde bir obje bulunamadı!");
        return false;
    }
	
	for (var i = 1; i < argument_count; i++) {
        if (argument[i] == false) {
            return false; 
        }
    }
	
    if (!ic_ice(obje_id)) return false;
    return true;
}

function kamera_hareket_et(numara, _x = global.cikolata.x, _y = global.cikolata.y, kamera_hizi_ = 10) {
	global.hareket_kamera_basladi = true;
	global.hareket_kamera_numarasi = numara;
	if !instance_exists(obj_gorunmez_cocuk) {
		instance_create_depth(_x, _y, 0, obj_gorunmez_cocuk);	
	}
	karakter_git(numara);
	global.kamera_takibi = obj_gorunmez_cocuk;
	kamera_hizi(kamera_hizi_);
}

function srb_kararma(kararma_numarasi, kararma_hizi = 0.01) {
	global.karanlik_hizi = kararma_hizi;
	global.karanlik_artis = true;
	global.hikaye_kontrolleri_64 = kararma_numarasi;
}

// Bu fonksiyonu script dosyanın içine ekle
function konusma_hazirla(_id, _basla = false, _obje = undefined) {
	if _basla == false {
		global.z_renklendi = true;
		global.z_renklendi_android = true;
	}
	if (_basla == false && !global.z_basildi) || konusma_baslayamaz exit;
    global.aktif_konusma_id = _id;
    global.aktif_konusma_basla = _basla;
    global.aktif_konusma_obje = _obje;
}



function konusma_kapat() {
    global.aktif_konusma_id = -1;
    global.aktif_konusma_basla = false;
    global.aktif_konusma_obje = undefined;
}

function nesne_konusma_baslat(nesne_ismi, konusma_numarasi, kosul = true, yakinlik_mi_ic_ice_mi = 1) { //nesnelere yakın olduğunda bu çağırılacak
	if !kosul exit;
	if yakinlik_mi_ic_ice_mi == 1 && yakinlik(nesne_ismi) {
		global.z_renklendi = true;
		global.z_renklendi_android = true;
		if global.z_basildi && !karakter_yuruyemez {
			konusma_baslat(konusma_numarasi);	
		}	
	}
	if yakinlik_mi_ic_ice_mi == 2 && ic_ice(nesne_ismi) {
		global.z_renklendi = true;
		global.z_renklendi_android = true;
		if global.z_basildi && !karakter_yuruyemez {
			konusma_baslat(konusma_numarasi);	
		}		
	}
}

function konusma_baslat(numara, z_tusu_ile_mi = false, gereken_global_numarasi = noone, yakinlik_nesnesi = noone, true_ise_calisacak = true, ic_ice_nesnesi = noone) {
	show_debug_message("--- [KONUSMA BASLAT CALISTI] No: " + string(numara));

	if (!true_ise_calisacak) {
		show_debug_message("-> Takildi: true_ise_calisacak false");
		return;
	}
	
	if (yakinlik_nesnesi != noone && !yakinlik(yakinlik_nesnesi, , false)) {
		show_debug_message("-> Takildi: yakinlik saglanamadi");
		exit;
	}
	
	if (ic_ice_nesnesi != noone && !ic_ice(ic_ice_nesnesi)) {
		show_debug_message("-> Takildi: ic_ice saglanamadi");
		exit;
	}

	var obje_id = obj_konusma_temel;
	var global_ismim = noone;
	if (gereken_global_numarasi != noone) global_ismim = "hikaye_kontrolleri_" + string(gereken_global_numarasi);

	if (!instance_exists(obje_id)) {
		var konusmak = noone;

		if (!z_tusu_ile_mi) {
			if (!variable_global_exists("cikolata") || !instance_exists(global.cikolata)) {
				show_debug_message("-> HATA: global.cikolata bulunamadi!");
				exit;
			}
			konusmak = instance_create_depth(global.cikolata.x, global.cikolata.y, 0, obje_id);
		} else {
			if (global_ismim != noone && variable_global_exists(global_ismim) && variable_global_get(global_ismim) == true) {
				show_debug_message("-> Takildi: Hikaye kontrolu zaten tamamlanmis");
				exit;
			}

			global.z_renklendi = true;	
			global.z_renklendi_android = true;	

			if (variable_global_exists("z_basildi") && global.z_basildi) {
				show_debug_message("-> Z tusuna basildi, nesne olusturuluyor...");
				if (!variable_global_exists("cikolata") || !instance_exists(global.cikolata)) {
					show_debug_message("-> HATA: global.cikolata bulunamadi!");
					exit;
				}
				konusmak = instance_create_depth(global.cikolata.x, global.cikolata.y, 0, obje_id);
				if (global_ismim != noone) variable_global_set(global_ismim, true);
			} else {
				show_debug_message("-> Z tusuna basilmadi bekleniyor...");
			}
		}

		if (konusmak != noone && instance_exists(konusmak)) {
			konusmak.konusma_no = numara;
			show_debug_message("-> BASARILI: Konusma nesnesi olusturuldu!");
		}
	} else {
		show_debug_message("-> Takildi: Ekranda zaten obj_konusma_temel mevcut");
	}
}

function konusma_sil(numara = undefined) {
	var obje_id = global.en_yakin_obje;
	with (obje_id) {
		instance_destroy();
	}
}

function bit() {
	secim_array(-1);
	konusma_bitimi();
	konusma_sil();	
}

function konusma_devam(obje_ismi = noone) {
	var obje_id = obje_ismi;
	if obje_ismi == noone obje_id = global.en_yakin_obje;
	obje_id.x = global.cikolata.x;
	obje_id.y = global.cikolata.y;
}

function karakter_git(numara, deger = 1, sonsuz_gidis = false) {
	variable_global_set("karakter_gitme_" + string(numara), deger);
	if sonsuz_gidis variable_global_set("karakter_gitme_devam_edecek_" + string(numara), deger);
}

function karakter_dur(numara, sonraki_yuruyusu_bekler = false) {
	variable_global_set("karakter_gitme_devam_edecek_" + string(numara), 0);
}

function karakter_git_durdur(numara, aninda_durdurur = false) {
	variable_global_set("karakter_gitme_" + string(numara), -1);
}

function karakter_git_oldur(tum_yurumeleri_bitirir_harika_bir_sey = false) {
	for (var i = 0; i < 500; i++) {
		variable_global_set("karakter_gitme_" + string(i), -1);
	}
}
function bilgi_sil() {
	ds_list_clear(global.bilgiler);	
}

function esyam(numara) {
	return ("esya_" + string(numara));	
}

function envanter_temizle() {
	for (var i = 0; i < global.envanter_kapasite; i++) {
		var slot = global.envanter_list[| i];
		slot[? "esya"] = -1;
		slot[? "adet"] = 0;
	}
}

function gorevleri_temizle() {
	ds_map_clear(global.aktif_gorevler);
	ds_list_clear(global.gorevler);
	ds_list_clear(global.gorev_aciklamalari);
	global.guncel_bildirim = 0;
	global.bakilan_bildirim = 0;
}

function json_kopyala(_kaynak_dosya, _hedef_dosya) {

	    var _buffer = buffer_load(_kaynak_dosya);
	    buffer_save(_buffer, _hedef_dosya);
	    buffer_delete(_buffer);
		
		var user_cache_file = "user_cache.buf";
	    var user_json_file = "kullanici.json";
   
	    show_debug_message("Creating user buffer cache from JSON...");
	    create_buffer_cache(user_json_file, user_cache_file);
    
	    show_debug_message("Dosya başarıyla aktarıldı!");
		ini_open("settings.ini");
		ini_write_real("ayarlar", "sifirla_" + string(global.sifirlama_sayisi), 0);
		ini_close();
}

function kayit_noktasi_kopyala(_kaynak_dosya, _hedef_dosya) {
	    var _buffer = buffer_load(_kaynak_dosya);
    
	    buffer_save(_buffer, _hedef_dosya);
    
	    buffer_delete(_buffer);
   
		ini_open("settings.ini");
		ini_write_real("ayarlar", "sifirla_" + string(global.sifirlama_sayisi), 0);
		ini_close();
}	

function kayit_noktasi_aktifles(numara) {
	kaydet();
	ini_open("settings.ini");
	for (var i = 1; i <= numara; i++) {
		ini_write_real("ayarlar", "hikaye_aktiflik_" + string(i), 1);
		variable_global_set("hikaye_aktiflik_" + string(i), 1);
	}
	ini_close();
	bilgi_ver(string(numara) + "." + " " + global.genel_yazilar[193]);
	
}

function esya_topla(toplanacak_esya_id, hangi_objedeyse_onun_step_eventine_yaz = 0) { //Yerden toplanabilir nesneler için bu kullanılacak
	if faz_degistirme_tetikleme(id) {
		var envantere_eklenecek_id = toplanacak_esya_id;
		bekleme_animasyonu_calistir(global.genel_yazilar[204] + "\n" + global.item_names[? "esya_" + string(envantere_eklenecek_id)], 0.5, true);	
		envantere_ekle(envantere_eklenecek_id, 1);
	
		audio_play_sound(global.sfx_cali_etkilesim, 1, false);
		audio_sound_gain(global.sfx_cali_etkilesim, global.ses_seviyesi);
		instance_destroy();
	}
}

function esya_olustur(olusacak_esya, uzerinde_olusacagi_obje, olusmasi_zorlanacak_adet, _ek_degiskenler = {}) {
    // 1. GÜVENLİK KONTROLÜ
    if (!instance_exists(uzerinde_olusacagi_obje)) exit;
    var alan_sayisi = instance_number(uzerinde_olusacagi_obje);
    if (alan_sayisi == 0) exit; 

    // 2. CRITICAL BUG FIX: String dönüşümünü döngülerin dışına taşıdık
    var _hedef_obje = olusacak_esya;
    if (is_real(_hedef_obje)) {
        // Eğer bir enum/sayı geldiyse stringe çevirip asset indexini alıyoruz
        _hedef_obje = asset_get_index("obj_bulunan_esya_" + string(_hedef_obje));    
    }
    
    // Eğer asset_get_index başarısız olduysa (-1 döndüyse) hata vermemesi için çıkış yapalım
    if (_hedef_obje == -1) exit;

    // 3. EŞYA OLUŞTURMA DÖNGÜSÜ
    repeat (olusmasi_zorlanacak_adet) {
        var hedef_alan = instance_find(uzerinde_olusacagi_obje, irandom(alan_sayisi - 1));
        var basarili = false;
        
        repeat (20) { 
            var deneme_x = random_range(hedef_alan.bbox_left,  hedef_alan.bbox_right);
            var deneme_y = random_range(hedef_alan.bbox_top,  hedef_alan.bbox_bottom);
            
            // Seçilen nokta gerçekten nesnenin maskesinin içinde mi?
            if (instance_position(deneme_x, deneme_y, hedef_alan)) {
                // Orada halihazırda başka bir aynı nesne var mı?
                if (!position_meeting(deneme_x, deneme_y, _hedef_obje)) {
                    
                    // Nesneyi oluştururken en sondaki parametreye struct'ı enjekte ediyoruz
                    var obje = instance_create_layer(deneme_x, deneme_y, "esyalar", _hedef_obje, _ek_degiskenler);
                    
                    // Varsayılan değişkenleri tanımlıyoruz (eğer struct içinde ezilmedilerse)
                    if (!variable_instance_exists(obje, "mevcut_adet")) obje.mevcut_adet = 1;
                    if (!variable_instance_exists(obje, "dinamik"))     obje.dinamik = true;
                    
                    basarili = true;
                    break;
                }
            }
        }
    }
}

function efekt_sil(silinecek_efekt_numarasi) {
	for (var i = 0; i < array_length(global.aktif_efektler); i++) {
		if global.aktif_efektler[i] == silinecek_efekt_numarasi {
			global.efekt_timer[i] = 0;
			global.aktif_efektler[i] = 0;
		}
    }
}
function efekt_temizle() {
	for (var i = 0; i < 21; i++) {
		global.efekt_timer[i] = 0;
		global.aktif_efektler[i] = 0;
    }
}

function cikolata_sprite_degistir(degisecek_animasyon_string) {
	global.cikolata_spritesi = degisecek_animasyon_string;
	global.cikolata.sprite_index = variable_global_get(degisecek_animasyon_string).On;
	global.cikolata.karakter_animasyon = variable_global_get(global.cikolata_spritesi);
	global.secili_karakter = variable_global_get(global.cikolata_spritesi);
}

function npc_sprite_degistir_surekli(npc, yeni_animasyon_string, yon = "on") {
	if !instance_exists(npc) exit;
	npc.karakter_animasyon = variable_global_get(yeni_animasyon_string);
	if npc.sprite_index != npc.karakter_animasyon.On && npc.sprite_index != npc.karakter_animasyon.Yan && npc.sprite_index != npc.karakter_animasyon.Arka {
		npc.sprite_index =npc.karakter_animasyon.On;
	}
}


function karaktere_don() {
	if x > global.cikolata.x image_xscale = -1;
	else image_xscale = 1;
}

function gidis_yonune_don(gidecek_x) {
	if x > gidecek_x {
		image_xscale = -1;	
	}
	else {
		image_xscale = 1;	
	}
}

function karakter_hasar_ver(verilecek_hasar, titreme_orani, titreme_suresi, geri_tepmek = true, calacak_ses = noone, flash_suresi = 0.5) {//Karakterimizin canı gidecekse bu çağırılacak
	var hasarim = verilecek_hasar;
	stat_degisim("can", 0, hasarim, true);	
	ekran_titret(titreme_orani, titreme_suresi);
	
	if geri_tepmek {
		var geri_tepme = point_direction(x, y, global.cikolata.x, global.cikolata.y);
		var hasar_boyutu = hasarim / 2;
	
		var dx = lengthdir_x(hasar_boyutu, geri_tepme);
		var dy = lengthdir_y(hasar_boyutu, geri_tepme);
		
		global.cikolata.x += dx;
		global.cikolata.y += dy;
		flash_patlama(flash_suresi);
		hasar_ses(calacak_ses);
	}
}

function flash_patlama(oran = 1) { //Flaş patlama efekti
	global.flash_patlama = oran;
}

function ara_sahne_yeni(ara_sahne_sprite, saniye, index = 0, kararti = 1) {
	ara_sahne_ciz(ara_sahne_sprite, 0.54, saniye, index, kararti);
	if global.android && !global.tablet_modu || (!global.android && global.klavye_kontrolleri && !global.tablet_modu) ara_sahne_ciz(ara_sahne_sprite, 0.44, saniye, index, kararti);
}	

function kamera_hizi(hiz_1_10_arasi) {
    var oran = (hiz_1_10_arasi - 1) / 9;

    global.CAM_SMOOTH = lerp(0.004, global.cam_smooth_temel, oran);
}

function ekrani_doldur(string_, _x, _y) {
	var yazi = instance_create_depth(_x, _y, -9999, obj_ekran_titreyen_yazi);
	yazi.yazi = string_;
	yazi._x = _x;
	yazi._y = _y;
}
