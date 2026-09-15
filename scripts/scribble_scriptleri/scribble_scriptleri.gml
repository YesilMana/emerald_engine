// 1. Font ve Stil Macroları
scribble_add_macro("oyuncu", function() {
	global.konusan = "oyuncu";
	return "[/c][c_yesil]";	
});
scribble_add_macro("tabula", function() {
	global.konusan = "tabula";
	return "[/c][c_mavi]";	
});

scribble_add_macro("oyuncu_ayarla", function() {
    global.saga_yatir = true;
});

scribble_add_macro("tabula_ayarla", function() {
    global.saga_yatir = false;
});

scribble_color_set("c_kirmizi", hex_to_color("7a0a00"));
scribble_color_set("c_yesil", hex_to_color("237a32"));
scribble_color_set("c_mavi", hex_to_color("003d7a"));
scribble_color_set("c_sari", hex_to_color("a88d07"));