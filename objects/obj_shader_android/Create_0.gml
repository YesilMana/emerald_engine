/// CREATE EVENT
// Renk filtresi ayarları

color_tint = [1, 0.8, 0.5];
tint_strength = 0.6;
contrast = 1.3;
saturation = 0.7;

// Shader uniform'ları
u_colorTint = shader_get_uniform(shd_retro_android, "u_colorTint");
u_tintStrength = shader_get_uniform(shd_retro_android, "u_tintStrength");
u_contrast = shader_get_uniform(shd_retro_android, "u_contrast");
u_saturation = shader_get_uniform(shd_retro_android, "u_saturation");

degisim_gucu = 0;
kontrol_1 = 0;
