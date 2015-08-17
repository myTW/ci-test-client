#!/usr/bin/env nodejs

var dgram = require('dgram');
var message = new Buffer("OK");
var client = dgram.createSocket("udp4");
client.send(message, 0, message.length, 41234, "localhost", function(err) {
  client.close();
});


var server = dgram.createSocket("udp4");

server.on("press", function (err) {
  console.log("server error:\n" + err.stack);
  server.close();
});

server.bind(41234);
// server listening 0.0.0.0:41234
