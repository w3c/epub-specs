
function inlineCustomCSS() {
    
    var customCSS = getCSS();
    
    if (customCSS == '') { return; }
    
    var style = document.createElement('style');
    	style.textContent = customCSS;
    
    document.getElementsByTagName('head')[0].appendChild(style);
    
}

function getCSS() {
    
    try {
        var xmlhttp = new XMLHttpRequest();
        
        xmlhttp.open('GET', '../common/css/common.css', false);
        xmlhttp.send();
        
        if (xmlhttp.status == 200) {
           return xmlhttp.responseText;
        }
        else {
           console.error('Failed to read CSS file ../common/css/common.css. Returned status: ' + xmlhttp.status);
           return '';
        }
    }
    
    catch (e) {
        console.error(e);
        return '';
    }
}
