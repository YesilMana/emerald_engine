image_xscale = scale;
image_yscale = scale;

scale -= 0.01;

if scale <= 0 {
	instance_destroy();	
}