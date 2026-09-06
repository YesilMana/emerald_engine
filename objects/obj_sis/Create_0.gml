// KONUM
x = random(room_width);
y = random(room_height);

// HAREKET (Sadece Yatay)
// -1: Sola, 1: Sağa. İkisinden birini seçer.
yon = choose(-1, 1); 

// HIZ (Çok çok yavaşlattık)
// Eskiden 0.5'ti, şimdi 0.05 ile 0.2 arasında. Neredeyse duruyor gibi yüzecekler.
hiz = random_range(0.05, 0.2); 

// GÖRÜNÜM & OPAKLIK (Daha Silik)
// Tozlar ekranda bembeyaz patlamasın diye max opaklığı düşürdük.
// En fazla 0.15 olacak (yani %15 görünürlük), çoğu daha da silik olacak.
image_alpha = 0; 
max_alpha = random_range(0.01, 0.1); 

// BOYUT
// Hepsi aynı boyda olmasın, derinlik katar.
scale = random_range(0.1, 0.4);
image_xscale = scale;
image_yscale = scale;

// AÇI
// Hafif yamuk dursunlar, dümdüz yuvarlak gibi görünmesin.
image_angle = random(360);
donus_hizi = random_range(-0.2, 0.2); // Kendi etrafında çok yavaş dönecek

opaklik = image_alpha;