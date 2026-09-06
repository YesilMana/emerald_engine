// Async - System Event
var _event_type = ds_map_find_value(async_load, "event_type");

// 1. OYUN ARKA PLANA DÜŞTÜĞÜ AN (Orta tuşa basıldı / Bildirime tıklandı)
if (_event_type == "onPause") 
{
    // Native taraftaki ses thread'lerinin kilitlenmesini (ANR) önlemek için
    // arka plana geçer geçmez tüm sesleri kesip audio engine'i durduruyoruz.
    audio_stop_all();
    audio_pause_all();
}

// 2. OYUNA GERİ DÖNÜLDÜĞÜ AN
if (_event_type == "onResume") 
{
    if (!yeniden_baslamayacak_odalar)
    {
        // Settings.ini içine "bu oyun yarım kaldı, baştan aç" bayrağını dik
        ini_open("settings.ini");
        ini_write_real("ayarlar", "devam", 1);
        ini_close();
        
        // Sesleri temizlediğimiz için oyun temiz şekilde sıfırlanabilir
        game_restart(); 
    }
}