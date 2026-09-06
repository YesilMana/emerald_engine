function kamera_konusana_kilitlenme(){
	if instance_exists(global.anlik_konusan_kisi) {
		global.kamera_takibi = global.anlik_konusan_kisi;	
	}
	else {
		global.kamera_takibi = global.cikolata;	
	}
}

function kamera_sifirla() {
	global.kamera_takibi = global.cikolata;	
}