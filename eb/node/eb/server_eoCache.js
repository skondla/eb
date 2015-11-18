//Author:  Sudheer Kondla, sudheer.kondla@gmail.com , Created:11/02/2015
var express = require('express'), 
entitlementClass = require('./routes/entitlementClass'); 
entitlementOps = require('./routes/entitlementOps'); 
entitlementObject = require('./routes/entitlementObject'); 
var app = express(); 
app.configure(function () { 
   app.use(express.logger('dev'));     
   app.use(express.bodyParser()); 
}); 

//Entitlement Class
app.get('/entitlementClass', entitlementClass.findAll);
app.get('/entitlementClass/:id', entitlementClass.findById);
app.post('/entitlementClass', entitlementClass.addentitlementClass);
app.put('/entitlementClass/:id', entitlementClass.updateentitlementClass);
app.delete('/entitlementClass/:id', entitlementClass.deleteentitlementClass);
//Entitlement Ops
app.get('/entitlementOps', entitlementOps.findAll);
app.get('/entitlementOps/:id', entitlementOps.findById);
app.post('/entitlementOps', entitlementOps.addentitlementOps);
app.put('/entitlementOps/:id', entitlementOps.updateentitlementOps);
app.delete('/entitlementOps/:id', entitlementOps.deleteentitlementOps);
//ENtitlement Objects
app.get('/entitlementObject', entitlementObject.findAll);
app.get('/entitlementObject/:id', entitlementObject.findById);
app.post('/entitlementObject', entitlementObject.addentitlementObject);
app.put('/entitlementObject/:id', entitlementObject.updateentitlementObject);
app.delete('/entitlementObject/:id', entitlementObject.deleteentitlementObject);
app.listen(3002); 
console.log('Listening on port 3002...'); 
