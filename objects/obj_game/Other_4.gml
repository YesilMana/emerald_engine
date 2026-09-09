for (var i = 1; i <= 20; i++) {
    global.sira[i] = 0;
}
if (!oyun_disi_odalar) {
	karakter_her_oda_baslama();
	npc_oda_dogum();
	takipci_oda_baslangic();
	esya_konum_yerlestirme();
	tum_gidecekleri_oda_gecisi_duzenleme();
}
oda_baslama();
