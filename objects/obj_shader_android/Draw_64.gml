/// DRAW GUI EVENT
var gui_w = display_get_gui_width();
var gui_h = display_get_gui_height();

shader_set(shd_retro_android);
shader_set_uniform_f_array(u_colorTint, color_tint);
shader_set_uniform_f(u_tintStrength, tint_strength);
shader_set_uniform_f(u_contrast, contrast);
shader_set_uniform_f(u_saturation, saturation);

draw_surface_stretched(application_surface, 0, 0, gui_w, gui_h);

shader_reset();
