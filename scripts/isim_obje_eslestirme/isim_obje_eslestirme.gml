function isim_obje_eslestirme(konusan_kisi_isim){
	var konusan_obje = noone;
    switch (konusan_kisi_isim) {
        case "Pelin":
        case "pelin":
        case "İç Ses":
            konusan_obje = global.cikolata;
            break;

        case "Eymen":
        case "eymen":
            konusan_obje = obj_npc_eymen;
            break;

        case "Helda":
        case "helda":
            konusan_obje = obj_npc_helda;
            break;

        case "Halil Bakkal":
        case "Halil bakkal":
		case "Halil":
            konusan_obje = obj_npc_halil;
            break;

        case "Vince":
        case "vince":
            konusan_obje = obj_npc_vince;
            break;

        case "Ozan":
        case "ozan":
            konusan_obje = obj_npc_ozan;
            break;

        case "Hamza":
        case "hamza":
            konusan_obje = obj_npc_hamza;
            break;

        case "Bilal":
        case "bilal":
            konusan_obje = obj_npc_bilal;
            break;

    }
	
	return konusan_obje;
}