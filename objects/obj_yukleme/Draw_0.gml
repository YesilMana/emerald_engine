// obj_preloader: STEP Event

var max_per_frame = 1;
var drawn_this_frame = 0;

while (preload_index < array_length(sprite_list) && drawn_this_frame < max_per_frame) {
    var spr = sprite_list[preload_index];
    var frame_count = sprite_get_number(spr);

    // Sprite'ın bir karesini çizerek GPU'ya yüklenmesini sağla
    var x_pos = 700 + (drawn_this_frame * 100); // Yan yana çizmek için X konumunu kaydır
    draw_sprite_ext(spr, image_indec, x_pos, 700, 1, 1, 0, c_white, 0.01);

    image_indec++;

    if (image_indec >= frame_count) {
        preload_index++;
        image_indec = 0;
        //obj_duman.ilerleme += artim_hizi;
        drawn_this_frame++;
    } else {
        // Aynı sprite henüz tamamen çizilmedi → diğer sprite'a geçmeden çık
        break;
    }
}

// Yükleme ekranı çizimi
if (preload_index < array_length(sprite_list)) {
    var spr_name = sprite_list[preload_index];
    draw_set_halign(fa_left);
    draw_set_valign(fa_left);
    //draw_set_color(hex_to_color("e7d07c"));
    draw_text_transformed(-144, room_height - 50, string(spr_name), 0.7, 0.7, 0);

    draw_text_transformed(10, room_height - 80, "loading...", 0.7, 0.7, 0);

    draw_set_halign(fa_right);
    draw_set_valign(fa_left);
	draw_set_color(c_white);
    draw_text_transformed(room_width - 10, room_height - 110, "yükleniyor\nlütfen bekleyin", 1, 1, 0);
} else {
    // Yükleme tamamlandıysa ayarları yaz ve odayı değiştir
    ini_open("settings.ini");
    ini_write_real("settings", "yeniden_baslatildi", 0);
    ini_close();

    instance_destroy();
    if global.ini_4 == 3 {
		room_goto(rm_menu_9);
		global.ini_4 = 2;
		ini_kaydet();
	}
	else {
		if global.ini_4 == 1 {
			global.ini_4 = 3;	
			ini_kaydet();
		}
		room_goto(rm_menu);
	}
}
