if instance_exists(obj_secenekler_bilgi_metni) {
	x = obj_secenekler_bilgi_metni.x + (sprite_get_width(obj_secenekler_bilgi_metni.sprite_index) * obj_secenekler_bilgi_metni.image_xscale - (sprite_get_width(sprite_index) * image_xscale) - 35);
	y = obj_secenekler_bilgi_metni.y + 60;	
}

if (kapatma_sayaci > 0) {
    kapatma_sayaci -= 1;
    
    if (kapatma_sayaci == 0) {
        global.bilgi_onay = false; 
        kapatma_sayaci = -1;
    }
}

if instance_place(x, y, obj_mouse) {
    if mouse_check_button_pressed(mb_left) {
        kapatma_sayaci = 1; 
    }
}
