var express = require('express');
var app	    = express();

app.get('/', function(reg,res){
	console.log('ServerHit: ' +timeStamp())
	res.send(ServerHit: ' + timeStamp());
});

function timeStamp(){

	var currentdate = new Date();
	var prettyTime = currentdate.getHourse() + ":" +
			currentdate.getMinutes() + ":" +
			currentdate.getSeconds();
	return prettyTime;
}

var port = 3001;
app.listen(kport,function(){
	console.log('Listening on port: ' + port);
});
