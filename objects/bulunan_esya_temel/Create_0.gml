eleman = object_get_name(object_index);
var eleman_i = string_digits(eleman);
esya_numarasi = 999;
if eleman_i != "" {
	var sayilar = real(eleman_i);	
	esya_numarasi = sayilar;
}
opaklik = 1;
image_scale = 0.6;

sprite_index = asset_get_index("spr_esya_" + string(esya_numarasi));

