//Author:  Sudheer Kondla, sudheer.kondla@gmail.com , Created:11/10/2015
var mongo = require('mongodb'); 
 
 var Server = mongo.Server, 
     Db = mongo.Db;//, 
    // BSON = mongo.BSONPure; 
    // BSON = require('bson').BSONPure;
//var BSON = require('bson').BSONPure;
//var BSON = mongodb.BSONPure;
var BSON = require('mongodb').ObjectID;
 
 var server = new Server('localhost', 27017, {auto_reconnect: true}); 
 db = new Db('eoCache', server); 
 
db.open(function(err, db) { 
     if(!err) { 
         console.log("Connected to 'eoCache' database"); 
         db.collection('entitlementOps', {strict:true}, function(err, collection) { 
             if (err) { 
                 console.log("The 'entitlementOps' collection doesn't exist. Creating it with sample data..."); 
                 populateDB(); 
             } 
         }); 
     } 
 }); 
 
 
exports.findById = function(req, res) { 
     var id = req.params.id; 
     console.log('Retrieving entitlementOps: ' + id); 
     db.collection('entitlementOps', function(err, collection) { 
     collection.findOne({'_id':new BSON.ObjectId(id)}, function(err, item) { 
     res.send(item); 
         }); 
    }); 
}; 
 
exports.findAll = function(req, res) { 
     db.collection('entitlementOps', function(err, collection) { 
         collection.find().toArray(function(err, items) { 
             res.send(items); 
         }); 
     }); 
 }; 
 
 exports.addentitlementOps = function(req, res) { 
     var entitlementOps = req.body; 
     console.log('Adding entitlementOps: ' + JSON.stringify(entitlementOps)); 
     db.collection('entitlementOps', function(err, collection) { 
         collection.insert(entitlementOps, {safe:true}, function(err, result) { 
             if (err) { 
                 res.send({'error':'An error has occurred'}); 
             } else { 
                 console.log('Success: ' + JSON.stringify(result[0])); 
                 res.send(result[0]); 
             } 
         }); 
    }); 
 } 
 
exports.updateentitlementOps = function(req, res) { 
     var id = req.params.id; 
     var entitlementOps = req.body; 
     console.log('Updating entitlementOps: ' + id); 
     console.log(JSON.stringify(entitlementOps)); 
     db.collection('entitlementOps', function(err, collection) { 
         collection.update({'_id':new BSON.ObjectId(id)}, entitlementOps, {safe:true}, function(err, result) { 
             if (err) { 
                 console.log('Error updating entitlementOps: ' + err); 
                 res.send({'error':'An error has occurred'}); 
             } else { 
                 console.log('' + result + ' document(s) updated'); 
                 res.send(entitlementOps); 
             } 
         }); 
     }); 
 } 
 
 exports.deleteentitlementOps = function(req, res) { 
     var id = req.params.id; 
     console.log('Deleting entitlementOps: ' + id); 
     db.collection('entitlementOps', function(err, collection) { 
         collection.remove({'_id':new BSON.ObjectId(id)}, {safe:true}, function(err, result) { 
             if (err) { 
                 res.send({'error':'An error has occurred - ' + err}); 
             } else { 
                 console.log('' + result + ' document(s) deleted'); 
                 res.send(req.body); 
             } 
         }); 
     }); 
 } 
 
 /*--------------------------------------------------------------------------------------------------------------------*/ 
 // Populate database with sample data -- Only used once: the first time the application is started. 
 // You'd typically not find this code in a real-life app, since the database would already exist. 
 var populateDB = function() { 
// var inputDate = new Date(myDate.toISOString());
     var entitlementOps = [ 
     {
	"Entitlement_Ops_ID" : 46,
	"Entitlement_Ops_Name" : "Right to View Report",
	"Entitlement_Ops_Type" : "Standard",
	"Entitlement_Ops_Desc" : "",
	"Entitlement_Class_ID" : 7,
	"Status" : "Active",
	"Created_On" : "10/10/15",
	"Created_By" : "Jill Wagner"
     },	 
     {
	"Entitlement_Ops_ID" : 47,
	"Entitlement_Ops_Name" : "Right to request Report",
	"Entitlement_Ops_Type" : "Standard",
	"Entitlement_Ops_Desc" : "",
	"Entitlement_Class_ID" : 7,
	"Status" : "Active",
	"Created_On" : "10/10/15",
	"Created_By" : "Jill Wagner"	
     }]; 
 
     db.collection('entitlementOps', function(err, collection) { 
         collection.insert(entitlementOps, {safe:true}, function(err, result) {}); 
     }); 
 
 }; 

