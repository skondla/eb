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
         console.log("Connected to 'smartAccount2' database. Ready for CRUD on 'virtualAccount'"); 
         db.collection('virtualAccount', {strict:true}, function(err, collection) { 
             if (err) { 
                 console.log("The 'virtualAccount' collection doesn't exist. Creating it with sample data..."); 
                 populateDB(); 
             } 
         }); 
     } 
 }); 
 
 
exports.findById = function(req, res) { 
     var id = req.params.id; 
     console.log('Retrieving virtualAccount: ' + id); 
     db.collection('virtualAccount', function(err, collection) { 
     collection.findOne({'_id':new BSON.ObjectId(id)}, function(err, item) { 
     res.send(item); 
         }); 
    }); 
}; 
 
exports.findAll = function(req, res) { 
     db.collection('virtualAccount', function(err, collection) { 
         collection.find().toArray(function(err, items) { 
             res.send(items); 
         }); 
     }); 
 }; 
 
 exports.addvirtualAccount = function(req, res) { 
     var virtualAccount = req.body; 
     console.log('Adding virtualAccount: ' + JSON.stringify(virtualAccount)); 
     db.collection('virtualAccount', function(err, collection) { 
         collection.insert(virtualAccount, {safe:true}, function(err, result) { 
             if (err) { 
                 res.send({'error':'An error has occurred'}); 
             } else { 
                 console.log('Success: ' + JSON.stringify(result[0])); 
                 res.send(result[0]); 
             } 
         }); 
    }); 
 } 
 
exports.updatevirtualAccount = function(req, res) { 
     var id = req.params.id; 
     var virtualAccount = req.body; 
     console.log('Updating virtualAccount: ' + id); 
     console.log(JSON.stringify(virtualAccount)); 
     db.collection('virtualAccount', function(err, collection) { 
         collection.update({'_id':new BSON.ObjectId(id)}, virtualAccount, {safe:true}, function(err, result) { 
             if (err) { 
                 console.log('Error updating virtualAccount: ' + err); 
                 res.send({'error':'An error has occurred'}); 
             } else { 
                 console.log('' + result + ' document(s) updated'); 
                 res.send(virtualAccount); 
             } 
         }); 
     }); 
 } 
 
 exports.deletevirtualAccount = function(req, res) { 
     var id = req.params.id; 
     console.log('Deleting virtualAccount: ' + id); 
     db.collection('virtualAccount', function(err, collection) { 
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
 
     var virtualAccount = [ 
     { 
	"Virtual_Account_ID" : 21,
	"Virtual Account Name" : "Fullfilment",
	"Virtual Account Description" : "Walmart  - Fullfilmenti Department",
	"Default_VA" : "N",
	"Order_Assignable" : "Y",
	"Status" : "ACTIVE",
	"Parent Virtual Account ID" : 5,
	"Is_Active" : 1,
	"Created By" : "Tom McKincey",
	"Created On" : "10/11/15",
	"Last Updated By" : "Tom McKincey",
	"Last Updated On" : "10/11/15",
	"Overage" : "Y",
	"Smart_Account_ID" : 5,
	"Position" : "1,3",
	"ENTITLEMENT_OBJ_ID" : "",
	"IS_SHARABLE" : "Y"
     }, 
     { 
	"Virtual_Account_ID" : 22,
        "Virtual Account Name" : "Accounting",
        "Virtual Account Description" : "Walmart  - Accounting Department",
        "Default_VA" : "N",
        "Order_Assignable" : "Y",
        "Status" : "ACTIVE",
        "Parent Virtual Account ID" : 5,
        "Is_Active" : 1,
        "Created By" : "Tom McKincey",
        "Created On" : "10/11/15",
        "Last Updated By" : "Tom McKincey",
        "Last Updated On" : "10/11/15",
        "Overage" : "Y",
        "Smart_Account_ID" : 5,
        "Position" : "1,3",
        "ENTITLEMENT_OBJ_ID" : "",
        "IS_SHARABLE" : "Y"
	
     }]; 
 
     db.collection('virtualAccount', function(err, collection) { 
         collection.insert(virtualAccount, {safe:true}, function(err, result) {}); 
     }); 
 
 }; 

