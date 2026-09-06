/// STEP EVENT (opsiyonel - runtime ayarları için)
// Tuşlarla ayar yapabilirsiniz (test için)
if (keyboard_check_pressed(ord("1"))) {
    tint_strength = clamp(tint_strength - 0.1, 0, 1);
    show_debug_message("Tint Strength: " + string(tint_strength));
}
if (keyboard_check_pressed(ord("2"))) {
    tint_strength = clamp(tint_strength + 0.1, 0, 1);
    show_debug_message("Tint Strength: " + string(tint_strength));
}
