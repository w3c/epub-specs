
function updatePermaLinks() {
    var links = document.querySelectorAll('a[class~="self-link"]');
    
    for (var i = 0; i < links.length; i++) {
        
        var heading = links[i].parentNode;
        
        var secno = '';
        var sectype = '';
        
        if (heading.tagName.toLowerCase() == 'div') {
        	// permalink for an example
        	// number is inside the a tag with no class
        	secno = links[i].querySelector('bdi').textContent;
        	sectype = 'Example ';
        }
        
        else {
        	// number for sections/appendixes is sibling of the a tag with secno class
	        secno = heading.querySelector('bdi.secno').textContent;
	        // determine if section/appendix from parent class
	        sectype = heading.parentNode.classList.contains('appendix') ? 'Appendix ' : 'Section ';
        }
        
        
        links[i].setAttribute('aria-label', 'Permalink for ' + sectype + secno);
        links[i].setAttribute('title', 'Permalink for ' + sectype + secno);
    }
}
