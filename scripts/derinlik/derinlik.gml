function derinlik(obj){
	//Objelerin gerçekçi şekilde derinlikli olmasını sağlar
	if instance_exists(obj) {
		obj.depth = -obj.y;
	}
}