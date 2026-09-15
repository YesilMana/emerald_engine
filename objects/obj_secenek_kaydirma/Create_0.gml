hedef_scroll = 0;
gercek_scroll = 0;
scroll_hizi = 45;      // masaüstü tekerlek için
yumusatma = 0.18;
toplam_secenek_sayisi = 0;
gorunur_alan_yuksekligi = 0;
panel_ust_sinir = 0;

// --- YENİ: sürükleme (drag) için değişkenler ---
surukleniyor = false;
surukleme_baslangic_y = 0;
onceki_dokunma_y = 0;
surukleme_hizi = 0;      // parmağın anlık hızı (momentum için)
momentum = 0;             // bırakınca devam eden kayma hızı
momentum_surtunme = 0.92; // her adımda momentum bu oranla azalır (1'e yakın = uzun kayar)
surukleme_esigi = 8;      // bu kadar pikselden az hareket "tıklama" sayılır, scroll değil