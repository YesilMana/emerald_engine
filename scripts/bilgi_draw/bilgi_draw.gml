function bilgi_draw(){
    // Görünürlük kapalıysa çizme
    var bilgi_dusus = 0.005;
    
    global.bilgi_gorunurluk -= bilgi_dusus;
    if (global.bilgi_gorunurluk <= 0) {
        ds_list_clear(global.bilgiler);
        exit;
    }
    
    var cam = view_camera[0];
    var cam_x = camera_get_view_x(cam);
    var cam_y = camera_get_view_y(cam);
    var cam_w = camera_get_view_width(cam);
    
    var boyut = ds_list_size(global.bilgiler);
    var yazi_scale = global.envanter_yazi_scale;
    var satir_yuksekligi = 40 * yazi_scale;
    var baslangic_y = cam_y + 20;
    
    static renk_degisimi_sayac = 0;
    renk_degisimi_sayac += 0.08;

    // Mevcut Alpha Değerini Belirleme
    var gecerli_alpha = global.bilgi_gorunurluk;
    if (global.envanter_sekme == global.sekme_numara_ayarlar || oyun_dur || global.ates_yakim_basladi || gui_yok_olma) gecerli_alpha = 0; 
    
    // Eğer listede eleman varsa ve görünürlük 0'dan büyükse işlemleri yap
    if (boyut > 0 && gecerli_alpha > 0) {
        draw_set_halign(fa_right);
        draw_set_valign(fa_top); 
        
        // --- 1. AŞAMA: KUTU BOYUTLARINI HESAPLAMA ---
        var en_sol_x = cam_x + cam_w; // Başlangıç referansı olarak ekranın en sağını alıyoruz
        
        // Kutu içi boşluk ayarları (Tasarımını buradan ince ayarlayabilirsin)
        var pad_sol = 15; // En uzun yazının solu ile kutu kenarı arası boşluk
        var pad_sag = 10; // Yazıların sağı ile kutu kenarı arası boşluk
        var pad_ust = 7; // En üstteki yazının üstü ile kutu kenarı arası boşluk
        var pad_alt = 14; // En alttaki yazının altı ile kutu kenarı arası boşluk
        
        // Animasyonları güncelleyip, yazılardan en çok sola taşan noktayı (en_sol_x) buluyoruz
        for (var i = 0; i < boyut; i++) {
            var eleman = global.bilgiler[| i];
            var icerik = eleman[0];
            var x_kayma = eleman[1];
            
            x_kayma = lerp(x_kayma, 0, 0.15); 
            eleman[1] = x_kayma; // Kayma miktarını kaydet

            var yazi_genislik = string_width(string(icerik)) * yazi_scale;
            var o_anki_x = (cam_x + cam_w - 20) + x_kayma;
            var yazinin_sol_ucu = o_anki_x - yazi_genislik;

            if (yazinin_sol_ucu < en_sol_x) {
                en_sol_x = yazinin_sol_ucu; // Ekrandaki en sol noktayı güncelledik
            }
        }
        
        // --- 2. AŞAMA: TEK BİR ARKA PLAN KUTUSUNU ÇİZME ---
        var kutu_x = en_sol_x - pad_sol;
        var kutu_y = baslangic_y - pad_ust;
        var kutu_w = (cam_x + cam_w - 20 + pad_sag) - kutu_x; 
        var kutu_h = (boyut * satir_yuksekligi) + pad_alt; // Toplam eleman sayısına göre yükseklik
        
        draw_sprite_stretched_ext(spr_bilgi_arka_plan, 0, kutu_x, kutu_y, kutu_w, kutu_h, hex_to_color("a4967d"), clamp(gecerli_alpha, 0, 1));

        // --- 3. AŞAMA: YAZILARI ÇİZME ---
        for (var i = 0; i < boyut; i++) {
            var eleman = global.bilgiler[| i];
            var icerik = eleman[0];
            var x_kayma = eleman[1]; // lerp işlemi yukarıda yapıldığı için sadece okuyoruz

            var cizim_x = (cam_x + cam_w - 20) + x_kayma;
            var cizim_y = baslangic_y + (i * satir_yuksekligi);

            draw_set_alpha(gecerli_alpha);
            
            // Gölge (Siyah)
            draw_set_color(c_black);
            draw_text_transformed(cizim_x, cizim_y, string(icerik), yazi_scale, yazi_scale, 0);
            
            // Asıl Yazı
            if (round(renk_degisimi_sayac) % 8) == 0 draw_set_color(global.alt_baslik);
            else draw_set_color(global.baslik);
            
            draw_text_transformed(cizim_x - 0.8, cizim_y - 0.8, string(icerik), yazi_scale, yazi_scale, 0);
        }
        
        // Her şey bittikten sonra alphayı sıfırla
        draw_set_alpha(1);
    }
}


/*function bilgi_draw(){
    // Görünürlük kapalıysa çizme
    var bilgi_dusus = 0.005;
    
    global.bilgi_gorunurluk -= bilgi_dusus;
    if (global.bilgi_gorunurluk <= 0) {
        ds_list_clear(global.bilgiler);
        exit;
    }
    
    var cam = view_camera[0];
    var cam_x = camera_get_view_x(cam);
    var cam_y = camera_get_view_y(cam);
    var cam_w = camera_get_view_width(cam);
    
    var boyut = ds_list_size(global.bilgiler);
    var yazi_scale = global.envanter_yazi_scale + (global.envanter_yazi_scale / 2);
    var satir_yuksekligi = 43 * yazi_scale;
    
    // Referans noktası (Ekranın üstünden 20 piksel aşağısı)
    var baslangic_y = cam_y + 20;
	static renk_degisimi_sayac = 0;
	renk_degisimi_sayac += 0.08;

    // DÖNGÜ: Baştan (en eski) sona (en yeni) doğru
    // i = 0 en eski maddedir ve en üstte (baslangic_y) çizilir.
    for (var i = 0; i < boyut; i++) {
        
        var icerik = global.bilgiler[| i];

        draw_set_halign(fa_right);
        draw_set_valign(fa_top); // 'fa_bottom' yerine 'fa_top' daha stabil bir hizalama sağlar
        
        var cizim_x = cam_x + cam_w - 20;

        // i değeri arttıkça (yeni maddeler geldikçe) y değeri de artar (aşağı kayar).
        var cizim_y = baslangic_y + (i * satir_yuksekligi);
        
        draw_set_alpha(global.bilgi_gorunurluk);
        if (global.envanter_sekme == global.sekme_numara_ayarlar || oyun_dur || global.ates_yakim_basladi) draw_set_alpha(0); 
        
        // Gölge (Siyah)
        draw_set_color(c_black);
        draw_text_transformed(cizim_x, cizim_y, string(icerik), yazi_scale, yazi_scale, 0);
        
        // Asıl Yazı
		if (round(renk_degisimi_sayac) % 2) == 0 draw_set_color(global.baslik);
        else draw_set_color(global.alt_baslik);
		
        draw_text_transformed(cizim_x - 0.8, cizim_y - 0.8, string(icerik), yazi_scale, yazi_scale, 0);
        
        draw_set_alpha(1);
    }
}