//Author:  Sudheer Kondla, sudheer.kondla@gmail.com , Created:10/30/2015
var express = require('express'), 
smartAccount = require('./routes/smartAccount'); 
virtualAccount = require('./routes/virtualAccount'); 
var app = express(); 
app.configure(function () { 
   app.use(express.logger('dev'));     
   app.use(express.bodyParser()); 
}); 

//smart Account CRUD routes
app.get('/smartAccount', smartAccount.findAll);
app.get('/smartAccount/:id', smartAccount.findById);
app.post('/smartAccount', smartAccount.addsmartAccount);
app.put('/smartAccount/:id', smartAccount.updatesmartAccount);
app.delete('/smartAccount/:id', smartAccount.deletesmartAccount);
//Virtual Acount CRUD routes
app.get('/virtualAccount', virtualAccount.findAll);
app.get('/virtualAccount/:id', virtualAccount.findById);
app.post('/virtualAccount', virtualAccount.addvirtualAccount);
app.put('/virtualAccount/:id', virtualAccount.updatevirtualAccount);
app.delete('/virtualAccount/:id', virtualAccount.deletevirtualAccount);

app.listen(3003); 
console.log('Listening on port 3003...'); 
