// obj_preloader CREATE event
yukselen = 0;
preload_index = 0;
image_indec = 0;
ini_open("settings.ini");
var dedos = ini_read_real("settings", "yeniden_baslatildi", 0);
ini_close();

if dedos == 1 { 
	instance_destroy();
	room_goto(rm_ana_menu);
	ini_open("settings.ini");
	ini_write_real("settings", "yeniden_baslatildi", 0);
	ini_close();
}

// CREATE event veya yükleme başlangıcı

indec = 0;
sprite_list = [];

//sprite_list = asset_sprite; // Tüm sprite ID'leri array olarak geliyor

sprite_list = [
spr_hasta_ekrani_temel,
spr_ates_ekrani_parlama,
spr_ates_ekrani_parlama,
spr_ates_ekrani_parlama
];


//artim_hizi = 1 / array_length(sprite_list);

artim_hizi = 0.000001;
draw_set_font(global.konusma_font);