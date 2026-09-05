function hayvan_olum(){
	
	if (image_index >= image_number - 1) {
		hayvan_ganimet_dusme();
		instance_destroy();	
		if (audio_emitter_exists(yayici)) {
		    audio_emitter_free(yayici);
		}
	}
}