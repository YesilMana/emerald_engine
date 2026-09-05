function asker_kovalama_mahalle() {
	var minimum_uzaklik = 160;
	var en_yakin_asker = noone;
	var en_yakin_uzaklik = 99999;
	for (var i = 0; i < 20; i++) {
		var obje_index = asset_get_index("obj_npc_kargo_askeri_" + string(i));
		if obje_index == undefined exit;
		if !instance_exists(obje_index) continue;
		var uzaklik = point_distance(global.cikolata.x, global.cikolata.y, obje_index.x, obje_index.y);
		if uzaklik < en_yakin_uzaklik {
			en_yakin_uzaklik = uzaklik;
			en_yakin_asker = obje_index;
		}
	}
	if en_yakin_uzaklik < minimum_uzaklik {
		global.harita_tus_basildi = false;
		global.harita_uzaklasti = false;
		var konusma_no = choose(11, 12, 13, 14, 15, 16);
		konusma_baslat(konusma_no);
	}
}

function devriyeler(no) {
	switch (no) {
		case 1:
			npc_konum_kaydetme_ozel(obj_npc_kargo_askeri_1, room, 1337, 1067, , , true, , true); //Yatay devriye - 600 pixel aralık
			npc_konum_kaydetme_ozel(obj_npc_kargo_askeri_2, room, 1456, 733, , , true, , true); //Yatay devriye - 600 pixel aralık
			npc_konum_kaydetme_ozel(obj_npc_kargo_askeri_3, room, 959, 670, , , true, , true); //Dikey devriye - 605 - 744 y arası
			//npc_konum_kaydetme_ozel(obj_npc_kargo_askeri_4, room, 1338, 1628, , , true, , true); //Yatay devriye - 600 pixel aralık
			npc_konum_kaydetme_ozel(obj_npc_kargo_askeri_5, room, 555, 1150, , , true, , true); //Dikey devriye - 1200 pixel aralık
			npc_konum_kaydetme_ozel(obj_npc_kargo_askeri_6, room, 1396, 455, , , true, , true); //Yatay devriye 1291, 1470 x arası
			npc_konum_kaydetme_ozel(obj_npc_kargo_askeri_7, room, 1605, 339, , , true, , true); //Yatay devriye 155, 400 y arası
			npc_konum_kaydetme_ozel(obj_npc_kargo_askeri_8, room, 1226, 300, , , true, , true); //Yatay devriye 46, 400 y arası
			npc_konum_kaydetme_ozel(obj_npc_kargo_askeri_9, room, 1394, 415, , , true, , true);
			npc_konum_kaydetme_ozel(obj_npc_kargo_askeri_10, room, 1393, 626, , , true, , true);
			npc_konum_kaydetme_ozel(obj_npc_kargo_askeri_11, room, 1337, 735, , , true, , true);
			npc_konum_kaydetme_ozel(obj_npc_kargo_askeri_12, room, 1454, 737, , , true, , true);
			npc_konum_kaydetme_ozel(obj_npc_kargo_askeri_13, room, 1219, 956, , , true, , true);
			npc_konum_kaydetme_ozel(obj_npc_kargo_askeri_14, room, 1598, 961, , , true, , true);
			npc_konum_kaydetme_ozel(obj_npc_kargo_askeri_15, room, 778, 286, , , true, , true);
			npc_konum_kaydetme_ozel(obj_npc_kargo_askeri_16, room, 2181, 954, , , true, , true);
			break;
	}
}

function karakter_gorunme() {
		
}

function demo_bitis_jenerik() {
	audio_play_sound(sfx_olum, 1, false, global.ses_seviyesi);
	ekran_yazisi_yaz(global.genel_yazilar[330], 20);
	geri_sayim_baslat(8, 5);
	karart(5);
}


function gpb_baglanti_basladi(_billing_result) {
    if (_billing_result.code != GooglePlayBillingResponseCode.Ok) {
        show_debug_message($"Play Store'a bağlanılamadı: {_billing_result.code}");
        exit;
    }

    // Satın alma yapabilmek için ürün ÖNCE sorgulanmalı (cache'lenir)
    // ÖNEMLİ: düz {} literal değil, gerçek GooglePlayBillingProductInput struct'ı ile
    var _product = new GooglePlayBillingProductInput();
    _product.product_id = "full_surum";
    _product.product_type = GooglePlayBillingProductType.InApp;

    play_billing_query_product_details_async(
        [_product],
        function(_br, _qr) { /* ürün hazır, isterseniz burada fiyat gösterin */ }
    );

    // Geçmiş faturaları sorgula (oyunu silip yükleyenler / iade edenler için)
    play_billing_query_purchases_async(GooglePlayBillingProductType.InApp, false,
        function(_br, _purchases) {
            var _sahip_mi = false;
            for (var i = 0; i < array_length(_purchases); i++) {
                if (array_contains(_purchases[i].products, "full_surum")) {
                    _sahip_mi = true;
                    handle_purchase_update(_purchases[i], false);
                }
            }
            if (!_sahip_mi) handle_refund_check();
        }
    );
}

function gpb_baglanti_koptu() {
    // Bağlantı koptu, tekrar dene
    play_billing_start_connection(gpb_baglanti_basladi, gpb_baglanti_koptu);
}

function handle_purchase_update(_purchase, _is_live) {
    if (!array_contains(_purchase.products, "full_surum")) return;

    if (_purchase.purchase_state == GooglePlayBillingPurchaseState.Purchased) {
        if (!_purchase.is_acknowledged) {
            play_billing_acknowledge_purchase(_purchase.purchase_token, function(_billing_result) {
                if (_billing_result.code == GooglePlayBillingResponseCode.Ok) {
                    show_debug_message("Zümrüt Çiçeği - Tam Sürüm Kilidi Açıldı!");
                    grant_tam_surum(_is_live);
                }
            });
        } else {
            grant_tam_surum(false); // zaten onaylı, sessizce kilidi aç
        }
    } else if (_purchase.purchase_state == GooglePlayBillingPurchaseState.Pending) {
        show_debug_message("Ödeme banka onayı bekliyor...");
    }
}

function grant_tam_surum(_restart) {
    ini_open("silinmeyecek.ini");
    ini_write_real("satin_alimlar", "tam_surum", 1);
    ini_write_real("oyuncu", "ilk_defa_tam_surum_oluyor", 1);
    ini_write_real("oyuncu", "kayit_sil", 1);
    ini_close();

    global.tam_surum = true;
    global.ini_10 = true;

    show_debug_message("OLDU LAA");
    ini_kaydet();

    ini_open("settings.ini");
    for (var f = 1; f <= 10; f++) {
        ini_write_real("ayarlar", "hikaye_aktiflik_" + string(f), 1);
        variable_global_set("hikaye_aktiflik_" + string(f), 1);
    }
    ini_close();

    if (!global.ilk_defa_tam_surum_oluyor) {
        json_kopyala("kayit_10.json", "kullanici.json");
        ini_open("settings.ini");
        ini_write_real("ayarlar", "devam", 1);
        ini_close();
    }
    global.ilk_defa_tam_surum_oluyor = true;

    if (_restart) game_restart();
}

function handle_refund_check() {
    ini_open("silinmeyecek.ini");
    var _kayit_sil = ini_read_real("oyuncu", "kayit_sil", 0);
    ini_close();

    if (_kayit_sil == 1 && !global.tam_surum) {
        ini_open("silinmeyecek.ini");
        ini_write_real("oyuncu", "kayit_sil", 0);
        ini_close();

        dosya_sil("kullanici.json");
        dosya_sil("craft_" + global.dil + ".json");
        dosya_sil("craft_cache_" + global.dil + ".buf");
        dosya_sil("user_cache.buf");
        show_debug_message("Başlangıca döndün");
        game_restart();
        return;
    }

    ini_open("silinmeyecek.ini");
    ini_write_real("satin_alimlar", "tam_surum", 0);
    ini_close();

    global.tam_surum = false;
    show_debug_message("Satın alım bulunamadı veya iade edilmiş. Yetki geri alındı.");
}