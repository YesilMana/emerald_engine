image_xscale = 34.3;
image_yscale = 12;



opaklik = global.envanter_ekrani_gorunme;
depth = -10004;

var cam = view_camera[0];
var cam_x = camera_get_view_x(cam);
var cam_y = camera_get_view_y(cam);
var cam_w = camera_get_view_width(cam);
var cam_h = camera_get_view_height(cam);

x = cam_x + (cam_w / 2) - ((sprite_get_width(sprite_index) * image_xscale) / 2);
y = cam_y + (cam_h / 2) - ((sprite_get_height(sprite_index) * image_yscale) / 2);

temel_konum_x = x;
temel_konum_y = y;



instance_create_depth(x, y, depth, obj_bilgi_onay_tusu);
instance_create_depth(x, y, depth, obj_bilgi_red_tusu);