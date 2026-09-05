function konusma_bitimi(gilobal = 0){
	//Konuşma bitince özel olarak yapılması istenenler if else ifadeleri ile yapılır
	if gilobal == 20 {
		global.konusma_vince_belcinar_1 = 1;	
	}
	
	global.konusma_basladi = false;
	konusma_kapat();
}

