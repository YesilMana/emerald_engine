
// Hızlı preset'ler
function set_yellow_filter() {
    color_tint = [1.0, 0.9, 0.6];
    tint_strength = 0.4;
    contrast = 1.15;
    saturation = 0.85;
}

function set_blue_filter() {
    color_tint = [0.8, 0.9, 1.0];
    tint_strength = 0.5;
    contrast = 1.2;
    saturation = 0.9;
}

function set_sepia() {
    color_tint = [1.0, 0.8, 0.6];
    tint_strength = 0.6;
    contrast = 1.1;
    saturation = 0.7;
}

function set_vibrant() {
    color_tint = [1.0, 1.0, 1.0];
    tint_strength = 0.0;
    contrast = 1.3;
    saturation = 1.2;
}

function disable_filter() {
    tint_strength = 0.0;
    contrast = 1.0;
    saturation = 1.0;
}