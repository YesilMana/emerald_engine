draw_set_colour(c_black);
draw_set_alpha(1);
draw_rectangle(-4000, -4000, 4000, 4000, false);
draw_set_colour(c_white);

draw_sprite_ext(sprite_index, image_index, x, y + (random_range(-2, 2)), image_xscale, image_yscale, image_angle, c_white, random_range(0.4, 0.5));