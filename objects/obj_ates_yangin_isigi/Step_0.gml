parlama_scale = random_range(1.6, 2.1);
parlama_opaklik = random_range(0.2, 0.3);
image_xscale = parlama_scale;
image_yscale = parlama_scale;
image_alpha = parlama_opaklik;

if global.hikaye_kontrolleri_255 == false image_alpha = 0;
