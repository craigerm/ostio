var http = require('http')
  , connect = require('connect')
  , fs = require('fs')
  , indexContent = fs.readFileSync('./public/index.html');

var app = connect()
  .use(connect.static('public'))
  .use(function(req, res) {
    res.end(indexContent);
  });

http.createServer(app).listen(process.env.PORT || 3333);
