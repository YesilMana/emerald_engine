function her_oda_draw_gui(){
	ekran_ciz_draw();
	sabit_konusmalar();
	esya_yapim_draw_gui();
	ates_yakim_draw_gui();
	genel_bekleme_draw_gui();
	if global.karanlik_azalma karanlik_acilma(global.karanlik_hizi);
	if global.karanlik_artis karanlik_artma(global.karanlik_hizi);
	karanlik_cizim();
	flash_patlama_draw_gui();
	ara_sahne_draw_gui();
	dandik_ara_sahne_draw_gui();
	ekran_yazisi_draw_gui();
	z_tus_draw_gui();
}