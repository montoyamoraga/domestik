var fs = require('fs');
var PeerServer = require('peer').PeerServer;

var server = PeerServer({
  port: 9000,
  ssl: {
    //key: fs.readFileSync('your.key'),
    key: fs.readFileSync('./my-key.pem'),
    //cert: fs.readFileSync('your.crt')
    cert: fs.readFileSync('./my-cert.pem')
  }
});
