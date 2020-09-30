
function fixCopyright() {

	var copyright = document.getElementsByClassName('copyright')[0];
	
	if (!copyright) {
		console.log('Error converting auto-generated copyright. Unable to locate p tag with class=copyright.');
		return;
	}
	
	copyright.textContent = '';
	
	var copyrightLink = document.createElement('a');
		copyrightLink.setAttribute('href', 'https://www.w3.org/Consortium/Legal/ipr-notice#Copyright');
		copyrightLink.textContent = 'Copyright';
	
	copyright.appendChild(copyrightLink);
	
	copyright.appendChild(document.createTextNode(' © 1999-' + (new Date()).getFullYear() + ' International Digital Publishing Forum™ and W3C® (MIT, ERCIM, Keio, Beihang)'));
	
	var reservedTrademark = document.createElement('p');
		reservedTrademark.classList.add('copyright');
		reservedTrademark.appendChild(document.createTextNode('EPUB is a registered trademark of the International Digital Publishing Forum.'));
	
	copyright.parentNode.insertBefore(reservedTrademark, copyright.nextSibling);
}
