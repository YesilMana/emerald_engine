sprite_index = spr_cicek_cikma_akonit;
if global.hikaye_kontrolleri_150 == obj_npc_sati sprite_index = spr_cicek_cikma_sati;

if timer >= 60 {
	index += 1;
	timer = 0;
}
if timer_basla timer += 1;

image_index = index;

if index >= 19 {
	image_index = image_number - 1;
	global.hikaye_kontrolleri_87 = false;
	konusma_baslat(285);
}