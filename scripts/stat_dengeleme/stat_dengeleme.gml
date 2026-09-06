function stat_dengeleme(){
	if global.kalori < 25 {
		global.kalori = irandom_range(25, 40);	
	}
	if global.su < 25 {
		global.su = irandom_range(25, 40);	
	}
	if global.sicaklik < 25 {
		global.sicaklik = irandom_range(25, 40);	
	}
	if global.can < 25 {
		global.can = irandom_range(25, 40);	
	}
}

function stat_fulleme(){
	global.kalori = 100;
	global.su = 100;
	global.sicaklik = 100;
	global.can = 100;
}

