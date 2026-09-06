if islev != 0 kendini_ciz(hex_to_color("5c6b67"));


draw_set_halign(fa_center);
draw_set_valign(fa_center);
draw_set_colour(global.baslik);

var scale = global.envanter_yazi_scale * 1.6;
var y_ = y + 1;

if islev == 1 {
	draw_text_transformed(x, y_, global.genel_yazilar[145], scale, scale, 0);
}	

if islev == 2 {
	draw_text_transformed(x, y_, global.genel_yazilar[146], scale, scale, 0);
}	

if islev == 3 {
	draw_text_transformed(x, y_, global.genel_yazilar[147], scale, scale, 0);
}	

if islev == 4 {
	draw_text_transformed(x, y_, global.genel_yazilar[148], scale, scale, 0);
}	