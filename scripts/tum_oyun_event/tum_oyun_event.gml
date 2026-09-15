function game_create(){
	struct_create();
	konum_tanimlamalari();
}

function game_step(){
	konum_tanimlamalari();
	struct_step();
	sekmeler();
	sistem_kontrolleri();
	oyun_ici_kontrollerm();
}

function game_draw(){
	struct_draw();
	sekme_draw();
}
function game_draw_gui(){
	//shader_tablet_draw_gui();
}