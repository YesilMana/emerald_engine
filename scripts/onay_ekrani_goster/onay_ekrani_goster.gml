function onay_ekrani_goster(bilgi_ekrani_yazacak_metin, tusta_yazacak_metin_1 = global.genel_yazilar[110], tusta_yazacak_metin_2 = global.genel_yazilar[112], sayi) {
	global.bilgi_onay = true;
	instance_create_depth(0, 0, 0, obj_secenekler_bilgi_metni);
	global.bilgi_onay_metin = bilgi_ekrani_yazacak_metin;
	global.bilgi_onay_tus_metin = tusta_yazacak_metin_1;
	global.bilgi_red_metin = tusta_yazacak_metin_2;
	global.islem_sayisi = sayi;
}