function hex_to_color(hex) {
    var r = real("0x" + string_copy(hex, 1, 2));
    var g = real("0x" + string_copy(hex, 3, 2));
    var b = real("0x" + string_copy(hex, 5, 2));
    return make_color_rgb(r, g, b);
}
