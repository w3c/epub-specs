
// this function removes an empty "Terms defined by this specification" section (for indexes in notes)

function removeEmptyIndex() {
	// update the body
	var emptyIndex = document.getElementById('index-defined-here');
	if (emptyIndex !== null) {
		emptyIndex.parentNode.removeChild(emptyIndex);
	}
	var renumIndex = document.querySelector('section#index-defined-elsewhere bdi.secno');
	if (renumIndex !== null) {
		renumIndex.innerHTML = renumIndex.innerHTML.replace('.2','.1');
	}
	// update the toc
	var emptyLink = document.querySelector('a[href="#index-defined-here"]')
	if (emptyLink !== null) {
		var li = emptyLink.parentNode;
		li.parentNode.removeChild(li);
	}
	var renumLink = document.querySelector('a[href="#index-defined-elsewhere"] bdi.secno')
	if (renumLink !== null) {
		renumLink.innerHTML = renumLink.innerHTML.replace('.2','.1');
	}
}
