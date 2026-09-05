if variable_instance_exists(id, "kayit_numarasi") {
	if global.kayit_turuncusu[? string(kayit_numarasi)] == 0 {
		if instance_place(x, y, global.cikolata) {
			global.kayit_turuncusu[? string(kayit_numarasi)] = 1;
			kaydet();
		}
	}
	if global.kayit_turuncusu[? string(kayit_numarasi)] == 1 {
		instance_destroy();	
	}
	//show_debug_message(global.kayit_turuncusu[? string(kayit_numarasi)])
}