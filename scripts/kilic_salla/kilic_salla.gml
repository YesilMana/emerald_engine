function kilic_salla(kilic_numarasi, pitch = 1) {
	instance_create_layer(global.cikolata.x, global.cikolata.y, "esyalar", obj_kilic);
	var referans = global.siniflandirma_silahlar[? "esya_" + string(kilic_numarasi)];
	global.kilic_hasar = random_range(referans[? "hasar_1"], referans[? "hasar_2"]);
	global.kilic_enerji_dusus = referans[? "enerji_dusus"];
	global.silah_hasar_turu = referans[? "tip"];
	global.kilic_dayanliklilik_azalma = referans[? "dayanliklilik_dusus"];
	global.kilic_pitch = pitch;
}

function dayanliklilik_dus(dusecek) {
    var slot = global.envanter_list[| global.mini_envanter_secili];
    if (!ds_exists(slot, ds_type_map)) return;

    var val = slot[? "saglamlik"];

    if (is_undefined(val) || val == pointer_null) {
        val = 100;
    }

    val -= dusecek;
    slot[? "saglamlik"] = val;

    if (val < 0) {
        slot[? "esya"] = -1;
    }
}