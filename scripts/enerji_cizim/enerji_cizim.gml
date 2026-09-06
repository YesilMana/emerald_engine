function enerji_cizim(){
	//Karakterin enerji barının çizimi
	if global.karakter_enerji <= global.karakter_enerji_full - 1 && global.karakter_enerji >= 0  && !karakter_yuruyemez && !gui_yok_olma {
		draw_sprite_ext(spr_hiz, global.karakter_enerji, global.cikolata.x, global.cikolata.y - 10, 0.3, 0.5, 0, c_white, 0.7);	
	}
}