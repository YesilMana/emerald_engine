function hayvan_ic_ice_gecme_engelleme(){
    var diger_hayvan = instance_place(x, y, object_index);

    if (diger_hayvan != noone) {
        
        var itme_yonu = point_direction(diger_hayvan.x, diger_hayvan.y, x, y);
        
        var itme_gucu = anlik_hiz; 
        
        var dx = lengthdir_x(itme_gucu, itme_yonu);
        var dy = lengthdir_y(itme_gucu, itme_yonu);
        x += dx;
        y += dy;
    }
}