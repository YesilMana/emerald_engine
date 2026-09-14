function iki_kisi_yon_hesapla(temel, donulecek){
	if !instance_exists(temel) || !instance_exists(donulecek) exit;
    var aci = point_direction(temel.x, temel.y, donulecek.x, donulecek.y);
    var yon = "on";
    
    if (aci >= 45 && aci < 135) {
        yon = "arka"; // Yukarı bakıyor
    }
    else if (aci >= 135 && aci < 225) {
        yon = "sol"; // Sola bakıyor
    }
    else if (aci >= 225 && aci < 315) {
        yon = "on"; // Aşağı bakıyor
    }
    else {
        yon = "sag"; // 315 ile 45 derece arası (0 geçişi)
    }
    
    return yon;
}