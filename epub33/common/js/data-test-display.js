function data_test_display() {
    const test_references = document.querySelectorAll('details.respec-tests-details a');
    for( const a of test_references ) {
        const href = a.href;
        const test_reference = href.split('#')[1];
        a.textContent = test_reference;
    }    
}
