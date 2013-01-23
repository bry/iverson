// TCP chat server
net = require('net');

var sockets = [];

var s = net.Server(function(socket) {
  // Add connected socket
  sockets.push(socket);

  // Write to all other sockets
  socket.on('data', function(data) {
    for (var i = 0; i < sockets.length; i++) {
      if (sockets[i] == socket) continue;
      sockets[i].write(data);
    }
  });

  // Remove terminated sockets
  socket.on('end', function() {
    var i = sockets.indexOf(socket);
    sockets.splice(i,1);
  });
});

// Start chat server listener
s.listen(8000);
