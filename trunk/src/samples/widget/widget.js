/*******************************************************************************
 * Copyright (c) 2011, Adobe Systems Incorporated
 * All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without 
 * modification, are permitted provided that the following conditions are met:
 *
 * ·        Redistributions of source code must retain the above copyright 
 *          notice, this list of conditions and the following disclaimer. 
 *
 * ·        Redistributions in binary form must reproduce the above copyright 
 *		   notice, this list of conditions and the following disclaimer in the
 *		   documentation and/or other materials provided with the distribution. 
 *
 * ·        Neither the name of Adobe Systems Incorporated nor the names of its 
 *		   contributors may be used to endorse or promote products derived from
 *		   this software without specific prior written permission. 
 * 
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" 
 * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE 
 * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE 
 * DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR 
 * ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES 
 * (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS
 * OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY 
 * THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT 
 * (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS 
 * SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 *******************************************************************************/

// private scope
(function(window) {

var xhtmlns = "http://www.w3.org/1999/xhtml";
var document = window.document;

var implMap = {};

var attachImpl = function(e) {
    var src = e.getAttribute("data");
    var type = e.getAttribute("type");
    var impl = implMap[type];
    if( impl )
    {
        var e1 = e.cloneNode(true);
        e1.setAttribute( "data", impl.src + "?src=" + src + "&type=" + type );
        e1.setAttribute( "type", impl.type );
        var p = e.parentNode;
        p.replaceChild(e1, e);
    }
};

var attach = function(win) {
	var doc = win.document;
	var items = doc.getElementsByTagNameNS(xhtmlns, "object");
	var len = items.length;
	for( var i = 0 ; i < len ; i++ )
		attachImpl(items.item(i));
};

var showWithScript = function()
{
	var win = window.open( "OPS/content.xhtml", "_blank" );
	win.onload = function() {
	    attach(win);
	}
};

var showWithoutScript = function()
{
	var win = window.open( "OPS/content.xhtml", "_blank" );
};

var attachHandlers = function()
{
    window.document.getElementById("showWithScript").addEventListener( "click", showWithScript, false );
    window.document.getElementById("showWithoutScript").addEventListener( "click", showWithoutScript, false );
};

var loadOPF = function(opfdoc)
{
    var itemMap = {};
    var itemList = opfdoc.getElementsByTagName("item");
    for( var i = 0 ; i < itemList.length ; i++ )
    {
        var item = itemList.item(i);
        var id = item.getAttribute("id");
        if( id )
            itemMap[id] = item;
    }
    var mediaTypes = opfdoc.getElementsByTagName("mediaType");
    for( var i = 0 ; i < mediaTypes.length ; i++ )
    {
        var m = mediaTypes.item(i);
        var handler = m.getAttribute("handler");
        var type = m.getAttribute("media-type");
        if( handler && type )
        {
            item = itemMap[handler];
            if( item )
            {
                var itemType = item.getAttribute("media-type");
                var src = item.getAttribute("href");
                if( itemType && src )
                    implMap[type] = {src:src, type:itemType};
            }
        }
    }
        
    attachHandlers();        
};

var onload = function()
{
	var req = new XMLHttpRequest();
	req.open("GET", "OPS/content.opf", true);
	req.onreadystatechange = function()
		{
			if( req.readyState == 4 )
			{
				loadOPF(req.responseXML);
			}
		};
	req.send(null);    
};

window.addEventListener("load", onload, false );

})(window);
