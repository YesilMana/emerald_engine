joystick_kamera_temel_konum();
joystick_dokunma_kontrol();
if oyun_disi_odalar || global.konusma_basladi || global.envanter_ekrani_gorunme || global.hikaye_kontrolleri_120 opakizm = 0;
image_alpha = opakizm;
opaklik = opakizm;

if !global.android instance_destroy();