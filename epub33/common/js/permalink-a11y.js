
function updatePermaLinks() {
    var links = document.querySelectorAll('a[class~="self-link"]');
    
    for (var i = 0; i < links.length; i++) {
        
        var heading = links[i].parentNode;
        
        var secno = '';
        var sectype = '';
        
        switch (heading.tagName.toLowerCase()) {
        
	        case 'span':
	        	// permalink for idl
	        	
	        	// use link text for name
	        	secno = links[i].textContent;
	        	sectype = '';
	        	break;
	        
	        case 'div':
	        	// permalink for an example
	        	
	        	// avoid the permalink references in the hidden dfn-panel respec generates
	        	if (links[i].closest('div.dfn-panel')) {
	        		break;
	        	}
	        	
	        	// number is inside the a tag with no class
	        	secno = links[i].querySelector('bdi');
	        	if (secno == null) {
	        		console.log('Error creating new permalink for :' + parent.textContent);
	        	}
	        	secno = secno.textContent
	        	sectype = 'Example ';
	        	break;
	        
	        default:
	        	// number for sections/appendixes is sibling of the a tag with secno class
		        secno = heading.querySelector('.secno');
	        	if (secno == null) {
	        		console.log('Error creating new permalink for :' + parent.textContent);
	        		break;
	        	}
	        	secno = secno.textContent
		        // determine if section/appendix from parent class
		        sectype = heading.parentNode.classList.contains('appendix') ? 'Appendix ' : 'Section ';
		        break;
        }
        
        
        links[i].setAttribute('aria-label', 'Permalink for ' + sectype + secno);
        links[i].setAttribute('title', 'Permalink for ' + sectype + secno);
    }
}
