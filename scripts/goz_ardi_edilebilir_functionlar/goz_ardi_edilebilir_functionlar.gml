function dil_kontrolu() {
	var _os_kod = string_lower(os_get_language());
	var _secilen_dil = "english";

	switch (_os_kod) {
	    case "tr":
	    case "tr_TR":
	    case "tr-TR":
	        _secilen_dil = "turkish";
	    break;
        
	    case "en":
	    case "en_US":
	    case "en_GB":
	    case "en-US":
	    case "en-GB":
	        _secilen_dil = "english";
	    break;
        
	    case "de":
	    case "de_DE":
	    case "de_AT":
	    case "de_CH":
	    case "de-DE":
	        _secilen_dil = "german";
	    break;
        
	    case "es":
	    case "es_ES":
	    case "es_MX":
	    case "es_419":
	    case "es-ES":
	    case "es-MX":
	    case "es-419":
	        _secilen_dil = "spanish";
	    break;
        
	    case "pl":
	    case "pl_PL":
	    case "pl-PL":
	        _secilen_dil = "polish";
	    break;
        
	    case "ru":
	    case "ru_RU":
	    case "ru_BY":
	    case "ru_KZ":
	    case "ru-RU":
	        _secilen_dil = "russian";
	    break;
        
	    case "pt":
	    case "pt_BR":
	    case "pt_PT":
	    case "pt-BR":
	    case "pt-PT":
	        _secilen_dil = "portuguese";
	    break;
		
		case "it":
		case "it_IT":
		case "it-IT":
		case "it_CH": 
		    _secilen_dil = "italian";
		break;
		
		case "fr":
		case "fr_FR":
		case "fr-FR":
		case "fr_CA":
		case "fr-CA":
		case "fr_BE":
		case "fr_CH":
		case "fr_LU":
		    _secilen_dil = "french";
		break;
   
	    default:
	        _secilen_dil = "english";
	    break;
	}
	
	return _secilen_dil;
}

function her_oda_step(){
	her_oda_stepin_baslangici();
	hikaye_kontrolu_eventleri();
	obje_konusmalari_toplu();
	konusma_tetikleyiciler();
}

function obje_konusmalari_toplu() {
    if (obje_konusmalari(obj_konusma_temel, true)) {
		if global.en_yakin_obje.konusma_no != undefined {
			konusma_hazirla(global.en_yakin_obje.konusma_no, true);
		}
    }
}

function surekli_hikaye(){
	oyun_ici_kontroller();
	kamera_yurumeleri();
	yurutme_step();
	if global.timer % 10 != 0 exit;
	yagmur_olusum();
	gelistirici();
	bolumler();
}

function oyun_ici_kontroller() { //her frame'de çalışır
	sistemsel_kontroller();
	srb_karanlik_numaralar();
	bildirim_kontrolleri();
    yagmur_efektleri();
	karakter_son_konumlar();
}

function karakter_son_konumlar() {
	
	if (instance_exists(global.cikolata)) {

	    with (global.cikolata) {

	        if global.timer % 6 == 0 {
		        if (x != xprevious || y != yprevious) {
		            array_insert(global.gecmis_x, 0, x);
		            array_insert(global.gecmis_y, 0, y);
					
		            if (array_length(global.gecmis_x) > 350) {
		                array_pop(global.gecmis_x);
		                array_pop(global.gecmis_y);
		            }
		        }
			}
	    }
	}	
}