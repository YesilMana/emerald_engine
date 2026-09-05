if global.ini_6 {
    global.tam_surum = true;
    instance_destroy();
    exit;
}

if satin_al {
    if (!play_billing_is_ready()) exit;

    var _item = new GooglePlayBillingProductDetailsParams();
    _item.product_id = "full_surum";

    var _result = play_billing_launch_billing_flow([_item]);
    if (_result.code != GooglePlayBillingResponseCode.Ok) {
        show_debug_message($"Satın alma başlatılamadı: {_result.code}");
    }
}
satin_al = false;