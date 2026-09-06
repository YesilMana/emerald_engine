// Kameranın anında ışınlanması gerekip gerekmediğini tutan lokal değişken
var snap_camera = false;

// === EKRAN VE KAMERA BOYUTUNU TETİKLEYECEK DURUMLARI KONTROL ET ===
if (last_inventory_state != global.envanter_ekrani_gorunme || 
    last_room_state != kamera_buyuk_odalar || 
    last_map_state != global.harita_uzaklasti) {
    
    // Eski durumları güncelle
    last_inventory_state = global.envanter_ekrani_gorunme;
    last_room_state = kamera_buyuk_odalar;
    last_map_state = global.harita_uzaklasti;
    
    // Durum değiştiğinde kameranın anında ışınlanması
    snap_camera = true;
    
    // 1. Kamera Görüş Alanını (View Size / Zoom) Belirle
    if (global.harita_uzaklasti) {
        current_res_w = global.RES_W * 2.8;
        current_res_h = global.RES_H * 2.8;
    }
    else if (global.envanter_ekrani_gorunme == true || kamera_buyuk_odalar) {
        current_res_w = global.RES_W;
        current_res_h = global.RES_H;
    }
    else {
        var normal_x = 400;
        var normal_y = 225;
        
        if ((global.android && !global.tablet_modu) || (global.klavye_kontrolleri && !global.tablet_modu)) {
            normal_y = 180;
        }
        current_res_w = normal_x;
        current_res_h = normal_y;
    }   
    
    // 2. Pencere ve Yüzey Boyutunu Belirle (Harita açılsa bile pencereyi sabit tutuyoruz)
    var surface_w = current_res_w;
    var surface_h = current_res_h;
    
    if (global.harita_uzaklasti) {
        surface_w = global.RES_W;
        surface_h = global.RES_H;
    }
    
    // Pencere ve yüzey boyutlarını güncelle
    window_set_size(surface_w * global.RES_SCALE, surface_h * global.RES_SCALE);
    surface_resize(application_surface, surface_w * global.RES_SCALE, surface_h * global.RES_SCALE);
    display_set_gui_size(surface_w, surface_h);
    
    // Pencereyi ekranda yeniden ortala
    var disp_w = display_get_width();
    var disp_h = display_get_height();
    var win_w = surface_w * global.RES_SCALE;
    var win_h = surface_h * global.RES_SCALE;
    window_set_position(disp_w/2 - win_w/2, disp_h/2 - win_h/2);
}

// === KAMERA TAKİP VE HESAPLAMALARI ===

// Kamera boyutunu güncelle
var camW = current_res_w; 
var camH = current_res_h; 
camera_set_view_size(camera, camW, camH);

// Kamera mevcut konumunu al
var camX = camera_get_view_x(camera);
var camY = camera_get_view_y(camera);

// Hedef pozisyonu belirle
var targetX, targetY;
if (instance_exists(global.kamera_takibi)) {
    targetX = global.kamera_takibi.x - camW / 2;
    targetY = global.kamera_takibi.y - camH / 2;
}
else {
    targetX = (room_width / 2) - camW / 2;
    targetY = (room_height / 2) - camH / 2;
}

// === KAMERA SINIRLAMA ve ORTALAMA ===
if (camW < room_width) {
    targetX = clamp(targetX, 0, room_width - camW);
} else {
    targetX = (room_width - camW) / 2;
}

if (camH < room_height) {
    targetY = clamp(targetY, 0, room_height - camH);
} else {
    targetY = (room_height - camH) / 2;
}

// === IŞINLANMA VEYA YUMUŞAK TAKİP KONTROLÜ ===
if (snap_camera) {
    camX = targetX;
    camY = targetY;
} else {
    camX = lerp(camX, targetX, global.CAM_SMOOTH);
    camY = lerp(camY, targetY, global.CAM_SMOOTH);
}

// === TİTREŞİM EFEKTİ ===
camX += random_range(-shake_remain, shake_remain);
camY += random_range(-shake_remain, shake_remain);

if (shake_remain > 0) {
    shake_remain = max(0, shake_remain - ((1 / shake_length) * shake_magnitude));
}

// Kamerayı son konuma taşı
camera_set_view_pos(camera, camX, camY);