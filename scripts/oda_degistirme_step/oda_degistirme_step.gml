function oda_degistirme_step(){//Odaya gitme objelerinin içindeki kod buraya bağlanır
	image_alpha = 0;
	if place_meeting(x, y, global.cikolata) {
		odaya_git(1, rm_mahalle_1, 830, 1285); 
		odaya_git(3, rm_pelin_ev_1, 378, 214); 
	}
}