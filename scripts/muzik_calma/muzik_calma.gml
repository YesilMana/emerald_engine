function muzik_calma(){

	ses_cikaran_obje(obj_menu_music, 9999, global.mus_menu, , 2);
	ses_cikaran_obje(obj_sahil, 9999, global.sfx_sahil, , 1);
	tek_seferlik_ses(obj_marti, 100000, global.sfx_marti, 1000, 2);
	ses_cikaran_obje(obj_dark_things, 100000, mus_dark_things, , 2);
	ses_cikaran_obje(obj_tekinsiz_vadi, 100000, mus_tekinsiz_vadi, , 2);
	ses_cikaran_obje(obj_yangin_ses, 100000, sfx_ates_yanma, , 1);
	ses_cikaran_obje(obj_ozan_delirme_muzik, 100000, mus_yangin_ilk_muzik, , 2);
	ses_cikaran_obje(obj_ev_ici_1, 100000, mus_ev_ici_1, , 2);
	ses_cikaran_obje(obj_mahalle_muzik, 100000, mus_mahalle_ambiyans, , 2);
	
	
	orman_sesleri();
    ates_ses_calma();
}

function orman_sesleri() {
	tek_seferlik_ses(obj_orman_ambiyans, 10000, global.sfx_orman_1, 4000, 5);
	tek_seferlik_ses(obj_orman_ambiyans, 10000, global.sfx_orman_3, 6000, 5);
	tek_seferlik_ses(obj_orman_ambiyans, 10000, global.sfx_orman_4, 4000, 5);
	tek_seferlik_ses(obj_orman_ambiyans, 10000, global.sfx_orman_5, 5000, 5);
	tek_seferlik_ses(obj_orman_ambiyans, 10000, global.sfx_orman_6, 5000, 5);
	tek_seferlik_ses(obj_orman_ambiyans, 10000, global.sfx_orman_7, 9000, 5);
	
	tek_seferlik_ses(obj_orman_ambiyans_1, 10000, global.sfx_orman_1, 100, 5);
	tek_seferlik_ses(obj_orman_ambiyans_1, 10000, global.sfx_orman_3, 600, 5);
	tek_seferlik_ses(obj_orman_ambiyans_1, 10000, global.sfx_orman_4, 400, 5);
	tek_seferlik_ses(obj_orman_ambiyans_1, 10000, global.sfx_orman_5, 200, 5);
	tek_seferlik_ses(obj_orman_ambiyans_1, 10000, global.sfx_orman_6, 100, 5);
}
