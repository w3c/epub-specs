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
			index = index + "$" + node.id;
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
		if( (r = cfi.match(/^\/(\d+)(\$([-a-zA-Z_0-9.\u007F-\uFFFF]+))?/)) !== null )
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
	if( (r = cfi.match(/^[ab]/)) !== null )
	{
		point.forward = r[0] == "a";
		cfi = cfi.substr(1);
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

function ID(name)
{
	return document.getElementById(name);
}

function readSelection()
{
	var selection = window.getSelection();
	if( selection.rangeCount == 0 )
	{
		// try iframes
		var iframes = document.getElementsByTagName("iframe");
		for( var k = 0 ; k < iframes.length ; k++ )
		{
			var iframe = iframes.item(k);
			selection = iframe.contentWindow.getSelection();
			if( selection.rangeCount != 0 )
				break;
		}
	}
	if( selection.rangeCount == 0 )
	{
		ID("start").value = "";
		ID("end").value = "";
	}
	else
	{
		var range = selection.getRangeAt(0);
		ID("start").value = encodeCFI(document, range.startContainer, range.startOffset, "a"); // after
		ID("end").value = encodeCFI(document, range.endContainer, range.endOffset, "b"); // before
	}
}

var useSelection;
var hroot;

function displayPosition(dontSeek)
{
	var pos;
	var cfi = ID("pos").value;
	if( cfi )
		pos = pointFromCFI(document, cfi);
	var ms = ID("marker").style;
	if( pos )
	{
		ms.visibility = "visible";
		ms.top = (pos.y - 30) + window.scrollY + "px";
		ms.left = (pos.x - 1) + window.scrollX + "px";
		if( !dontSeek && typeof pos.time == "number" )
			pos.node.currentTime = pos.time;
	}
	else
	{
		ms.visibility = "hidden";
	}
}
											   
function highlightRange()
{
	if( hroot )
	{
		hroot.parentNode.removeChild(hroot);
		hroot = null;
	}
	
	var start = decodeCFI(document, ID("start").value);
	var end = decodeCFI(document, ID("end").value);
	var doc = start.node.ownerDocument;
	if( !doc )
		return;
	
	var win = doc.defaultView;
	var range = doc.createRange();
	if( typeof start.offset == "number" )
		range.setStart(start.node, start.offset);
	else
		range.setStartBefore(start.node);
	if( typeof end.offset == "number" )
		range.setEnd(end.node, end.offset);
	else
		range.setEndBefore(end.node);
	
	if( useSelection )
	{
		// works only on desktop right now
		var selection = win.getSelection();
		selection.removeAllRanges();
		selection.addRange(range);
	}
	else
	{
		hroot = doc.createElement("div");
		doc.body.appendChild(hroot);
		while( hroot.lastChild )
			hroot.removeChild(hroot.lastChild);
		// Note: there is a bug for cross-element ranges in WebKit
		// don't bother working around for now
		var rects = range.getClientRects();
		for( var k = 0 ; k < rects.length ; k++ )
		{
			var rect = rects[k];
			var re = doc.createElement("div");
			var se = re.style;
			se.position = "absolute";
			se.top = (rect.top + win.scrollY) + "px";
			se.left = (rect.left + win.scrollX) + "px";
			se.width = rect.width + "px";
			se.height = rect.height + "px";
			se.backgroundColor = "red";
			se.opacity = "0.2";
			hroot.appendChild(re);
		}
	}
}


														   
														   
var oldData;

function sendToServer()
{
	readSelection();
	var data = "<range start=\"" + ID("start").value + "\" end=\"" + ID("end").value +
	   "\" pos=\"" + ID("pos").value + "\"/>";
	if( data != oldData )
	{
		oldData = data;
		var req = new XMLHttpRequest();
		req.open("POST", "/cgi-bin/echo.bash", true);
		req.send(data);
	}
}

function readFromServer()
{
	var req = new XMLHttpRequest();
	req.open("GET", "/cgi-bin/echo.bash?t=" + (new Date()).valueOf(), true);
	req.onreadystatechange = function()
	{
		if( req.readyState == 4 && req.status == 200 )
		{
			var range = req.responseXML.documentElement;
			var start = range.getAttribute("start");
			var end = range.getAttribute("end");
			var pos = range.getAttribute("pos");
			if( start != ID("start").value || end != ID("end").value || pos != ID("pos").value)
			{
				ID("start").value = start;
				ID("end").value = end;
				ID("pos").value = pos;
				highlightRange();
				displayPosition();
			}
		}
	};
	req.send();
}

function click(evt)
{
	if( evt.target.localName == "input")
		return;
	var cfi = cfiAt( document, evt.clientX, evt.clientY );
	ID("pos").value = cfi;
	displayPosition(true);
}

var track = true;
var share = false;
var follow = false;

function updateLabels()
{
	ID("share").value = share ? "Stop Sharing" : "Start Sharing";
	ID("follow").value = follow ? "Stop Following" : "Start Following";
	ID("track").value = track ? "Stop Tracking" : "Start Tracking";
}

function toggleSharing()
{
	if( share )
	{
		share = false;
	}
	else
	{
		oldData = "";
		share = true;
		follow = false;
		track = false;
	}
	updateLabels();
}

function toggleFollowing()
{
	if( follow )
	{
		follow = false;
	}
	else
	{
		follow = true;
		share = false;
		track = false;
	}
	updateLabels();
}

function toggleSelectionTracking()
{
	if( track )
	{
		track = false;
	}
	else
	{
		follow = false;
		share = false;
		track = true;
	}
	updateLabels();
}

function doStuff()
{
	if( share )
		sendToServer();
	else if( follow )
		readFromServer();
	else if( track )
		readSelection();
}

function hook()
{
	updateLabels();
	setInterval(doStuff, 300);
	window.onscroll = displayPosition;
	window.onresize = displayPosition;
	var iframes = document.getElementsByTagName("iframe");
	for( var k = 0 ; k < iframes.length ; k++ )
	{
		var iframe = iframes.item(k);
		iframe.contentWindow.onscroll = displayPosition;
	}
	useSelection = !navigator.userAgent.match( /(\(iPad;)|(\(iPod;)|(\(iPhone;)|(\sAndroid\s)/ );
}