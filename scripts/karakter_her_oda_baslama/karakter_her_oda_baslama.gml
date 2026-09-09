function karakter_her_oda_baslama(){
	instance_destroy(global.cikolata);
	var caklit = instance_create_depth(global.karakter_dogur_x, global.karakter_dogur_y, 0, global.cikolata);
	var _yon = global.karakter_bilgileri[? "yon"];
	
	if _yon == "sag" {
		caklit.sprite_index = global.cikolata.karakter_animasyon.Yan;
		caklit.image_xscale = 1;
	}
	else if _yon == "sol" {
		caklit.sprite_index = global.cikolata.karakter_animasyon.Yan;
		caklit.image_xscale = -1;
	}
	else if _yon == "on" {
		caklit.sprite_index = global.cikolata.karakter_animasyon.On;
	}
	else if _yon == "arka" {
		caklit.sprite_index = global.cikolata.karakter_animasyon.Arka;
	}
}