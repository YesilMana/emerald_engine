function karakter_don(donecegi_yon, karakter, KARAKTER_YONUNU_DON_KULLAN) {
	if donecegi_yon == "sag" {
		karakter.sprite_index = karakter.karakter_animasyon.Yan;
		karakter.image_xscale = scalem;
	}
	else if donecegi_yon == "sol" {
		karakter.sprite_index = karakter.karakter_animasyon.Yan;
		karakter.image_xscale = -scalem;
	}
	else if donecegi_yon == "On" {
		karakter.sprite_index = karakter.karakter_animasyon.On;
	}
	else if donecegi_yon == "Arka" {
		karakter.sprite_index = karakter.karakter_animasyon.Arka;
	}
}