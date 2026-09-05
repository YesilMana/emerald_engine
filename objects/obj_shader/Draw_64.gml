/// DRAW GUI EVENT - KAMERA UYUMLU VERSİYON
// Kameranın viewport'unu al
var cam = view_camera[0]; // camera_0 kullanıyorsanız
var view_x = camera_get_view_x(cam);
var view_y = camera_get_view_y(cam);
var view_w = camera_get_view_width(cam);
var view_h = camera_get_view_height(cam);

// Application surface'ın gerçek boyutları
var surf_w = surface_get_width(application_surface);
var surf_h = surface_get_height(application_surface);

// GUI koordinatlarındaki viewport pozisyonu ve boyutu
var gui_w = display_get_gui_width();
var gui_h = display_get_gui_height();

// Shader'ı aktifleştir
shader_set(shd_retro_postprocess);

shader_set_uniform_f(u_bloomIntensity, bloom_intensity);
shader_set_uniform_f(u_vignetteIntensity, vignette_intensity);
shader_set_uniform_f_array(u_colorTint, color_tint);
shader_set_uniform_f(u_tintStrength, tint_strength);
shader_set_uniform_f(u_contrast, contrast);
shader_set_uniform_f(u_saturation, saturation);
shader_set_uniform_f(u_grain, grain);
shader_set_uniform_f(u_time, current_time / 1000.0);

// Application surface'ı GUI koordinatlarında çiz (ölçekleme ile)
draw_surface_stretched(application_surface, 0, 0, gui_w, gui_h);

shader_reset();