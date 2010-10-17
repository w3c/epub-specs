/*
utility functions
No dependencies
*/

//add the forEach function to Array objects if not already there
//from https://developer.mozilla.org/En/Core_JavaScript_1.5_Reference/Objects/Array/ForEach
if (!Array.prototype.forEach)
{
  Array.prototype.forEach = function(fun /*, thisp*/)
  {
    var len = this.length >>> 0;
    if (typeof fun != "function")
      throw new TypeError();

    var thisp = arguments[1];
    for (var i = 0; i < len; i++)
    {
      if (i in this)
        fun.call(thisp, this[i], i, this);
    }
  };
}

if (!Array.prototype.filter)
{
  Array.prototype.filter = function(fun /*, thisp*/)
  {
    var len = this.length >>> 0;
    if (typeof fun != "function")
      throw new TypeError();

    var res = new Array();
    var thisp = arguments[1];
    for (var i = 0; i < len; i++)
    {
      if (i in this)
      {
        var val = this[i]; // in case fun mutates this
        if (fun.call(thisp, val, i, this))
          res.push(val);
      }
    }

    return res;
  };
}


function get_attribute(elm, attr)
{
    if (!elm | !attr) return "";
    if (typeof(elm["hasAttribute"]) == "undefined") return ""; 
    if(elm.hasAttribute(attr))
    {
        return elm.getAttribute(attr);
    }
    else
    {
        return ""
    }
}

//true if there is content after the split character
//e.g. "file#ref" returns true, "file#" returns false, "file" returns false
function _string_has_second_component(s, split)
{
    var a = s.split(split);
    if (a.length > 1) return true;
    else return false;
}
//get the second part of the string
function _string_get_second_component(s, split)
{
    if(s.search(split) != -1)
    {
        //annoying: for searching, you have to double-escape a question mark
        //but for splitting, you don't need to escape anything
        if (split == "\\?")
            var a = s.split("?");
        else    
            var a = s.split(split);
        if (a.length > 1)
            return a[1];
    }
    return "";
}
function url_strip_additional(url)
{
    if(url.search("#") != -1)
    {
        var a = url.split("#");
        if (a.length > 0)
            return a[0];
    }
    //annoying: for searching, you have to double-escape a question mark
    //but for splitting, you don't need to escape anything
    else if (url.search("\\?") != -1)
    {
        var a = url.split("?");
        if (a.length > 0)
            return a[0];
    }
    else
    {
        return url;
    }
}

//expected: path/file#optional_ref
//returns just file
function url_get_filename(url)
{
    var a = url_strip_additional(url);
    var pos = a.lastIndexOf("/");
    if (pos != -1 && pos < a.length-2)
        return a.substring(pos+1);
    else if (pos == a.length-1)
        return "";
    else
        return a;    
}
//expected path/file#optional_ref
function url_get_path(url)
{
    var a = url_strip_additional(url);
    var pos = a.lastIndexOf("/");
    if (pos != -1)
        return a.substring(0, pos+1);
    else
        return "";
}

function array_remove(array, item) 
{
    if (array.length == 0) return;
    var idx = array.indexOf(item);
    array.splice(idx, 1);
}

//expected: file#target
function url_has_target(url)
{
    return _string_has_second_component(url, "#");
}
//expected: file#target
function url_get_target(url)
{
    return _string_get_second_component(url, "#");
}


//base: http://foo/bar/stuff
//rel_path: ../my/path or ./my/path or my/path
//warning: this may fail for relative paths like:
// ./this/../thing/../is/not/working 
//(interspersed ../ parts)
function go_relative(base, rel_path)
{
    //strip the protocol
    var base_split_a = base.split("://");

var isAbsoluteFilePath = base_split_a[1][0] == "/";

    var base_split_b = base_split_a[1].split("/");
    
    var rel_split = rel_path.split("/");
    
    //clear any blank items (leftover if ends in "/")
    base_split_b.forEach(function(p){
       if (p == "") array_remove(base_split_b, p);
    });
    rel_split.forEach(function(p){
       if (p == "") array_remove(rel_split, p) 
    });
    
    //process the .. and . items
    var len = rel_split.length;
    for (var i = len-1; i>=0; i--)
    {
        if (rel_split[i] == "..")
        {
            var last = base_split_b[base_split_b.length-1];
            array_remove(base_split_b, last);
            array_remove(rel_split, rel_split[i]);
        } 
        else if (rel_split[i] == ".")
        {
            array_remove(rel_split, rel_split[i]);
        }
    }
    
    
    //now glue the remaining pieces together
    var abs = base_split_a[0];    //the protocol
    var abs = abs + "://";
if (isAbsoluteFilePath){
	abs = abs + "/";
}
    base_split_b.forEach(function(p){
       abs = abs + p + "/"; 
    });
    
    rel_split.forEach(function(p){
        abs = abs + p + "/";
    });
    
   if (rel_path[rel_path.length-1] == "/") return abs;
   else return abs.substring(0, abs.length-1);
   
}
function url_is_absolute(url)
{
    if (url.indexOf("://") != -1)
        return true;
    else
        return false;
}
function remove_hash(frag)
{
	if (!frag || frag.length == 0)
		return "";
	if (frag[0] == "#") {
		if (frag.length > 1) 
			return frag.substring(1);
		else
			return "";
	}
	else {
		return frag;
	}
	
}
function resolve_frag(frag, base)
{
	// if frag is really just a #fragment and nothing else
	if (frag[0] == "#")
		return base + frag;
	else
		return frag;
}
function debug_trace(msg) 
{
	console.log(msg);
}
function debug_error(msg) 
{
	console.error(msg);
}
