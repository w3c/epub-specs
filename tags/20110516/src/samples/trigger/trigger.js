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

var opsns = "http://www.idpf.org/2007/ops";
var evns = "http://www.w3.org/2001/xml-events";

var document = window.document;

var resolveRef = function(ref, def) {
	if( ref )
	{
		var e = document.getElementById(id);
		if( e )
			return e;
	}
	return def;
};

var makeAction = function(action, object) {
	switch(action)
	{
	case "show" :
		return function() { object.style.visibility = "visible"; };
	case "hide" :
		return function() { object.style.visibility = "hidden"; };
	case "play" :
		return function() { object.currentTime = 0; object.play(); }
	case "pause" :
		return function() { object.pause(); }
	case "resume" :
		return function() { object.play(); }
	case "mute" :
		return function() { object.muted = true; }
	case "unmute" :
		return function() { object.muted = false; }
	}
	return function() {};
};

var attachTrigger = function(e) {
	var event = e.getAttributeNS(evns, "event");
	var observerRef = e.getAttributeNS(evns, "observer");
	var observer = resolveRef(observerRef, e.parentNode);
	var action = e.getAttribute("action");
	var ref = e.getAttribute("ref");
	var object = resolveRef(ref);
	if( event && observer && action && object )
	{
		var func = makeAction(action,object);
		if( event == "load" )
			func();
		else
			observer.addEventListener(event, func, false);
	}
};

var attach = function() {
	var items = document.getElementsByTagNameNS(opsns, "trigger");
	var len = items.length;
	for( var i = 0 ; i < len ; i++ )
		attachTrigger(items.item(i));
};

window.addEventListener("load", attach, false);

})(window);
