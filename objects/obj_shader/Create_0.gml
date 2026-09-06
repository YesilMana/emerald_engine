/// CREATE EVENT
// Shader parametreleri


bloom_intensity = 0.01;      // Bloom gücü
vignette_intensity = 0.1;    // Vignette gücü
color_tint = [1.0, 0.9, 0.6];// Sarı/sıcak ton (RGB)
tint_strength = 0.4;         // Renk filtresi gücü
contrast = 1.15;             // Kontrast
saturation = 0.75;           // Doygunluk (biraz soluk)
grain = 0;                // Film grain miktarı

// Shader uniform konumları
u_bloomIntensity = shader_get_uniform(shd_retro_postprocess, "u_bloomIntensity");
u_vignetteIntensity = shader_get_uniform(shd_retro_postprocess, "u_vignetteIntensity");
u_colorTint = shader_get_uniform(shd_retro_postprocess, "u_colorTint");
u_tintStrength = shader_get_uniform(shd_retro_postprocess, "u_tintStrength");
u_contrast = shader_get_uniform(shd_retro_postprocess, "u_contrast");
u_saturation = shader_get_uniform(shd_retro_postprocess, "u_saturation");
u_grain = shader_get_uniform(shd_retro_postprocess, "u_grain");
u_time = shader_get_uniform(shd_retro_postprocess, "u_time");

// Surface
surf_screen = -1;