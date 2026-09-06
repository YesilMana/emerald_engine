function hayvan_ses_ismi(obje_ismi, hareket_surecinin_ismi) {
	var ses_ismi = variable_global_get("sfx_" + obje_ismi + "_" + hareket_surecinin_ismi);
	return ses_ismi;
}