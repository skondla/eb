//Author:  Sudheer Kondla, sudheer.kondla@gmail.com , Created:11/02/2015
var express = require('express'), 
accessCache = require('./routes/accessCache'); 
var app = express(); 
app.configure(function () { 
   app.use(express.logger('dev'));     
   app.use(express.bodyParser()); 
}); 

//Access Cache
app.get('/accessCache', accessCache.findAll);
app.get('/accessCache/:id', accessCache.findById);
app.post('/accessCache', accessCache.addaccessCache);
app.put('/accessCache/:id', accessCache.updateaccessCache);
app.delete('/accessCache/:id', accessCache.deleteaccessCache);
app.listen(3001); 
console.log('Listening on port 3001...'); 
