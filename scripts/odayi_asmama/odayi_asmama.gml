function odayi_asmama(obj, hiz){
	//Karakterin odanın dışına çıkmasını engelleyen script
	if instance_exists(obj) {
		with (obj) {
			if hiz != undefined var sabit_hiz = hiz;
			else var sabit_hiz = global.cikolata_simdiki_hiz;
			if x + (sprite_width / 2) > room_width - sabit_hiz {
				x -= sabit_hiz;
			}
		
			if x + (sprite_width / 2) < sabit_hiz {
				x += sabit_hiz;	
			}
		
			if y + (sprite_height / 2) > room_height - sabit_hiz {
				y -= sabit_hiz;
			}
		
			if y - (sprite_height / 2) < sabit_hiz {
				y += sabit_hiz;
			}
			
			if x > room_width {
				x = room_width;	
			}
			
			if y > room_height {
				y = room_height;	
			}
			
			if y < 0 {
				y = 0;	
			}
			
			if x < 0 {
				x = 0;	
			}
		}	
	}
}