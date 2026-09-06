/// @function ekran_titret(_miktar, _sure_frame);
/// @param {real} _miktar  - Titreşimin şiddeti (Piksel cinsinden, örn: 6)
/// @param {real} _sure    - Ne kadar süreceği (Frame cinsinden, örn: 30)

function ekran_titret(_miktar, _sure){
    // Kamera objesinin ismini buraya yazmalısın (Örn: obj_camera veya obj_controller)
    with (obj_camera_genel) { 
        shake_magnitude = _miktar;
        shake_remain = _miktar;
        shake_length = _sure;
    }
}