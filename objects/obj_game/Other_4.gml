for (var i = 1; i <= 20; i++) {
    global.sira[i] = 0;
}
if (!oyun_disi_odalar) {
	instance_destroy(global.cikolata);
	instance_create_depth(global.karakter_dogur_x, global.karakter_dogur_y, 0, global.cikolata);
	npc_oda_dogum();
	takipci_oda_baslangic();
	esya_konum_yerlestirme();
	tum_gidecekleri_oda_gecisi_duzenleme();
}
oda_baslama();
