
function updatePermaLinks() {

	var links = document.querySelectorAll('a[class~="self-link"]');
	
	for (var i = 0; i < links.length; i++) {
		
		var secno = '';
		var sectype = '';
		
		var title = links[i].textContent.trim();
		var parentElem = links[i].parentNode;
		
		if (title.match(/^WebIDL/)) {
			// permalink for idl
			// use link text for name
			secno = links[i].textContent;
			sectype = '';
		}
		
		else if (title.match(/^Example/)) {
			// permalink for an example
			// number is inside the a tag with no class
			secno = links[i].querySelector('bdi');
			if (secno == null) {
				console.log('Error creating new permalink for :' + parent.textContent);
			}
			secno = secno.textContent
			sectype = 'Example ';
		}
		
		else {
			// number for sections/appendixes is sibling of the a tag with secno class
			secno = parentElem.querySelector('.secno');
			if (secno == null) {
				console.log('Error creating new permalink for :' + parent.textContent);
				break;
			}
			secno = secno.textContent
			// determine if section/appendix from parent class
			sectype = parentElem.parentNode.classList.contains('appendix') ? 'Appendix ' : 'Section ';
		}
		
		
		links[i].setAttribute('aria-label', 'Permalink for ' + sectype + secno);
		links[i].setAttribute('title', 'Permalink for ' + sectype + secno);
	}
}
