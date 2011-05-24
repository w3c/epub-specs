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

// Note: this is a prototype implementation that does not do complete parsing/processing
// of CFI. You WOULD need to tighten and test it before using for production purposes.

function log(error)
{
	if( error && window.console && window.console.log )
	   window.console.log(error);
}

function encodeCFI(doc, node, offset, tail)
{
	var cfi = tail || "";
	
	// handle offset
	switch( node.nodeType )
	{
	case 1 :
		if( typeof offset == "number" )
			node = node.childNodes.item(offset);
		break;
	default :
		offset = offset || 0;
		while(true)
		{
			var p = node.previousSibling;
			if( !p || p.nodeType == 1 )
				break;
			switch( p.nodeType )
			{
			case 3:
			case 4 :
			case 5 :
				offset += p.nodeValue.length;
			}
			node = p;
		}
		cfi = ":" + offset + cfi;
		break;
	}

	// go up the tree
	while(node !== doc)
	{
		var parent = node.parentNode;
		if( !parent )
		{
			if( node.nodeType == 9 )
			{
				var win = node.defaultView;
				if( win.frameElement )
				{
					node = win.frameElement;
					cfi = "!" + cfi;
					continue;
				}
			}
			break;
		}
		var index = 0;
		var child = parent.firstChild;
		while(true)
		{
			index |= 1;
			if( child.nodeType == 1 )
				index++
			if( child === node )
				break;
			child = child.nextSibling;
		}
		if( node.id && node.id.match(/^[-a-zA-Z_0-9.\u007F-\uFFFF]+$/) )
			index = index + "[" + node.id + "]";
		cfi = "/" + index + cfi;
		node = parent;
	}
	return cfi;
}

function decodeCFI(doc, cfi)
{
	var node = doc;
	var error;
	var r;
	
	while(cfi.length > 0 || error)
	{
		if( (r = cfi.match(/^\/(\d+)(\[([-a-zA-Z_0-9.\u007F-\uFFFF]+)\])?/)) !== null )
		{
			var targetIndex = r[1] - 0;
			var id = r[3];
			var index = 0;
			var child = node.firstChild;
			while(true)
			{
				if( !child )
				{
					error = "child not found: " + cfi;
					break;
				}
				index |= 1;
				if( child.nodeType === 1 )
					index++
				if( index === targetIndex )
				{
					cfi = cfi.substr(r[0].length);
					node = child;
					if( id ? node.id != id : node.id )
					{
						log("id mismatch: '" + id + "' and '" + node.id + "'");
						// TODO: recover? try both possibilities: starting with id and start
						// with the child with the given index and see if we get resolution
						// without error
					}
					break;
				}
				child = child.nextSibling;
			}
		}
		else if( (r = cfi.match(/^!/)) !== null )
		{
			if( node.contentDocument )
			{
				node = node.contentDocument;
				cfi = cfi.substr(1);
			}
			else
				error = "Cannot reference " + node.nodeName + "'s content: " + cfi;
		}
		else
		{
			break;
		}
	}
	
	var offset = null;
	var point = {};
	
	if( (r = cfi.match(/^:(\d+)/)) !== null )
	{
		offset = r[1] - 0;
		cfi = cfi.substr(r[0].length);
	}
	if( (r = cfi.match(/^~(-?\d+(\.\d+)?)/)) !== null )
	{
		point.time = r[1] - 0;
		cfi = cfi.substr(r[0].length);
	}
	if( (r = cfi.match(/^@(-?\d+(\.\d+)?),(-?\d+(\.\d+)?)/)) !== null )
	{
		point.x = r[1] - 0;
		point.y = r[3] - 0;
		cfi = cfi.substr(r[0].length);
	}
	if( (r = cfi.match(/^\[.*(;s=[ab])?.*\]/)) !== null ) // pretty lame
	{
		if( r[1] )
		{
			point.forward = r[0] == "s=a";
			cfi = cfi.substr(1);
		}
	}
	
	// find correct text node
	if( offset !== null )
	{
		while( true )
		{
			var len = node.nodeValue.length;
			if( offset < len || (!point.forward && offset === len) )
				break;
			var next = node.nextSibling;
			while(true)
			{
				var type = next.nodeType;
				if( type === 3 || type === 4 || type === 5 )
					break;
				if( type == 1 )
				{
					next = null;
					break;
				}
				next = next.nextSibling;
			}
			if( !next )
			{
				if( offset > len )
				{
					error = "Offset out of range: " + offset;
					offset = len;
				}
				break;
			}
			node = next;
			offset -= len;
		}
		point.offset = offset;
	}
	
	point.node = node;
	if( error )
		point.error = error;
	else if( cfi.length > 0 )
		point.error = "Undecoded: " + cfi;

	log(point.error);
	
	return point;
}

function fstr(d)
{
	var s = "";
	if( d < 0 )
	{
		s = "-"
		d = -d;
	}
	var n = Math.floor(d);
	s += n;
	n = Math.round((d-n)*100);
	if( n !== 0 )
	{
		s += ".";
		if( n % 10 == 0 )
			s += (n/10);
		else
			s += n;
	}
	return s;
}

function cfiAt(doc, x, y)
{
	var target;
	var cdoc = doc;
	var cwin = cdoc.defaultView;
	var tail = "";
	var offset = null;
	var name;
	while( true )
	{
		target = cdoc.elementFromPoint(x, y);
		if( !target )
		{
			log("no element at point" );
			return null;
		}
		
		name = target.localName;
		if( name != "iframe" && name != "object" && name != "embed" )
			break;
		
		// drill into object
		var cd = target.contentDocument;
		if( !cd )
			break;
		
		x = x + cwin.scrollX - target.offsetLeft;
		y = y + cwin.scrollY - target.offsetTop;
		cdoc = cd;
		cwin = cdoc.defaultView;
	}
	if( name == "video" || name == "audio" )
	{
		tail = "~" + fstr(target.currentTime);
	}
	if( name == "img" || name == "video" )
	{
		var px = ((x + cwin.scrollX - target.offsetLeft)*100)/target.offsetWidth;
		var py = ((y + cwin.scrollY - target.offsetTop)*100)/target.offsetHeight;
		tail = tail + "@" + fstr(px) + "," + fstr(py);
	}
	else if( name != "audio" )
	{
		if( cdoc.caretRangeFromPoint )
		{
			var range = cdoc.caretRangeFromPoint(x, y);
			if( range )
			{
				target = range.startContainer;
				offset = range.startOffset;
			}
		}
	}
	return encodeCFI(doc, target, offset, tail);	
}

function pointFromCFI(doc, cfi)
{
	var r = decodeCFI(doc, cfi);
	if( !r )
		return null;
	var node = r.node;
	var ndoc = node.ownerDocument;
	if( !ndoc )
	{
		log("document" );		
		return null;
	}
	var nwin = ndoc.defaultView;
	var x;
	var y;
	if( typeof r.offset == "number" )
	{
		var range = ndoc.createRange();
		if( r.forward )
			tryList = [{start:0, end:0, a:0.5}, {start:0, end:1, a:1}, {start:-1, end:0, a:0}];
		else
			tryList = [{start:0, end:0, a:0.5}, {start:-1, end:0, a:0}, {start:0, end:1, a:1}];
		var k = 0;
		var a;
		var nodeLen = node.nodeValue.length;
		do
		{
			if( k >= tryList.length )
			{
				log("no caret position: " + rects);
				return null;
			}
			var t = tryList[k++];
			var startOffset = r.offset + t.start;
			var endOffset = r.offset + t.end;
			a = t.a;
			if( startOffset < 0 || endOffset >= nodeLen )
				continue;
			//log("trying " + startOffset + ":" + endOffset );
			range.setStart(node, startOffset);
			range.setEnd(node, endOffset);
			rects = range.getClientRects();
		}
		while( !rects || !rects.length )
		var rect = rects[0];
		x = (a*rect.left + (1-a)*rect.right);
		y = (rect.top + rect.bottom)/2;
	}
	else
	{
		x = node.offsetLeft - nwin.scrollX;
		y = node.offsetTop - nwin.scrollY;
		if( typeof r.x == "number" && node.offsetWidth )
		{
			x += (r.x*node.offsetWidth)/100;
			y += (r.y*node.offsetHeight)/100;
		}
	}
	while( ndoc != doc )
	{
		node = nwin.frameElement;
		ndoc = node.ownerDocument;
		nwin = ndoc.defaultView;
		x += node.offsetLeft - nwin.scrollX;
		y += node.offsetTop - nwin.scrollY;
	}
	return {x:x, y:y, node:r.node, time:r.time};
}

//----------- Test code --------------

function showCFI(dontSeek)
{
    if( window.cfi )
    {
		var pos = pointFromCFI(document, window.cfi);
        var ms = document.getElementById("marker").style;
        if( pos )
        {
            ms.visibility = "visible";
            ms.top = (pos.y - 30) + window.scrollY + "px";
            ms.left = (pos.x - 1) + window.scrollX + "px";
            if( !dontSeek )
            {   
                if( typeof pos.time == "number" )
                    pos.node.currentTime = pos.time;
                scrollTo(0, pos.y - 30);
            }
        }
    }
}

function markAndReload(evt)
{
	window.cfi = cfiAt( document, evt.clientX, evt.clientY );
    showCFI(true);
    if( window.cfi )
    {
        setTimeout( function() {
            location.replace( location.href.replace(/#.*$/,'') + "#epubcfi(" + window.cfi + ")" );
        }, 1000 );
    }
}
														   
function hookAndScroll()
{
	window.onscroll = showCFI;
	window.onresize = showCFI;
	var iframes = document.getElementsByTagName("iframe");
	for( var k = 0 ; k < iframes.length ; k++ )
	{
		var iframe = iframes.item(k);
		iframe.contentWindow.onscroll = showCFI;
	}
    var r = location.hash.match(/#epubcfi\((.*)\)$/);
    if( r )
    {
        window.cfi = decodeURI(r[1]);
        setTimeout(showCFI, 10);
    }
}
