function sekmeler(){
	
}

function sekme_draw() {
	if !global.kontrol_menusu_acik exit;
	
	if (global.sekme == 1) {
	    var cizim_ismi = spr_tabula_sinirli;
    
	    var scale = global.tabula_cizim_scale;
	    var renk = global.tabula_cizim_renk;
	    var angle = global.tabula_cizim_angle;
	    var _x = global.tabula_cizim_x;
	    var _y = global.tabula_cizim_y;
	    var opaklik = global.tabula_cizim_opaklik;
    
	    var alt_sinir = global.kontrol_menusu_sabit_y + (sprite_get_height(spr_menu) * 2) - (global.kareler_kenar_bosluklari * 8);
	    var ust_sinir = global.kontrol_menusu_sabit_y;
    
	    if (ust_sinir >= 0 && alt_sinir > ust_sinir) {
	        gpu_set_scissor(
	            0, 
	            ust_sinir, 
	            display_get_gui_width(), 
	            alt_sinir - ust_sinir
	        );
	    }
	    draw_sprite_ext(cizim_ismi, global.timer % 5, _x, _y, scale, scale, angle, renk, opaklik);
		
	    if (ust_sinir >= 0 && alt_sinir > ust_sinir) {
	        gpu_set_scissor(0, 0, display_get_gui_width(), display_get_gui_height());
	    }
	}
	if global.sekme == 2 {
		draw_set_colour(c_black);
		var tablet_sol = (room_width / 2) - sprite_get_width(spr_menu) + (global.kareler_kenar_bosluklari * 12);
		var tablet_ust = global.kontrol_menusu_sabit_y + (global.kareler_kenar_bosluklari * 6);
		
		draw_set_halign(fa_center);
		draw_set_valign(fa_center);
		draw_text_transformed(room_width / 2, tablet_ust, global.genel_yazilar[1], 1, 1, 0);
		
		draw_set_halign(fa_left);
		draw_set_valign(fa_left);
		var stats_sayilari = 4;
		
		for(var i = 2; i < 2 + stats_sayilari; i++) {
			var renk = c_black;
			var anahtar = "sabir";
			if i == 2 {
				anahtar = "sabir";
				renk = hex_to_color("a88d07");
			}
			if i == 3 {
				anahtar = "empati";
				renk = hex_to_color("003d7a");
			}
			if i == 4 {
				anahtar = "otorite";
				renk = hex_to_color("7a0a00");
			}
			if i == 5 {
				anahtar = "sefkat";
				renk = hex_to_color("237a32");
			}
			
			draw_set_colour(renk);
			var metin = global.genel_yazilar[i] + ": " + 
			string(global.chatterbox_verileri.oyuncu_stat_cek(anahtar));
			draw_text_transformed(tablet_sol, tablet_ust + (i * 45), metin, 1, 1, 0);
			
			draw_set_colour(c_white);
		}			
	}
}