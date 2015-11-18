//Author:  Sudheer Kondla, sudheer.kondla@gmail.com , Created:11/02/2015
var mongo = require('mongodb'); 
 
 var Server = mongo.Server, 
     Db = mongo.Db;//, 
    // BSON = mongo.BSONPure; 
    // BSON = require('bson').BSONPure;
//var BSON = require('bson').BSONPure;
//var BSON = mongodb.BSONPure;
var BSON = require('mongodb').ObjectID;
 
 var server = new Server('localhost', 27017, {auto_reconnect: true}); 
 db = new Db('smartAccount2', server); 
 
db.open(function(err, db) { 
     if(!err) { 
         console.log("Connected to 'smartAccount2' database. Ready for CRUD on 'smartAccount'"); 
         //console.log("Ready for CRUD on 'smartAccount' collection"); 
         db.collection('smartAccount', {strict:true}, function(err, collection) { 
             if (err) { 
                 console.log("The 'smartAccount' collection doesn't exist. Creating it with sample data..."); 
                 populateDB(); 
             } 
         }); 
     } 
 }); 
 
 
exports.findById = function(req, res) { 
     var id = req.params.id; 
     console.log('Retrieving smartAccount: ' + id); 
     db.collection('smartAccount', function(err, collection) { 
     collection.findOne({'_id':new BSON.ObjectId(id)}, function(err, item) { 
     res.send(item); 
         }); 
    }); 
}; 
 
exports.findAll = function(req, res) { 
     db.collection('smartAccount', function(err, collection) { 
         collection.find().toArray(function(err, items) { 
             res.send(items); 
         }); 
     }); 
 }; 
 
 exports.addsmartAccount = function(req, res) { 
     var smartAccount = req.body; 
     console.log('Adding smartAccount: ' + JSON.stringify(smartAccount)); 
     db.collection('smartAccount', function(err, collection) { 
         collection.insert(smartAccount, {safe:true}, function(err, result) { 
             if (err) { 
                 res.send({'error':'An error has occurred'}); 
             } else { 
                 console.log('Success: ' + JSON.stringify(result[0])); 
                 res.send(result[0]); 
             } 
         }); 
    }); 
 } 
 
exports.updatesmartAccount = function(req, res) { 
     var id = req.params.id; 
     var smartAccount = req.body; 
     console.log('Updating smartAccount: ' + id); 
     console.log(JSON.stringify(smartAccount)); 
     db.collection('smartAccount', function(err, collection) { 
         collection.update({'_id':new BSON.ObjectId(id)}, smartAccount, {safe:true}, function(err, result) { 
             if (err) { 
                 console.log('Error updating smartAccount: ' + err); 
                 res.send({'error':'An error has occurred'}); 
             } else { 
                 console.log('' + result + ' document(s) updated'); 
                 res.send(smartAccount); 
             } 
         }); 
     }); 
 } 
 
 exports.deletesmartAccount = function(req, res) { 
     var id = req.params.id; 
     console.log('Deleting smartAccount: ' + id); 
     db.collection('smartAccount', function(err, collection) { 
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
 
     var smartAccount = [ 
     { 
	"Smart_Account_ID" : 11,
	"Smart_Account_Name" : "XYZ_CORP",
	"Smart_Account_Description" : "XYZ corporation",
	"Domain" : "abc.com",
	"Type" : "Customer",
	"Customer_Type" : "Individual",
	"Source" : "TRANSACTION",
	"Status" : "ACTIVE",
	"Agreement_Status" : "null",
	"Message_to_Creator" : "null",
	"Creator_Domain" : "Y",
	"Contact_Phone" : "800-777-4564",
	"CR_Party_ID" : 14,
	"Is_Active" : 1,
	"Status_Change_Reason_Code" : "null",
	"Requesting_User" : "Antony J.",
	"Internal_Comments" : "Individual customer",
	"Account_Type" : "SA",
	"Created_By" : "Jill Wagner",
	"Created_On" : "10/19/15",
	"Last_Updated_By" : "Jill Wagner",
	"Last_Updated_on" : "10/20/15"
     }, 
     { 
	"Smart_Account_ID" : 12,
	"Smart_Account_Name" : "KBH_CORP",
	"Smart_Account_Description" : "KBH corporation",
	"Domain" : "abc.com",
	"Type" : "Customer",
	"Customer_Type" : "Individual",
	"Source" : "TRANSACTION",
	"Status" : "ACTIVE",
	"Agreement_Status" : "null",
	"Message_to_Creator" : "null",
	"Creator_Domain" : "Y",
	"Contact_Phone" : "833-433-4564",
	"CR_Party_ID" : 15,
	"Is_Active" : 1,
	"Status_Change_Reason_Code" : "null",
	"Requesting_User" : "Antony J.",
	"Internal_Comments" : "Individual customer",
	"Account_Type" : "SA",
	"Created_By" : "Jill Wagner",
	"Created_On" : "10/19/15",
	"Last_Updated_By" : "Jill Wagner",
	"Last_Updated_on" : "10/20/15"

     }]; 
 
     db.collection('smartAccount', function(err, collection) { 
         collection.insert(smartAccount, {safe:true}, function(err, result) {}); 
     }); 
 
 }; 

