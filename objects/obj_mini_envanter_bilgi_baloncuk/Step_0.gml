opaklik = mini_baloncuk_gorunme;
var cam = view_camera[0];
var cam_x = camera_get_view_x(cam);
var cam_y = camera_get_view_y(cam);

if opaklik = 1 {
	x = mouse_x;
	y = mouse_y;
}

metin = wrap_text(global.baloncuk_mesaj, 30);
// metnin piksel boyutunu al
var genislik_metin  = string_length(metin);
var yukseklik_metin = satir_sayisi(metin);
var genislik_baslik = string_length(global.baloncuk_baslik);

// ölçek hesapla
if (global.baloncuk_mesaj == undefined) {
   // image_xscale = genislik_baslik / 2.2;
    image_xscale = clamp(genislik_baslik / 2.2, 4, 1000000);
    image_yscale = 1;
	sprite_index = spr_envanter_baloncuk_2;
} else {
    sprite_index = spr_envanter_baloncuk_1;
	var gen = genislik_baslik;
	if genislik_metin > genislik_baslik gen = genislik_metin;
	image_xscale = clamp(gen / 2.2, 1, 9);
	image_yscale = (yukseklik_metin * 0.3) + 1;
}