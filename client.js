var fs = require('fs');
var dgram = require('dgram');
var server = dgram.createSocket("udp4");
var client = dgram.createSocket("udp4");

var REMOTE = "10.29.3.215";
var selfPort = 41235;
var remotePort = 41234;

server.on("message", function (msg, err) {
    console.log('reveived: ' + msg);

    var status = fs.readFileSync("/sys/class/leds/green\:ph24\:led1/brightness");
    var message = new Buffer(status);

    client.send(message, 0, message.length, remotePort, REMOTE, function (err) {
        client.close();
    });
});

server.bind(selfPort, '0.0.0.0');
