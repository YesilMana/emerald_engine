function ekran_yazisi_draw_gui(){
    var yazi_opaklik_degisim = 0.02; 
    
    if (global.ekran_yazisi_opaklik > 0) {
        draw_set_alpha(global.ekran_yazisi_opaklik);
        draw_set_color(c_white);
        draw_set_halign(fa_center);
        draw_set_valign(fa_center);
		
		if global.ekran_yazisi_x == undefined global.ekran_yazisi_x = (display_get_gui_width()) / 2 + (global.ekran_yazisi_eklenecek_x);
		if global.ekran_yazisi_y == undefined global.ekran_yazisi_y = (display_get_gui_height()) / 2 + (global.ekran_yazisi_eklenecek_y);
		
		
		if global.ekran_yazisi_arka_plan_sprite != undefined {
			var scale = 0.54;
			if global.android && !global.tablet_modu || (!global.android && global.klavye_kontrolleri && !global.tablet_modu) scale = 0.44;
			draw_sprite_ext(global.ekran_yazisi_arka_plan_sprite, global.ekran_yazisi_arka_plan_sprite_index,  display_get_gui_width() / 2, display_get_gui_height() / 2, scale, scale, 0, c_white, global.ekran_yazisi_opaklik);
		}
		
       if !global.ekran_yazisi_korku {
		    var _olcek = global.envanter_yazi_scale * 2;
    
		    scribble(global.ekran_yazisi)
		        .align(fa_center, fa_center)                  // draw_set_halign ve valign (fa_center) karşılığı
		        .transform(_olcek, _olcek, 0)                  // x_scale, y_scale ve angle karşılığı
		        .blend(c_white, global.ekran_yazisi_opaklik)  // draw_set_alpha ve draw_set_color karşılığı
		        .draw(global.ekran_yazisi_x, global.ekran_yazisi_y);
		}
        else {
			draw_set_colour(choose(c_maroon, c_red));
			var sapma = 1;
			var cizim_y = random_range(display_get_gui_height() / 2 - sapma, display_get_gui_height() / 2 + sapma); 
			var opaklik = random_range(global.ekran_yazisi_opaklik / 3, global.ekran_yazisi_opaklik);
			draw_set_alpha(opaklik);
			draw_text_transformed(display_get_gui_width() / 2, cizim_y, global.ekran_yazisi, global.envanter_yazi_scale * 2, global.envanter_yazi_scale * 2, 0);
		}
		draw_set_alpha(1);
		draw_set_colour(c_white);
        draw_set_halign(fa_left);
        draw_set_valign(fa_top);
    }

    if (global.ekran_yazisi_gorunecek_saniye > 0) {
        if (global.ekran_yazisi_opaklik < 1) {
            global.ekran_yazisi_opaklik += yazi_opaklik_degisim;    
        }
        
        global.ekran_yazisi_gecen_frame += 1;
        
        if (global.ekran_yazisi_gecen_frame >= global.ekran_yazisi_gorunecek_saniye * game_get_speed(gamespeed_fps)) {
            global.ekran_yazisi_gorunecek_saniye = 0;
            global.ekran_yazisi_gecen_frame = 0;
        }
    }    
    else {
        if (global.ekran_yazisi_opaklik > 0) {
            global.ekran_yazisi_opaklik -= yazi_opaklik_degisim;
        }
    }
}

function ekran_yazisi_yaz(yazi, duracagi_saniye, korku = false, _x = undefined, _y = undefined, renk = c_white, arka_plan_sprite = undefined, karartma = undefined, eklenecek_x = 0, eklenecek_y = 0) {
    global.ekran_yazisi = yazi;
    global.ekran_yazisi_gorunecek_saniye = duracagi_saniye;
    global.ekran_yazisi_gorunen_saniye = 0;
    global.ekran_yazisi_gecen_frame = 0; 
	global.ekran_yazisi_opaklik = 0; 
	global.ekran_yazisi_korku = korku;
	global.ekran_yazisi_x = _x;
	global.ekran_yazisi_y = _y;
	global.ekran_yazisi_renk = renk;
	global.ekran_yazisi_arka_plan_sprite = arka_plan_sprite;
	if karartma != undefined {
		karart(duracagi_saniye - 1);	
	}
	global.ekran_yazisi_eklenecek_x = eklenecek_x;
	global.ekran_yazisi_eklenecek_y = eklenecek_y;
}