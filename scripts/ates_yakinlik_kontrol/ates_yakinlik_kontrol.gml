function ates_yakinlik_kontrol() {
    // global.cikolata yoksa çık
    if (!instance_exists(global.cikolata)) {
        global.atese_yakin = false;
        return;
    }
    
    // Hiç ateş yoksa çık
    if (!instance_exists(obj_ates)) {
        global.atese_yakin = false;
        return;
    }
    
    // En yakın ateşi bul
    var enYakinAtes = instance_nearest(global.cikolata.x, global.cikolata.y, obj_ates);
    
    // En yakın ateşe olan mesafeyi hesapla
    var mesafe = point_distance(global.cikolata.x, global.cikolata.y, enYakinAtes.x, enYakinAtes.y);
    
    // Mesafe 100'den küçükse true, değilse false
    global.atese_yakin = (mesafe < global.atese_maksimum_uzaklik);
	
	if global.atese_yakin {
		global.en_yakin_ates = enYakinAtes;	
		global.ates_sicaklik = enYakinAtes.sicaklik;
	}

	else {
		global.en_yakin_ates = false;	
		global.ates_sicaklik = false;
	}
	//global.ates_ekrani_acildi = true;
	global.yakinlardaki_ates = enYakinAtes;
	
}

function sandik_yakinlik_kontrol() {
	// global.cikolata yoksa çık
    if (!instance_exists(global.cikolata)) {
        global.sandiga_yakin = false;
        return;
    }
    
    // Hiç ateş yoksa çık
    if (!instance_exists(obj_depolama_temel)) {
        global.sandiga_yakin = false;
        return;
    }
    
    // En yakın ateşi bul
    var enYakinSandik = instance_nearest(global.cikolata.x, global.cikolata.y, obj_depolama_temel);
    
    // En yakın ateşe olan mesafeyi hesapla
    var mesafe = point_distance(global.cikolata.x, global.cikolata.y, enYakinSandik.x, enYakinSandik.y);
    
    // Mesafe 100'den küçükse true, değilse false
    global.sandiga_yakin = (mesafe < 50);
	
	if global.sandiga_yakin {
		global.en_yakin_sandik = enYakinSandik;	
		global.sandik_numara = enYakinSandik.sandik_no;
	}

	else {
		global.en_yakin_sandik = false;	
		global.sandik_numara = false;
	}
	
	global.yakinlardaki_sandik = enYakinSandik;
}