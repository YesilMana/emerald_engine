function yagmur_olusum(){
	if global.yagmur_yagiyor && !yagmur_yagmayacak_odalar {
		if !instance_exists(obj_yagmur) {
			var olusacak_sayi = 150;
			if global.android olusacak_sayi = 50;
			repeat olusacak_sayi {
				instance_create_depth(0,0, 0, obj_yagmur);
			}
		}
	}
}