function DB()
{
	this.db = null;
}
DB.prototype.load_smilrefs_textfile = function(filename)
{
	if (!this.create_db())
		return false;
	//open the text file
	var xml_http = new window.XMLHttpRequest();
    xml_http.overrideMimeType("text");
    xml_http.open("GET", filename, false);
    xml_http.send(null);
    var text = xml_http.responseText;
	var lines = text.split("\n");
	for (var i = 0; i<lines.length; i++) {
		var spl = lines[i].split(",");
		this.insert_row(spl[0], spl[1]);
	};
	return true;
}
DB.prototype.create_db = function()
{
    try {
        if (!window.openDatabase) {
            console.error("DBs not supported.");
			return false;
        }
            
        this.db = openDatabase("audioepub", "1.0", "Test of epub and audio", 5*1024);
        if (!this.db) {
			console.error("Could not open DB.");
			return false;
		}
    }
    catch(err) { 
		console.error("Error: " + err.message);
		return false;
	}
	var request = "CREATE TEMPORARY TABLE SmilRefMap (textid TEXT, smilid TEXT, PRIMARY KEY(textid))";
	this.execute_query(request, [], null);
	return true;
}

DB.prototype.insert_row = function(textid, smilid)
{
	if (textid == undefined || textid == "") return;
	if (smilid == undefined || smilid == "") return;
	var request = "INSERT INTO SmilRefMap (textid, smilid) VALUES (?,?)";
	this.execute_query(request, [textid, smilid], null);
}

DB.prototype.execute_query = function(statement, values, fn)
{
	console.log(statement);
	this.db.transaction(function(tx) {
		tx.executeSql(statement, values, fn, this.sql_error_handler); 
	});
}
DB.prototype.sql_error_handler = function(transaction, error)
{
    console.error('Error: '+ error.message +' (Code '+error.code+')');
    return false;

}
DB.prototype.find_smilid = function(textid, callback)
{
	var request = "SELECT smilid from SmilRefMap WHERE textid=?";
	var smilid = "";
	this.execute_query(request, [textid], function(tx, results) {
		if (results.rows.length > 0) {
			callback(results.rows.item(0)['smilid']);
		}
		else {
			callback("");
		}
	});
}
DB.prototype.debug_print = function(debug_region)
{
	var request = "SELECT * from SmilRefMap";
	this.execute_query(request, [], function(transaction, results){
	
		var tablecontents = "";
		
	    for (var i=0; i<results.rows.length; i++) {
	        var row = results.rows.item(i);
	        tablecontents += "<tr><td>" + row['textid'] + "</td><td>" + row['smilid'] + "</td></tr>";
			
	    }
	
		console.log(tablecontents);
		if (debug_region) debug_region.innerHTML += "<table>" + tablecontents + "</table>";
		
	});
}