function magara_karanligi(){
	if instance_exists(global.cikolata) && !oyun_disi_odalar && !global.hikaye_kontrolleri_124 {
		if global.hikaye_kontrolleri_38 == 1 {
			draw_sprite_ext(spr_karanlik_1, 0, global.cikolata.x, global.cikolata.y - 12, 3.5, 3.5, 0, c_white, 1);		
		}
		else if global.hikaye_kontrolleri_38 == 2 {
		    // 1. Hedef açıyı belirliyoruz
		    var hedef_egim = 0;
    
		    if global.kilic_yon == "sag" hedef_egim = 0;
		    if global.kilic_yon == "sol" hedef_egim = 180;
		    if global.kilic_yon == "asagi" hedef_egim = 270;
		    if global.kilic_yon == "yukari" hedef_egim = 90;
    
		    if !global.android hedef_egim = point_direction(global.cikolata.x, global.cikolata.y, obj_mouse.x, obj_mouse.y);
		    if global.android hedef_egim = global.joystick_acisi;
    
		    // 2. En kısa mesafeyi hesaplıyoruz
		    // angle_difference, iki açı arasındaki en kısa mesafeyi -180 ile 180 arasında verir.
		    // Böylece 270'ten 20'ye giderken ters yöne dönmez, 360'ı aşarak en kısa yoldan gider.
		    var fark = angle_difference(hedef_egim, global.fener_egim);
    
		    // 3. Yumuşak (Logaritmik/Ease-out) dönüşü uyguluyoruz
		    var donus_hizi = 0.08; // 0 ile 1 arası. 1 anında döner, 0 hiç dönmez. Hissi buradan ayarlayabilirsin.
		    global.fener_egim += fark * donus_hizi;
    
		    // 4. Çizim işlemi (artık "hedef_egim" değil, yavaşça dönen "fener_egim" kullanılıyor)
		    draw_sprite_ext(spr_el_feneri, 0, global.cikolata.x, global.cikolata.y - 12, 2, 2, global.fener_egim, c_white, 1);       
		}
	}
	global.hikaye_kontrolleri_124 = false;
}