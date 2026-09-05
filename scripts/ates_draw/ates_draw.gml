function ates_draw(){
	draw_sprite_ext(yanacak_temel, image_index, x, y, image_xscale, image_yscale, image_angle, c_white, image_alpha);
    if variable_instance_exists(id, "ates_no") {
        var yaniyor_0 = global.ates_map[? string(ates_no)];
        
        // ✅ Kontrol ekle
        if (is_undefined(yaniyor_0)) {
            show_debug_message("HATA: ates_no " + string(ates_no) + " için global.ates_map içinde veri yok!");
            return; // Fonksiyondan çık
        }
        
        var yaniyor_1 = yaniyor_0[? "sure"];
        
        if yaniyor_1 > 0 {
            draw_sprite_ext(yanacak_ates, global.timer / 3, x, y, 1, 1, 0, c_white, 0.8);    
            draw_sprite_ext(spr_ates_ekrani_parlama, global.timer / 3, x, y + 5, 1, 1, 0, c_white, 0.35);
            draw_set_halign(fa_center);
            draw_set_valign(fa_center);
            static alpham = 0.7;
            if yurume_tusuna_basilmiyor {
                if alpham > 0 alpham -= 0.007;    
            }
            else {
                if alpham < 0.7 alpham += 0.03;    
            }
            draw_set_alpha(alpham);
            var dakika_1 = floor(yaniyor_1 / 60);
            var dakika = string(dakika_1);
            var saniye_1 = round(yaniyor_1 % 60);
            if saniye_1 < 10 var saniye = "0" + string(saniye_1);
            else var saniye = string(saniye_1);
            var yazilacak = dakika + " . " + saniye;
            if !gui_yok_olma sayfa_yaz(x, y - 40, yazilacak, global.envanter_yazi_scale, , global.alt_baslik);
            draw_set_alpha(1);
        }
    }
}