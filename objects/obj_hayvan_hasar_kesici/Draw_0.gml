// Işık modunu aç (Renkleri üst üste bindirerek parlatır)
gpu_set_blendmode(bm_add);

// Efekti çiz (Tek ve net bir beyaz çizgi)
draw_sprite_ext(sprite_index, 0, x, y, image_xscale, image_yscale, image_angle, c_white, image_alpha);

// Ekstra Parlama (Opsiyonel):
// Eğer çok sönük gelirse, aynı kodu bir kez daha altına yapıştırabilirsin.
// İki kere üst üste çizince aşırı parlak bir "ışık hüzmesi" olur.
// draw_sprite_ext(sprite_index, 0, x, y, image_xscale * 1.5, image_yscale, image_angle, c_white, image_alpha * 0.5);

// Işık modunu kapat (Yoksa oyunun geri kalanı bozulur!)
gpu_set_blendmode(bm_normal);