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
         db.collection('entitlementClass', {strict:true}, function(err, collection) { 
             if (err) { 
                 console.log("The 'entitlementClass' collection doesn't exist. Creating it with sample data..."); 
                 populateDB(); 
             } 
         }); 
     } 
 }); 
 
 
exports.findById = function(req, res) { 
     var id = req.params.id; 
     console.log('Retrieving entitlementClass: ' + id); 
     db.collection('entitlementClass', function(err, collection) { 
     collection.findOne({'_id':new BSON.ObjectId(id)}, function(err, item) { 
     res.send(item); 
         }); 
    }); 
}; 
 
exports.findAll = function(req, res) { 
     db.collection('entitlementClass', function(err, collection) { 
         collection.find().toArray(function(err, items) { 
             res.send(items); 
         }); 
     }); 
 }; 
 
 exports.addentitlementClass = function(req, res) { 
     var entitlementClass = req.body; 
     console.log('Adding entitlementClass: ' + JSON.stringify(entitlementClass)); 
     db.collection('entitlementClass', function(err, collection) { 
         collection.insert(entitlementClass, {safe:true}, function(err, result) { 
             if (err) { 
                 res.send({'error':'An error has occurred'}); 
             } else { 
                 console.log('Success: ' + JSON.stringify(result[0])); 
                 res.send(result[0]); 
             } 
         }); 
    }); 
 } 
 
exports.updateentitlementClass = function(req, res) { 
     var id = req.params.id; 
     var entitlementClass = req.body; 
     console.log('Updating entitlementClass: ' + id); 
     console.log(JSON.stringify(entitlementClass)); 
     db.collection('entitlementClass', function(err, collection) { 
         collection.update({'_id':new BSON.ObjectId(id)}, entitlementClass, {safe:true}, function(err, result) { 
             if (err) { 
                 console.log('Error updating entitlementClass: ' + err); 
                 res.send({'error':'An error has occurred'}); 
             } else { 
                 console.log('' + result + ' document(s) updated'); 
                 res.send(entitlementClass); 
             } 
         }); 
     }); 
 } 
 
 exports.deleteentitlementClass = function(req, res) { 
     var id = req.params.id; 
     console.log('Deleting entitlementClass: ' + id); 
     db.collection('entitlementClass', function(err, collection) { 
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
     var entitlementClass = [ 
     {
	"Entitlement_class_ID" : 19,
	"Entitlement_Class_Name" : "Smart Account Administration (TBD)",
	"Entitlement_Domain" : "Administration",
	"Entitlement_Class_Desc" : "",
	"Created_On" : "10/10/15",
	"Created_By" : "Tom McKincey",
	"Last_Updated_on" : "10/15/15",
	"Attribute_name1" : "",
	"Attribute_name2" : "",
	"Attribute_name3" : "",
	"Attribute_name4" : "",
	"Attribute_name5" : ""
     },	 
     {
	"Entitlement_class_ID" : 20,
	"Entitlement_Class_Name" : "Smart Account Administration (TBD)",
	"Entitlement_Domain" : "Administration",
	"Entitlement_Class_Desc" : "",
	"Created_On" : "10/10/15",
	"Created_By" : "Tom McKincey",
	"Last_Updated_on" : "10/15/15",
	"Attribute_name1" : "",
	"Attribute_name2" : "",
	"Attribute_name3" : "",
	"Attribute_name4" : "",
	"Attribute_name5" : ""
     }]; 
 
     db.collection('entitlementClass', function(err, collection) { 
         collection.insert(entitlementClass, {safe:true}, function(err, result) {}); 
     }); 
 
 }; 

