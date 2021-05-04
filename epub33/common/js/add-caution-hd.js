
function addCautionHeaders() {
	var cautions = document.querySelectorAll('div.caution');
	
	for (var i = 0; i < cautions.length; i++) {
		
		cautions[i].setAttribute('id', 'caution-'+i);
		
		// find current parent heading level for setting aria-level on caution heading
		var parent_section = cautions[i].closest('section');
		var parent_hd = parent_section.querySelector('h2,h3,h4,h5,h6');
		var parent_num = parent_hd.localName.replace('h','');
		
		var caution_hd = document.createElement('div');
			caution_hd.setAttribute('role', 'heading');
			caution_hd.setAttribute('aria-level', parent_num+1);
			caution_hd.setAttribute('class','caution-title marker');
		
		var caution_label = document.createElement('span');
			caution_label.appendChild(document.createTextNode('Caution'));
		
		caution_hd.appendChild(caution_label);
		cautions[i].prepend(caution_hd);
	} 
}
