// KONUM
x = random(room_width);
y = random(room_height);

// HAREKET (Sadece Yatay)
// -1: Sola, 1: Sağa. İkisinden birini seçer.
yon = 1


renk = choose(
make_color_rgb(205, 133, 63), // Kahverengi
make_color_rgb(255, 140, 0), // Turuncu
make_color_rgb(178, 34, 34), // Kırmızı
make_color_rgb(255, 165, 0), // Portakal
make_color_rgb(165, 42, 42)  // Kahverengi
);

// HIZ (Çok çok yavaşlattık)
// Eskiden 0.5'ti, şimdi 0.05 ile 0.2 arasında. Neredeyse duruyor gibi yüzecekler.
hiz = random_range(0.05, 0.1); 

// GÖRÜNÜM & OPAKLIK (Daha Silik)
// Tozlar ekranda bembeyaz patlamasın diye max opaklığı düşürdük.
// En fazla 0.15 olacak (yani %15 görünürlük), çoğu daha da silik olacak.
image_alpha = 0; 
max_alpha = random_range(0.15, 0.25); 

// BOYUT
// Hepsi aynı boyda olmasın, derinlik katar.
scale = random_range(0.025, 0.035);
image_xscale = scale;
image_yscale = scale;

// AÇI
// Hafif yamuk dursunlar, dümdüz yuvarlak gibi görünmesin.
image_angle = random(360);
donus_hizi = random_range(0.1, 0.4); // Kendi etrafında çok yavaş dönecek

opaklik = image_alpha;