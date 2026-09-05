function her_oda_create(){
	depth = -10000; //Temel uzaklık eksi on bin
	//Seçimlerde kullanacağımız atamaların tanımlanması
	secim_1 = 1;
	secim_2 = 1;
	secim_3 = 1;
	secim_4 = 1;
	secim_5 = 1;
	secim_6 = 1;
	secim_7 = 1;
	secim_8 = 1;
	secim_9 = 1;
	secim_10 = 1;
	
	if !oyun_disi_odalar {
		if !instance_exists(obj_z_tus) instance_create_depth(0, 0, -10000, obj_z_tus);
		//if !instance_exists(obj_x_tus) instance_create_depth(0, 0, -10000, obj_x_tus);
		//if !instance_exists(obj_shift) instance_create_depth(0, 0, -10000, obj_shift);
		if !instance_exists(obj_menu_tus) instance_create_depth(0, 0, -10000, obj_menu_tus);
		//if !instance_exists(obj_envanter) instance_create_depth(0, 0, -10000, obj_envanter);
		if !instance_exists(obj_harita_tus) instance_create_depth(0, 0, -10000, obj_harita_tus);
		//if !instance_exists(obj_ana_menuye_don) instance_create_depth(0, 0, -10000, obj_ana_menuye_don);
	}
}