function nesne_carpmama(obj) {
	if is_undefined(obj) exit;
	//Nesnelerle çarpışma scripti (Dokunulması önerilmez)
    // Eğer verilen obj ile çarpışma varsa
    if instance_exists(obj) && (place_meeting(x, y, obj)) && !global.karakter_yurutuluyor {
        var step = 1; // Daha küçük adımlarla ilerleyerek boşluk arıyoruz
        for (var i = step; i <= 32; i += step) {
            // Önce sağa ve sola bak:
            if (!place_meeting(x + i, y, obj)) { x += i; return true; }
            if (!place_meeting(x - i, y, obj)) { x -= i; return true; }
            
            // Sonra yukarı ve aşağı bak:
            if (!place_meeting(x, y - i, obj)) { y -= i; return true; }
            if (!place_meeting(x, y + i, obj)) { y += i; return true; }
            
            // En son çapraz yönlere bak:
            if (!place_meeting(x + i, y - i, obj)) { x += i; y -= i; return true; }
            if (!place_meeting(x - i, y - i, obj)) { x -= i; y -= i; return true; }
            if (!place_meeting(x + i, y + i, obj)) { x += i; y += i; return true; }
            if (!place_meeting(x - i, y + i, obj)) { x -= i; y += i; return true; }
        }
        // Eğer hiçbir yönde boşluk bulunamadıysa, yine de çarpışma mevcuttur.
        return true;
    }
    // Çarpışma yoksa:
    return false;
}
