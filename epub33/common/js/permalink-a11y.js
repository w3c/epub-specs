
function updatePermaLinks() {
    var links = document.querySelectorAll('a[class~="self-link"]');
    
    for (var i = 0; i < links.length; i++) {
        
        var heading = links[i].parentNode.textContent;
        
        links[i].setAttribute('aria-label', 'Permalink for ' + heading);
        links[i].setAttribute('title', 'Permalink for ' + heading);
    }
}
