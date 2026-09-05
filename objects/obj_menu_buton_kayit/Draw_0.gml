var renk_kaymasi = 1;
draw_sprite_ext(sprite_index, image_index, x + renk_kaymasi, y - renk_kaymasi, image_xscale, image_yscale, 0, c_green, 1);
draw_sprite_ext(sprite_index, image_index, x - renk_kaymasi, y + renk_kaymasi, image_xscale, image_yscale, 0, c_maroon, 1);
if islev != 0 && aktif_mi kendini_ciz(hex_to_color(renk));
if !aktif_mi kendini_ciz(c_gray);



draw_sprite_ext(sprite_index, 1, x, y, image_xscale, image_yscale, 0, c_olive, uzerine_gelme_alpha);	


draw_set_halign(fa_center);
draw_set_valign(fa_center);
draw_set_colour(global.baslik);

var scale = global.envanter_yazi_scale * 1.6;
var y_ = y + 1;


draw_text_transformed(x, y_, string(islev) + " " + global.genel_yazilar[209], scale, scale, 0);
	