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
         db.collection('entitlementObject', {strict:true}, function(err, collection) { 
             if (err) { 
                 console.log("The 'entitlementObject' collection doesn't exist. Creating it with sample data..."); 
                 populateDB(); 
             } 
         }); 
     } 
 }); 
 
 
exports.findById = function(req, res) { 
     var id = req.params.id; 
     console.log('Retrieving entitlementObject: ' + id); 
     db.collection('entitlementObject', function(err, collection) { 
     collection.findOne({'_id':new BSON.ObjectId(id)}, function(err, item) { 
     res.send(item); 
         }); 
    }); 
}; 
 
exports.findAll = function(req, res) { 
     db.collection('entitlementObject', function(err, collection) { 
         collection.find().toArray(function(err, items) { 
             res.send(items); 
         }); 
     }); 
 }; 
 
 exports.addentitlementObject = function(req, res) { 
     var entitlementObject = req.body; 
     console.log('Adding entitlementObject: ' + JSON.stringify(entitlementObject)); 
     db.collection('entitlementObject', function(err, collection) { 
         collection.insert(entitlementObject, {safe:true}, function(err, result) { 
             if (err) { 
                 res.send({'error':'An error has occurred'}); 
             } else { 
                 console.log('Success: ' + JSON.stringify(result[0])); 
                 res.send(result[0]); 
             } 
         }); 
    }); 
 } 
 
exports.updateentitlementObject = function(req, res) { 
     var id = req.params.id; 
     var entitlementObject = req.body; 
     console.log('Updating entitlementObject: ' + id); 
     console.log(JSON.stringify(entitlementObject)); 
     db.collection('entitlementObject', function(err, collection) { 
         collection.update({'_id':new BSON.ObjectId(id)}, entitlementObject, {safe:true}, function(err, result) { 
             if (err) { 
                 console.log('Error updating entitlementObject: ' + err); 
                 res.send({'error':'An error has occurred'}); 
             } else { 
                 console.log('' + result + ' document(s) updated'); 
                 res.send(entitlementObject); 
             } 
         }); 
     }); 
 } 
 
 exports.deleteentitlementObject = function(req, res) { 
     var id = req.params.id; 
     console.log('Deleting entitlementObject: ' + id); 
     db.collection('entitlementObject', function(err, collection) { 
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
     var entitlementObject = [ 
     {
	"Entitlement_Object_ID" : 19,
	"Entitlement_Class_ID" : 14,
	"Smart_Account_ID" : 3,
	"Virtual_Account_ID" : 9,
	"Entitlement_Domain" : "Software",
	"Source_Type" : "SBP",
	"Source_Reference_ID" : "SBP1001",
	"Status" : "ACTIVE",
	"Start_Date" : "10/17/15",
	"End_Date" : "10/16/15",
	"Attribute_name1" : "Product_ID",
	"Attribute_value1" : "A-WX-STORAGE-OVER",
	"Attribute_name2" : "Entitlement_Name",
	"Attribute_value2" : "Enable Storage Overage",
	"Attribute_name3" : "Usage",
	"Attribute_value3" : "Per GB",
	"Attribute_name4" : "Entitlement_Quantity",
	"Attribute_value4" : "NULL",
	"Attribute_name5" : "NULL",
	"Attribute_value5" : "NULL",
	"Attribute_name6" : "NULL",
	"Attribute_value6" : "NULL",
	"Entitlement_Ops_Name_1" : "Right to Use",
	"Entitlement_Ops_Name_2" : "NULL",
	"Entitlement_Ops_Name_3" : "NULL",
	"Entitlement_Ops_Name_4" : "NULL",
	"Entitlement_Ops_Name_5" : "NULL"
     },	 
     {
	"Entitlement_Object_ID" : 20,
	"Entitlement_Class_ID" : 14,
	"Smart_Account_ID" : 3,
	"Virtual_Account_ID" : 9,
	"Entitlement_Domain" : "Software",
	"Source_Type" : "SBP",
	"Source_Reference_ID" : "SBP1001",
	"Status" : "ACTIVE",
	"Start_Date" : "10/17/15",
	"End_Date" : "10/16/15",
	"Attribute_name1" : "Product_ID",
	"Attribute_value1" : "A-WX-STORAGE-OVER",
	"Attribute_name2" : "Entitlement_Name",
	"Attribute_value2" : "Enable Storage Overage",
	"Attribute_name3" : "Usage",
	"Attribute_value3" : "Per GB",
	"Attribute_name4" : "Entitlement_Quantity",
	"Attribute_value4" : "NULL",
	"Attribute_name5" : "NULL",
	"Attribute_value5" : "NULL",
	"Attribute_name6" : "NULL",
	"Attribute_value6" : "NULL",
	"Entitlement_Ops_Name_1" : "Right to Use",
	"Entitlement_Ops_Name_2" : "NULL",
	"Entitlement_Ops_Name_3" : "NULL",
	"Entitlement_Ops_Name_4" : "NULL",
	"Entitlement_Ops_Name_5" : "NULL"
     }]; 
 
     db.collection('entitlementObject', function(err, collection) { 
         collection.insert(entitlementObject, {safe:true}, function(err, result) {}); 
     }); 
 
 }; 

