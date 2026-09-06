function hava_durumu_sicaklik_degisimi(){
	switch global.hava_durumu {
		case 1: // Normal güneşli bir gün
			//if !zaman_dur stat_degisim("sicaklik", global.hava_durum_degerleri[? "soguk_1"], 0);
			havayi_degistir(1, 0.8, 0.7, 0.4, 1.1, 0.9, 0.01); 
			break; 
		
		case 2: // Karanlık
			havayi_degistir(0.5, 0.3, 0.4, 0.6, 1.2, 0.9, 0.01); 
			break; 
		
		case 3: // Puslu
			havayi_degistir(0.8, 0.8, 1, 0.7, 1.2, 0.7, 0.01); 
			break; 
			
		case 4: // Doygun
			havayi_degistir(1, 0.9, 0.8, 0.7, 1.3, 1.2, 0.01); 
			break; 
		
		case 5: //Gün doğumu 1
			havayi_degistir(0.9, 0.7, 0.8, 0.7, 1.3, 0.9, 0.01);
			break;
			
		case 6: //Gün doğumu 2
			havayi_degistir(1, 0.85, 0.9, 0.9, 1.3, 0.9, 0.01);
			break;
		
		case 7: //Zifiri karanlık
			havayi_degistir(0.45, 0.4, 0.55, 0.9, 1.3, 0.7, 0.01); 
			break;
		case 8: //Normal bir gün
			havayi_degistir(1, 0.9, 0.9, 0.4, 1, 1, 0.01); 
			break;
		case 9: //Cinli
			havayi_degistir(0.6, 0.7, 0.8, 0.3, 1.1, 0.7, 0.01); 
			break;
		case 10: // Masalsı (Fairy Tale) 
			// Uçuk pembeler/morlar, yüksek doygunluk, yumuşak bir kontrast.
			havayi_degistir(1.1, 0.85, 1.1, 0.6, 1.0, 1.3, 0.01); 
			break;
			
		case 11: // Korku (Horror) 
			// Hastalıklı, soluk yeşilimsi tonlar, rahatsız edici derecede yüksek kontrast ve düşük renk.
			havayi_degistir(0.6, 0.8, 0.6, 0.8, 1.4, 0.3, 0.01); 
			break;
			
		case 12: // Gece Yarısı (Midnight) 
			// Derin lacivert tonları, renklerin seçilebildiği ama karanlığın hissedildiği bir ay ışığı.
			havayi_degistir(0.2, 0.3, 0.6, 0.7, 1.2, 0.6, 0.01); 
			break;
			
		case 13: // Gelişmiş Gün Batımı (Golden Hour) 
			// Çok daha yoğun bir altın saatler efekti. Kızıl-turuncu hakimiyeti, gölgelerin keskinleşmesi.
			havayi_degistir(1.1, 0.6, 0.3, 0.8, 1.3, 1.2, 0.01); 
			break;

		// --- SİNEMATİK VE PSİKOLOJİK GERİLİM TONLARI ---
		
		case 14: // Neon Distopya
			// Zehirli bir turuncu/sarı, yoğun kontrast. (Distopik filmlerdeki radyoaktif yıkım hissi)
			havayi_degistir(1.2, 0.6, 0.1, 0.9, 1.5, 1.1, 0.01); 
			break;
			
		case 15: // Psikolojik Gerilim
			// İnsanı daraltan soluk sarı/gri tonlar. Her şeyin normal göründüğü ama bir şeylerin ters olduğu o "tekinsiz" his.
			havayi_degistir(0.9, 0.9, 0.6, 0.7, 1.3, 0.4, 0.01); 
			break;
			
		case 16: // Klostrofobik Karanlık
			// Neredeyse renksiz, karanlıkların ekranı yuttuğu çok ağır bir atmosfer.
			havayi_degistir(0.5, 0.4, 0.4, 1.0, 1.6, 0.1, 0.01); 
			break;
			
		case 17: // Kanlı Ay (Blood Moon)
			// Etraftaki her şeyin kırmızı bir filtreyle kaplandığı, tehditkar bir geçiş.
			havayi_degistir(1.1, 0.2, 0.2, 0.9, 1.4, 1.0, 0.01); 
			break;

		// --- DOĞA VE NOSTALJİ ---

		case 18: // Zümrüt Ormanı
			// Doğanın, ağaçların ve çimenlerin çok canlı hissedildiği, derin ve hafif nemli bir yeşil.
			havayi_degistir(0.6, 1.1, 0.7, 0.5, 1.1, 1.3, 0.01); 
			break;
			
		case 19: // Sabah Ayazı (Çiğ)
			// Yüksek rakımlı bir yerin sabah soğuğu. Çok uçuk mavi, parlak ama renkleri soluk bir hava.
			havayi_degistir(0.8, 0.9, 1.1, 0.6, 0.9, 0.7, 0.01); 
			break;
			
		case 20: // Fırtına Öncesi
			// Havanın aniden bozduğu, gri-mavi, boğucu ve gökyüzünün yere yaklaştığı o his.
			havayi_degistir(0.5, 0.6, 0.7, 0.8, 1.1, 0.4, 0.01); 
			break;
			
		case 21: // Kavurucu Sıcak
			// Göz alan beyaz/sarımtırak bir filtre. Kontrast patlıyor, adeta güneşe bakıyormuş hissi.
			havayi_degistir(1.1, 1.0, 0.8, 0.7, 1.4, 0.9, 0.01); 
			break;
			
		case 22: // 90'lar VHS Kaseti (Retro)
			// Yıkanmış, hafif sepya-yeşil tonları. Kontrast düşük, doygunluk az. Nostaljik flashback sahneleri için.
			havayi_degistir(0.9, 0.8, 0.6, 0.5, 0.8, 0.6, 0.01); 
			break;
		case 23: // 90'lar VHS Kaseti (Retro)
			// Yıkanmış, hafif sepya-yeşil tonları. Kontrast düşük, doygunluk az. Nostaljik flashback sahneleri için.
			havayi_degistir(-1, -1, -1, 5, 2, 4, 1); 
			break;
		case 24: //PATLAMA
			// Yıkanmış, hafif sepya-yeşil tonları. Kontrast düşük, doygunluk az. Nostaljik flashback sahneleri için.
			havayi_degistir(10, 5, 5, 5, 2, 10, 0.1); 
			break;
		case 25: // Puslu
			havayi_degistir(0.8, 0.8, 1, 0.7, 1.2, 0.7, 0.1); 
			break; 
		default:
	}
}