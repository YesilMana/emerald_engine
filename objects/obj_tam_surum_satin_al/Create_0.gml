if global.ini_6 || !global.android {
    global.tam_surum = true;
    instance_destroy();
    exit;
}

satin_al = false;
image_alpha = 0;

if (os_type != os_android) exit;

// 1. Ömür boyu satın alma güncellemeleri callback'i
play_billing_init(undefined, function(_billing_result, _purchases) {
    for (var i = 0; i < array_length(_purchases); i++) {
        handle_purchase_update(_purchases[i], true);
    }
});

// 2. Mağazaya bağlan
play_billing_start_connection(gpb_baglanti_basladi, gpb_baglanti_koptu);