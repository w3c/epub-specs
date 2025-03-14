
function fixErrataField() {
	
	var errataLink = 'https://w3c.github.io/epub-specs/epub34/errata.html';
	
	var errataField = document.querySelector('div.head > details > dl > dd > a[href="' + errataLink + '"]');
	
	if (!errataField) {
		console.log('Errata field not found. Unable to repair link.');
	}
	
	else {
		errataField.innerHTML = errataLink;
		
		// remove trailing period
		errataField.parentNode.innerHTML = errataField.parentNode.innerHTML.replace(/\.\s*$/,'');
	}
}
