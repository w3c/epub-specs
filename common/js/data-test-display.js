function data_test_display() {
    // 1. step: modify the test references to display only the test name, rather than the full URL
    const test_references = document.querySelectorAll('details.respec-tests-details a');
    for( const a of test_references ) {
        const href = a.href;
        // This is a bit of a hack, and fragile at that...
        const test_reference = href.split('#')[1];
        // if the string contains a '.feature' then this is an epubcheck test reference
        if (test_reference.match(".feature")) {
            // give a separate class name to these references if we want to give them a distinctive look
            a.className = 'epubcheck';
        } 
        a.textContent = test_reference;
    }
    
    // 2. step: find the sections that have tests associated to them (those are usually epubcheck tests). 
    // The child details element must be moved ahead (respec puts these at the very end of the section element)
    // right after the header of the section
    const epubcheck_references = document.querySelectorAll('section[data-epubcheck="true"]');
    for (const section of epubcheck_references) {
        // There may be several 'details' elements in the section; we have to locate the one that
        // has been "attached" to the section element proper. That is the one that has to be moved.
        const all_details = section.querySelectorAll('details.respec-tests-details');
        let details = null;
        for (const d of all_details){
            if (section.isEqualNode(d.parentNode)) {
                details = d;
                break;
            }
        }
        if(details !== null) {
            // The header is wrapped into a 'div' element with class 'header-wrapper'. The test reports should come
            // right after this, so we have to find it:
            const div_hx = section.querySelector('div.header-wrapper');
            
            // Move the details element ahead, right after the section header
            section.insertBefore(details, div_hx.nextSibling);
        }
    }
}
