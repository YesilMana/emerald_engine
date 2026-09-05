kendini_ciz(global.gui_renk);

draw_set_halign(fa_center);
draw_set_valign(fa_center);

var bosluk_x = (sprite_get_width(sprite_index) * image_xscale) / 2;
var bosluk_y = ((sprite_get_height(sprite_index) * image_yscale) / 2) - 15;

var metin = wrap_text(global.bilgi_onay_metin, 40);

draw_text_transformed(x + bosluk_x, y + bosluk_y, metin, global.envanter_yazi_scale, global.envanter_yazi_scale, 0);