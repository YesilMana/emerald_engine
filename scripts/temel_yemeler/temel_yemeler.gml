function esya_kullanim_14(){
	envanterden_azalt(14, 1);
	envantere_ekle(13, 20);
	global.genel_tetiklenme = true;
}
function esya_kullanim_15(){
	if kalori_depo {
		envanterden_azalt(15, 1);
		if global.kalori < global.kalori_maksimum {
			global.kalori += global.kaloriler[? "esya_15"];	
			global.genel_tetiklenme = true;
		}
	
		if global.kalori > global.kalori_maksimum {
			global.kalori = global.kalori_maksimum;	
		}
	}
}
function esya_kullanim_17(){
	temel_ic(17);
	envantere_ekle(16, 1);
}
function esya_kullanim_26(){
	if kalori_depo {
		envanterden_azalt(26, 1);
		envantere_ekle(25, 1);
		stat_degisim("kalori", global.kaloriler[? "esya_26"], 0);
		global.genel_tetiklenme = true;
	}
}
function esya_kullanim_27(){
	if kalori_depo {
		envanterden_azalt(27, 1);
		envantere_ekle(25, 1);
		stat_degisim("kalori", global.kaloriler[? "esya_27"], 0);
		global.genel_tetiklenme = true;
		global.kullanim_tek = global.genel_yazilar[51];
	}
}
function esya_kullanim_29(){
	global.kullanim_tek = global.genel_yazilar[59];
	temel_ye(29);
}
function esya_kullanim_30(){
	temel_ye(30);
	envantere_ekle(25, 1);
}
function esya_kullanim_31(){
	temel_ye(31);
	envantere_ekle(25, 1);
}
function esya_kullanim_32(){
	temel_ye(32);
	efekt_ekle(7, 240);
	
}
function esya_kullanim_33(){
	temel_ye(33);
	envantere_ekle(25, 1);
}
function esya_kullanim_34(){
	temel_ye(34);
	envantere_ekle(25, 1);
}

function esya_kullanim_38(){
	temel_ic(38);
	envantere_ekle(37, 1);
	if !craft_etme_kontrol(esya.hazirlanmis_yesil_cay) {
		craft_aktifles(esya.hazirlanmis_kahve);
		craft_aktifles(esya.hazirlanmis_yesil_cay);
		bilgi_ver(142);
	}
}

function esya_kullanim_40(){
	global.kullanim_tek = global.genel_yazilar[47];
	temel_ic(40);
	envantere_ekle(37, 1);
	efekt_ekle(4, 80);
	efekt_ekle(5, 160);
}
function esya_kullanim_41(){
	temel_ye(41);
}
function esya_kullanim_42(){
	temel_ye(42);
}
function esya_kullanim_44(){
	temel_ye(44);
}
function esya_kullanim_45(){
	temel_ye(45);
	efekt_ekle(6, 120);
}
function esya_kullanim_46(){
	temel_ye(46);
}
function esya_kullanim_47(){
	temel_ye(47);
}
function esya_kullanim_48(){
	temel_ic(48);
}
function esya_kullanim_49() {
	temel_ye(49);
	envantere_ekle(25, 1);
	efekt_ekle(6, 360);
}
function esya_kullanim_50() {
	temel_ye(50);
}
function esya_kullanim_52() {
	temel_ye(52);
	efekt_ekle(7, 240);
}
function esya_kullanim_54() {
	temel_ye(54);
}
function esya_kullanim_55() {
	global.kullanim_tek = global.genel_yazilar[99];
	bekleme_animasyonu_calistir(99, 8)
	craft_aktifles(37);	
	envanterden_azalt(55, 1);
}

function esya_kullanim_56() {
	temel_ye(56);
	bekleme_animasyonu_calistir(, 1);
}

function esya_kullanim_57() {
	global.sicaklik += 4;
	bekleme_animasyonu_calistir(global.genel_yazilar[117], 3);
	bilgi_ver(118);
}

function esya_kullanim_60() {
	temel_ye(60);
}
function esya_kullanim_62() {
	temel_ic(62);
	envantere_ekle(16, 1);
}

function esya_kullanim_67() {
	temel_ic(esya.papatya_cayi);
	efekt_sil(4);
	efekt_sil(7);
	efekt_ekle(4, 60);
}

function esya_kullanim_69() {
	global.kullanim_tek = global.genel_yazilar[99];
	bekleme_animasyonu_calistir(99, 6);
	bilgi_ver(141, 6);
	craft_aktifles(22);	
	craft_aktifles(23);	
	craft_aktifles(24);	
	craft_aktifles(25);	
	craft_aktifles(26);	
	envanterden_azalt(esya.damak_soleni_dergi_sayfasi_1, 1);
}

function esya_kullanim_70() {
	bekleme_animasyonu_calistir(global.genel_yazilar[151], 3);
	efekt_ekle(8, 45);
	envanterden_azalt(70, 1);
}
function esya_kullanim_73() {
	temel_ye(73);
}
function esya_kullanim_74() {
	temel_ye(74);
	global.kullanim_tek = global.genel_yazilar[59];
	efekt_ekle(7, 240);
}

function esya_kullanim_75() {
	temel_ye(esya.yilan_yastigi);
	efekt_ekle(9, 60);
	global.kullanim_tek = global.genel_yazilar[47];
}
function esya_kullanim_77() {
	envanterden_azalt(esya.yilan_yastigi_merhemi, 1);
	bekleme_animasyonu_calistir(global.genel_yazilar[207], 4, true);
	efekt_ekle(10, 30);
}
function esya_kullanim_78() {
	temel_ye(esya.karahindiba);
}
function esya_kullanim_79() {
	global.kullanim_tek = global.genel_yazilar[47];
	temel_ic(esya.karahindiba_cayi);
	efekt_ekle(11, 30);
	envantere_ekle(esya.tahta_bardak, 1);
}
function esya_kullanim_83() {
	temel_ye(esya.tarcinli_karamelli_turta);
}
function esya_kullanim_84() {
	temel_ye(esya.limonlu_dondurma);
	bilgi_ver(240, 4);
}

function esya_kullanim_85() {
	temel_ye(esya.lembas_ekmegi);
	global.sicaklik = 100;
	global.can = 100;
	global.su = 100;
	global.kalori = 100;
	efekt_ekle(12, 240);
}
function esya_kullanim_86() {
	temel_ye(esya.altin_elma);
	global.sicaklik = 100;
	global.can = 100;
	global.su = 100;
	global.kalori = 100;
	efekt_ekle(13, 240);
}
function esya_kullanim_87() {
	temel_ye(esya.sukunanin_parmagi);
	global.kalori = 46;
	global.su = 86;
	global.kullanim_tek = global.genel_yazilar[59];
	efekt_ekle(14, 120);
	efekt_ekle(13, 120);
	efekt_ekle(12, 120);
}
function esya_kullanim_88() {
	temel_ye(esya.wonka_cikolatasi);
	envantere_ekle(esya.altin_bilet, 1);
}
function esya_kullanim_89() {
	temel_ye(esya.pops_lolipop);
	bilgi_ver(242, 4);
}
function esya_kullanim_90() {
	temel_ye(esya.nuka_cola);
	efekt_ekle(14, 60);
	stat_dengeleme();
}
function esya_kullanim_91() {
	bilgi_ver(243);
}