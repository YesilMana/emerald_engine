draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, c_white, opaklik * 5);


// Keskinliği azaltan ve kenarları yumuşatan blend modu
gpu_set_blendmode_ext(bm_src_alpha, bm_one); 

// Opaklık çarpanını biraz daha yumuşatarak dene (örneğin 4 yerine 2 veya 3)
kendini_ciz(renk);

gpu_set_blendmode(bm_normal);