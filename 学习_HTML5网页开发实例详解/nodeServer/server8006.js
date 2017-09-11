/*
 http://localhost:8006/#/bored
 node_modules
     consolidate
     express
     socket.io
 public
 routes
 views
* */
var express = require('express');
var routes = require('./routes');
var http = require('http');
var path = require('path');
var app = express();
var cons = require('consolidate');
app.set('port', process.env.PORT || 8006);
app.set('views', __dirname + '/views');
app.engine('html', cons.swig);
app.set('view engine', 'html');
app.use(express.favicon());
app.use(express.logger('dev'));
app.use(express.bodyParser());
app.use(express.methodOverride());
app.use(app.router);
app.use(express.static(path.join(__dirname, 'public')));
app.get('/', routes.index);
app.get('/handle', require('./routes/handle').handle);
var server = http.createServer(app);
server.listen(app.get('port'), function() {
  console.log('Express server listening on port ' + app.get('port'));
});
var io = require('socket.io').listen(server);
io.sockets.on('connection', function(socket) {
  socket.emit('news', '欢迎加入WebSocket');
  socket.on('handle', function(data) {
    io.sockets.emit('direction', data);
  });
});