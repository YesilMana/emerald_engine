function hayvan_hasar_yeme(){

	if (image_index >= image_number - 1) {
		if can <= 0 && hareket_sureci != hayvan_hareket.olum {
			hareket_sureci = hayvan_hareket.olum;	
		}
		
		else {
			hareket_sureci = hayvan_hareket.idle;	
			
		}
	}
	else {
		hasar_aldi = true;
	}
}

function hayvan_can_dusme(deger) {
	if kalkan > 0 {
		kalkan -= deger;	
	}
	else {
		can -= deger;
	}
}

function hayvan_can_artma(deger) {
	can += deger;
}