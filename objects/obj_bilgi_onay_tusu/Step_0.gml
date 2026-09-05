if instance_exists(obj_secenekler_bilgi_metni) {
	x = obj_secenekler_bilgi_metni.x + 35;
	y = obj_secenekler_bilgi_metni.y + 60;	
}

if (kapatma_sayaci > 0) {
    kapatma_sayaci -= 1;
    
    if (kapatma_sayaci == 0) {
        global.bilgi_onay = false; 
		global.bilgi_onaylandi = true;
        global.aktiflik_timer = global.timer;
        bilgi_onay_sayilar(global.islem_sayisi);
        kapatma_sayaci = -1;
    }
}

if instance_place(x, y, obj_mouse) {
    if mouse_check_button_pressed(mb_left) {
        kapatma_sayaci = 1; 
    }
}
