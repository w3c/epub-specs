
function addConformanceLinks() {
    var dt = document.querySelectorAll('*[class~="conformance-list"] p[id]');
    
    for (var i = 0; i < dt.length; i++) {
        
        var span = document.createElement('span');
            span.setAttribute('class','link-marker');
        
        var permalink = document.createElement('a');
            permalink.setAttribute('href','#'+dt[i].id);
            permalink.setAttribute('class','hidden-reveal');
        
        var symbol = document.createElement('span');
            symbol.appendChild(document.createTextNode('\u00A0'));
        
        permalink.appendChild(symbol);
        span.appendChild(permalink);
        span.appendChild(document.createTextNode(' '));
        
        dt[i].insertBefore(span,dt[i].firstChild);
    }
}
