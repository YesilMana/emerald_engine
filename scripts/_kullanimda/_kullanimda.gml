function _kullanimda(){
	//Hangi ara sahne kaç saniye gösterilecek
	//Boyutları ve indexi otomatik ayarlar
	//Karartıyı buradan ayarlama, kullanmadan önce ara sahnenin süresi kadar karart() saniyesi yazmayı unutma
	ara_sahne_yeni() 
	
	//Sahnedeki ateşin süresini belirler. Yanıp yanmayacağı süresine bağlıdır
	//Ateş No global.en_yakin_ates.ates_no ile bulunabilir ama risklidir
	ates_sure_degistir() 
	
	//Ateş numarası yazılır ve o numaralı ateşin kaç saniye yanacağını söyler
	ates_sure_getir()
	
	//Ekrana bekleme animasyonu getirir
	bekleme_animasyonu_calistir()
	
	//Bilgi ekranında bilgi varsa siler
	bilgi_sil()
	
	//Bilgi ekranında yeni bir bilgi verir
	//Tek seferde aynı yazı sadece bir kere eklenebilir
	//Her bilgide bildirim sesi otomatik gelir
	bilgi_ver()
	
	//Konuşmaların sonuna eklenir. Bu sayede konuşma bitince kalıntılar temizlenir
	bit()
	
	//Envanterde ilk boş slotun hangisi olduğunu döndürür
	bos_slotu_bul()
	
	//Ana karakterimizin çizimi buradan değişir
	//Tek bir kere çağırılması yeterlidir
	//Animasyon daha önceden globallerde tanımlanmış olmalıdır
	cikolata_sprite_degistir()
	
	//Eşya numarası yazılır ve karakterin bu craftı bilip bilmediğini söyler
	craft_etme_kontrol()
	
	//Karakterin elindeki eşyalar craft etmeye yeter mi döndürür
	craft_edilebilir_mi()
	
	//Craft edilecek nesnenin craft ekranında görünmesini sağlar
	craft_aktifles()
	
	//Hangi evente yazıldığına göre o framelerde y koordinatına göre derinlik verir
	derinlik(id)
	
	//Efektin kodu ve süresi yazılarak eklenir
	efekt_ekle()
	
	//Efektleri sil veya tamamını temizle
	efekt_sil()
	efekt_temizle()
	
	//Ekranın istenilen süre kadar titremesini sağlar
	//Süre frame cinsindendir
	//Miktar pixel cinsindendir. Ortalama 5'tir
	ekran_titret()
	
	//Ekranın ortasında bir yazı belirmesi içindir
	//Scribble efektleri kullanılabilir
	ekran_yazisi_yaz()
	
	//Envanterde bir eşyanın olup olmadığını söyler
	//Envanterdeki adet ile karıştırılmamalıdır
	envanter_kontrol_surekli()
	
	//Envanterdeki tüm ögeleri atar
	envanter_temizle()
	
	//Envanterdeki bir nesnenin kaç tane olduğunu döndürür. Envanterde yoksa false döner
	envanterdeki_adet()
	
	//Envanterdeki ögelerin kaç düşeceğini söyler
	envanterden_azalt()
	
	//Envantere eklenecek eşyanın adedi ve sağlamlığını kontrol eder
	envantere_ekle()
	
	//Bir odaya tetikleyici eklenir
	//Bu fonksiyon oda başlangıcına yazılır
	//Tetikleyici bu fonksiyona bağlanır
	//Hangi objenin oluşturulacağı belirlenir
	//Eğer oluşacak eşyalara faz = 4 gibi değerler verilecekse son argümana {faz:4} şeklinde yazılır
	esya_olustur()
	
	//Eşyanın zeminde istenilen yerde oluşmasını sağlar
	esya_yerde_olustur()
	
	//Bir eşya kullanıldığı anda true çevirir
	esya_kullanildi_mi()
	
	//Geri sayımbaşlatır ve sayım bittiğinde fonksiyonun içinde ona bağlı sayıdaki kodu çalıştırır
	geri_sayim_baslat()
	
	//Görevlerin aktif olup olmadığını kontrol eder
	//Görevleri stringleri ile tanıdığı için aynı isimde görevler konulamaz
	gorev_aktif_mi()
	
	//Görev numarasını görev olarak ekler
	//Farklı platformlar için açıklama elle girilebilir
	gorev_ekle()
	
	//Görevin tamamlandığı anlamına gelir ve siler
	gorev_sil()
	
	//O anda mevcut olan tüm görevleri kaldırır
	gorevleri_temizle()
	
	//İni dosyasının içine yazılan her şeyi kalıcı olarak kaydeder.
	//global.ini_4 gibi değişkenleri ini dosyasının içine yazar
	ini_kaydet()
	
	//Karakterin bir nesne ile iç içe olduğunu döndürür
	ic_ice()
	
	//Karakterin bir cisme yakın olması durumunda true döndürür
	yakinlik()
	
	//İçine yazılan eşya numarasının kaçıncı slotta olduğunu söyler
	hangi_slotta()
	
	//İçine yazılan eşyanın hangi slotta olduğunu söyler
	slot_bos_mu()
	
	//Bir eşyanın birden fazla slotta olup olmadığını döndürür
	kac_slotta_var();
	
	//Genelde bir kayıt noktasının kullanici.json üzerine yazılması için kullanılır.
	json_kopyala()
	
	//Üç kardeş fonksiyon
	//Karakterlerin yürümelerinin durdurulmasını sağlarlar
	karakter_dur()
	karakter_git_durdur()
	karakter_git_oldur()
	
	//Karakterlerin yurumeler fonksiyonunda bağlanmasından sonra yürümelerini sağlar
	//Yürüme bittiğinde yurume_bitis fonksiyonu hangi numaraysa devreye girer
	karakter_git()
	
	//Bir karakterin sag, sol, on, arka'ya dönmesini sağlar
	//Sprite serbest kullanma ne olduğunu unuttum :)
	karakter_yonunu_don()
	
	//Karakterlerin gülme efektleri için ideal
	//zipla_durdur fonksiyonu biraz gereksiz
	karakter_ziplat()
	karakter_zipla_durdur()
	
	//Karakterimize hasar verir
	karakter_hasar_ver()
	
	//Ekranın kararmasını sağlar
	//Karartı yavaşça açılır
	karart()
	
	//Konuşma içine yazıldığında kamerayı konuşan karaktere kilitler
	//Hangi karakterin hangi isimde olduğunu belirlemek için konusma_rengi_tanimlama fonksiyonu kullanılır
	kamera_konusana_kilitlenme()
	
	//Oyunun her şeyinin kaydedilmesini sağlar
	//Oda başlangıcına konulacaksa hikaye_kontrolleri ile bir bayrak konulmalıdır
	//Bayraksız kayıt noktaları yüzünden karakter 0, 0 noktasında doğabilir
	//Eğer konuşma sonunda konuluyorsa konuşma bitiminde takip olmamalıdır
	//Takip eden kişiler kaydı bozabilir
	kaydet()
	
	//Genelde global.kullanilan_esya yazılır içine ve o eşyanın kaç numarada olduğunu söyler
	//Aslında tek yaptığı isimdeki numarayı söylemek
	kodunu_al()
	
	//İçine yazılan kayıt noktasının aktifleşerek ulaşılabilir olmasını sağlar
	kayit_noktasi_aktifles()
	
	//Bunun içindeki argümanlar sürekli bug oluşturuyor
	//Bunu kullanırken sadece konuşmanın numarasını ver
	//Kalanını her_oda_step veya konusma_sistemi_yukle fonksiyonunda hallet
	konusma_baslat()
	
	//Karakterimiz yürürken konuşmanın kesilmemesi için hayati önemi var
	//Hangi sayılı konuşmada yürüyorsa konusma_sistemi_yukle fonksiyonunda o numarada bunu yaz
	konusma_devam()
	
	//Bir eşya kırılma noktasına yakınsa canını yükseltir
	kirildiysa_yenisini_ver()
	
	//Oyunun sıfırlanmasını veya devam etmesini sağlar
	//Bunlarla hiç işin yok
	menu_devam_et()
	menu_yeni_oyun()
	
	//Karakterin içine yazılan nesneye yakınlığına göre çalışır
	nesne_konusma_baslat()
	
	//Karakterlerin nerede doğacaklarını, eski odalardan silinip silinmeyeceğini kontrol eder
	//Aşırı kullanışlıdır. Mutlaka her_odadan_sil argümanının kullanılması gerekir
	npc_konum_kaydetme_ozel()
	
	//Karakterlerin animasyonlarını değiştirir
	//Her frame'de tetiklenmek zorunda olduğundan her_oda_step fonksiyonunda hikaye_kontrolleri'ne bağlanmalıdır
	npc_sprite_degistir_surekli()
	
	//Karakterimizin oda değiştirmesini sağlar
	//Room goto sadece karakter yokken kullanılır
	odaya_isinlan()
	
	//Karakterimizi öldürür
	oldur()
	
	//Numarası yazılan sandığın açılıp açılmadığını kontrol eder
	sandik_acildi_mi()
	
	//Konuşmanın bitiminde -1 yazılırsa konuşmayı kapatır
	//0 yazılırsa konuşma diğer z tuşuna kadar durur
	secim_array()
	
	//Seçimden sonra hangi seçimin nereye gideceğini söyler
	secim_gonder()
	
	//Oyuncunun hangi seçimi yaptığını öğrenmek için içine seçim numarası yazılır
	//True dönerse o seçim yapılmıştır
	secim_sonuclari()
	
	//Anında değil yavaşça sinematik kararır
	//Ayrıca kararma bitince hangi olayın gerçekleşeceği kodlanır
	srb_kararma()
	
	//TÜm statları fuller
	stat_fulleme()
	
	//Statlar düşükse ölmeyecek kadar yukarı çeker
	stat_dengeleme()
	
	//Sürekli artıp azalmayı sağlar
	//Her zaman düşebilir argümanı karakterin konuşma sırasında da statlarının değişmesini sağlar
	stat_degisim()
	
	//NPC'lerin takip etmeyi bırakmasını sağlar
	takip_birak()
	
	//Genel olarak her şeyi yeniler
	yenile();
}