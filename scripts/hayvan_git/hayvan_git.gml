function hayvan_git(x_, y_, hiz){
	if zaman_dur exit;
	var tolerans = 2;
	if abs(x - x_) < tolerans && abs(y - y_) < tolerans {
		sprite_index = asset_get_index("spr_" + obje_ismi + "_" + "idle");
	}
	else {
		mp_potential_step(x_, y_, hiz, false);
		
		if x_ > x {
			xscale = scale_temel;
		}
		else {
			xscale = -scale_temel;	
		}
	}
}