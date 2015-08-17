#!/usr/bin/env node

var dgram = require('dgram');
var message = new Buffer("0");
var server = dgram.createSocket("udp4");
var client = dgram.createSocket("udp4");

var REMOTE = "10.29.3.215";
var selfPort = 41235;
var remotePort = 41234;

server.on("message", function (msg, err) {

    console.log('reveived: ' + msg);

    client.send(message, 0, message.length, remotePort, REMOTE, function (err) {
        client.close();
    });
});

server.bind(selfPort, 'localhost');
