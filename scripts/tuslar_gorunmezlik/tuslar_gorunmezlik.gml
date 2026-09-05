function tuslar_gorunmezlik(){
	if global.yukari_basildi || global.asagi_basildi || global.sol_basildi || global.sag_basildi {
		global.z_basilabilir = false;
		global.x_basilabilir = false;
	}
	
	if !global.android && instance_exists(obj_z_tus) {
		obj_z_tus.image_alpha = 0;	
	}
}