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
         console.log("Connected to 'smartAccount2' database. Ready for CRUD on 'resourceMaster'"); 
         db.collection('resourceMaster', {strict:true}, function(err, collection) { 
             if (err) { 
                 console.log("The 'resourceMaster' collection doesn't exist. Creating it with sample data..."); 
                 populateDB(); 
             } 
         }); 
     } 
 }); 
 
 
exports.findById = function(req, res) { 
     var id = req.params.id; 
     console.log('Retrieving resourceMaster: ' + id); 
     db.collection('resourceMaster', function(err, collection) { 
     collection.findOne({'_id':new BSON.ObjectId(id)}, function(err, item) { 
     res.send(item); 
         }); 
    }); 
}; 
 
exports.findAll = function(req, res) { 
     db.collection('resourceMaster', function(err, collection) { 
         collection.find().toArray(function(err, items) { 
             res.send(items); 
         }); 
     }); 
 }; 
 
 exports.addresourceMaster = function(req, res) { 
     var resourceMaster = req.body; 
     console.log('Adding resourceMaster: ' + JSON.stringify(resourceMaster)); 
     db.collection('resourceMaster', function(err, collection) { 
         collection.insert(resourceMaster, {safe:true}, function(err, result) { 
             if (err) { 
                 res.send({'error':'An error has occurred'}); 
             } else { 
                 console.log('Success: ' + JSON.stringify(result[0])); 
                 res.send(result[0]); 
             } 
         }); 
    }); 
 } 
 
exports.updateresourceMaster = function(req, res) { 
     var id = req.params.id; 
     var resourceMaster = req.body; 
     console.log('Updating resourceMaster: ' + id); 
     console.log(JSON.stringify(resourceMaster)); 
     db.collection('resourceMaster', function(err, collection) { 
         collection.update({'_id':new BSON.ObjectId(id)}, resourceMaster, {safe:true}, function(err, result) { 
             if (err) { 
                 console.log('Error updating resourceMaster: ' + err); 
                 res.send({'error':'An error has occurred'}); 
             } else { 
                 console.log('' + result + ' document(s) updated'); 
                 res.send(resourceMaster); 
             } 
         }); 
     }); 
 } 
 
 exports.deleteresourceMaster = function(req, res) { 
     var id = req.params.id; 
     console.log('Deleting resourceMaster: ' + id); 
     db.collection('resourceMaster', function(err, collection) { 
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
 
     var resourceMaster = [ 
     { 
	"Resource_ID" : 21,
	"Resource_Name" : "Right to Software Images",
	"Resource_Description" : "Software Images",
	"Created_on" : "10/13/15",
	"Created_By" : "Josh McKincey",
	"Last_Updated_on" : "10/14/15"
     }, 
     { 
	"Resource_ID" : 22,
	"Resource_Name" : "Right to Software Images",
	"Resource_Description" : "Software Images",
	"Created_on" : "10/13/15",
	"Created_By" : "Tom McKincey",
	"Last_Updated_on" : "10/14/15"
     }]; 
 
     db.collection('resourceMaster', function(err, collection) { 
         collection.insert(resourceMaster, {safe:true}, function(err, result) {}); 
     }); 
 
 }; 

