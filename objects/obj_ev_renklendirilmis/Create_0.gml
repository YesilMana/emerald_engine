yaniyor = false;
if variable_instance_exists(id, "numara") {
	if (numara == 1) sprite_index = spr_yeni_ev_1;
	else if (numara == 2) sprite_index = spr_yeni_ev_2;
	else if (numara == 3) sprite_index = spr_yeni_ev_3;
	else if (numara == 4) sprite_index = spr_yeni_ev_4;
	else if (numara == 5) sprite_index = spr_yeni_ev_26;
	else if (numara == 6) sprite_index = spr_yeni_ev_6;
	else if (numara == 7) sprite_index = spr_yeni_ev_7;
	else if (numara == 8) sprite_index = spr_yeni_ev_26;
	else if (numara == 9) sprite_index = spr_yeni_ev_9;
	else if (numara == 10) sprite_index = spr_yeni_ev_10;
	else if (numara == 11) sprite_index = spr_yeni_ev_17;
	else if (numara == 12) sprite_index = spr_yeni_ev_26;
	else if (numara == 13) sprite_index = spr_yeni_ev_13;
	else if (numara == 14) sprite_index = spr_yeni_ev_26;
	else if (numara == 15) sprite_index = spr_yeni_ev_15;
	else if (numara == 16) sprite_index = spr_yeni_ev_16;
	else if (numara == 17) sprite_index = spr_yeni_ev_17;
	else if (numara == 18) sprite_index = spr_yeni_ev_16;
	else if (numara == 19) sprite_index = spr_yeni_ev_28;
	else if (numara == 20) sprite_index = spr_yeni_ev_26;
	else if (numara == 21) sprite_index = spr_yeni_ev_21;
	else if (numara == 22) sprite_index = spr_yeni_ev_26;
	else if (numara == 23) sprite_index = spr_yeni_ev_28;
	else if (numara == 24) sprite_index = spr_yeni_ev_27;
	else if (numara == 25) sprite_index = spr_yeni_ev_30;
}
derinlik(id);

alev_sayisi = irandom_range(3, 6);

for (var i = 0; i < alev_sayisi; i++) {
	variable_instance_set(id, "alev_x_" + string(i), random_range(-(sprite_width / 2) + 10, (sprite_width / 2) - 10));	
	variable_instance_set(id, "alev_y_" + string(i), random(sprite_height - 10));
}

yanan_sprite = choose(spr_yanan_ev, spr_yanan_ev_2);