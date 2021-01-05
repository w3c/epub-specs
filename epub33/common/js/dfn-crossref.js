
function fixDefinitionCrossrefs() {
    
    var dfn = new Object();
    
    var specSrc = getSpecSrc();
    
    if (specSrc == '') { return; }
    
    // load the returned page to extract the definitions
    var srcDOM = document.createElement('html');
        srcDOM.innerHTML = specSrc;
    
    var src_dfn_elem = srcDOM.getElementsByTagName('dfn');
    
    // parse list of global terms
    for (var i = 0; i < src_dfn_elem.length; i++) {
        var def_text = src_dfn_elem[i].textContent.trim().replace(/\s+/g,' ').toLowerCase();
        var def_id = def_text.replace(/\s+/g,'-')
        
        dfn[def_text] = def_id;
        
        // add aliases
        if (src_dfn_elem[i].hasAttribute('data-lt')) {
            src_dfn_elem[i].getAttribute('data-lt').trim().replace(/\s+/g,' ').split('|').forEach( function(alias) { dfn[alias.toLowerCase()] = def_id; } );
        }
    }
    
    var defLink = document.querySelectorAll('a:not([href])');
    
    defLink.forEach(function (link) {
        var link_txt = link.hasAttribute('data-lt') ? link.getAttribute('data-lt').trim().replace(/\s+/g,' ').toLowerCase() : link.textContent.trim().replace(/\s+/g,' ').toLowerCase();
        
        if (dfn.hasOwnProperty(link_txt)) {
            link.setAttribute('href','https://www.w3.org/TR/epub-33/#dfn-'+dfn[link_txt]);
        }
    });
}

function getSpecSrc() {
    
    try {
        var xmlhttp = new XMLHttpRequest();
        
        xmlhttp.open('GET', '../core/index.html', false);
        xmlhttp.send();
        
        if (xmlhttp.status == 200) {
           return xmlhttp.responseText;
        }
        else {
           console.error('Failed to read definition source file ../core/index.html. Returned status: ' + xmlhttp.status);
           return '';
        }
    }
    
    catch (e) {
        console.error(e);
        return '';
    }
}

