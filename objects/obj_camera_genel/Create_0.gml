var display_width = display_get_width();
// Bilgisayarın mevcut ekran genişliğini alır. Bu, oyunun pencere boyutlarını merkeze yerleştirmek için kullanılır.

var display_height = display_get_height();

// Create Event (obj_controller gibi bir nesnede)

view_enabled = true;
// Görünümleri (views) etkinleştirir. Görünümler, oyun dünyasının ekranda gösterilen bölümlerini kontrol eder.

view_visible[0] = true;
// Görünüm 0'ın (ana görünüm) ekranda görünür olmasını sağlar.
if instance_exists(global.cikolata) {
	camera = camera_create_view(global.karakter_isinla_x - global.RES_W / 2, global.karakter_isinla_y - global.RES_H / 2, global.RES_W, global.RES_H);
}

else {
	camera = camera_create_view(x - global.RES_W / 2, y - global.RES_H / 2, global.RES_W, global.RES_H);
}
// Bir kamera oluşturur. Kamera, belirli bir alanı göstermek için kullanılır.
// Kamera başlangıç pozisyonunu (x=0, y=0) ve gösterilecek alanın genişlik ve yüksekliğini (global.RES_W ve global.RES_H) ayarlar.

view_set_camera(0, camera);
// Kamera, 0 numaralı görünüme atanır. Bu, kamera ile ilişkilendirilen görünümü aktif hale getirir.

window_set_size(global.RES_W * global.RES_SCALE, global.RES_H * global.RES_SCALE);
// Oyun penceresinin fiziksel boyutlarını ayarlar. Çözünürlük, ölçek faktörüyle çarpılarak ekran boyutu belirlenir.

surface_resize(application_surface, global.RES_W * global.RES_SCALE, global.RES_H * global.RES_SCALE);
// Ana uygulama yüzeyinin boyutunu ayarlar. Bu, oyunun grafiklerinin çözünürlüğüne uygun şekilde çizilmesini sağlar.

display_set_gui_size(global.RES_W, global.RES_H);
// Grafiksel kullanıcı arayüzünün (GUI) boyutlarını ayarlar. Bu, GUI elemanlarının ölçeklenmeden doğru şekilde çizilmesini sağlar.

var display_width = display_get_width();
// Bilgisayarın mevcut ekran genişliğini alır. Bu, oyunun pencere boyutlarını merkeze yerleştirmek için kullanılır.

var display_height = display_get_height();
// Bilgisayarın mevcut ekran yüksekliğini alır. Bu da pencerenin doğru bir şekilde ortalanması için gereklidir.

var window_width = global.RES_W * global.RES_SCALE;
// Pencerenin genişliğini tanımlar. Bu, oyun çözünürlüğünün ölçek faktörüyle çarpımına eşittir.

var window_height = global.RES_H * global.RES_SCALE;
// Pencerenin yüksekliğini tanımlar. Bu, oyun çözünürlüğünün ölçek faktörüyle çarpımına eşittir.

window_set_position(display_width/2 - window_width/2, display_height/2 - window_height/2);
// Pencereyi ekranın tam ortasına yerleştirir. Ekran boyutlarının yarısından pencere boyutlarının yarısı çıkartılır.

// --- MEVCUT KODLARIN BURADA BİTİYOR ---

// TİTREŞİM DEĞİŞKENLERİ
shake_length = 0;    // Titreşimin ne kadar süreceği (örn: 60 frame)
shake_magnitude = 0; // Titreşimin şiddeti (örn: 6 piksel)
shake_remain = 0;    // Şu an kalan titreşim miktarı,


// --- MEVCUT KODLARIN BURADA BİTİYOR ---

// TİTREŞİM DEĞİŞKENLERİ
shake_length = 0;    // Titreşimin ne kadar süreceği (örn: 60 frame)
shake_magnitude = 0; // Titreşimin şiddeti (örn: 6 piksel)
shake_remain = 0;    // Şu an kalan titreşim miktarı

// DİNAMİK ÇÖZÜNÜRLÜK TAKİBİ
last_inventory_state = undefined; // Envanterin bir önceki durumunu tutar
current_res_w = global.RES_W;
current_res_h = global.RES_H;

last_room_state = undefined;
last_map_state = undefined;
last_manuel_state = undefined;