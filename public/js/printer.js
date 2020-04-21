var socket = null;
var socket_host = 'ws://202.62.37.18:9100';

initializeSocket = function() {
    try {
        if (socket == null) {
            socket = new WebSocket(socket_host);
            socket.onopen = function() {};
            socket.onmessage = function(msg) {};
            socket.onclose = function() {
                socket = null;
            };
        }
    } catch (e) {
        console.log(e);
    }
};
