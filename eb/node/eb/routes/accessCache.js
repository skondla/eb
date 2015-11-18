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
 db = new Db('accessCache', server); 
 
db.open(function(err, db) { 
     if(!err) { 
         console.log("Connected to 'accessCache' database"); 
         db.collection('accessCache', {strict:true}, function(err, collection) { 
             if (err) { 
                 console.log("The 'accessCache' collection doesn't exist. Creating it with sample data..."); 
                 populateDB(); 
             } 
         }); 
     } 
 }); 
 
 
exports.findById = function(req, res) { 
     var id = req.params.id; 
     console.log('Retrieving accessCache: ' + id); 
     db.collection('accessCache', function(err, collection) { 
     collection.findOne({'_id':new BSON.ObjectId(id)}, function(err, item) { 
     res.send(item); 
         }); 
    }); 
}; 
 
exports.findAll = function(req, res) { 
     db.collection('accessCache', function(err, collection) { 
         collection.find().toArray(function(err, items) { 
             res.send(items); 
         }); 
     }); 
 }; 
 
 exports.addaccessCache = function(req, res) { 
     var accessCache = req.body; 
     console.log('Adding accessCache: ' + JSON.stringify(accessCache)); 
     db.collection('accessCache', function(err, collection) { 
         collection.insert(accessCache, {safe:true}, function(err, result) { 
             if (err) { 
                 res.send({'error':'An error has occurred'}); 
             } else { 
                 console.log('Success: ' + JSON.stringify(result[0])); 
                 res.send(result[0]); 
             } 
         }); 
    }); 
 } 
 
exports.updateaccessCache = function(req, res) { 
     var id = req.params.id; 
     var accessCache = req.body; 
     console.log('Updating accessCache: ' + id); 
     console.log(JSON.stringify(accessCache)); 
     db.collection('accessCache', function(err, collection) { 
         collection.update({'_id':new BSON.ObjectId(id)}, accessCache, {safe:true}, function(err, result) { 
             if (err) { 
                 console.log('Error updating accessCache: ' + err); 
                 res.send({'error':'An error has occurred'}); 
             } else { 
                 console.log('' + result + ' document(s) updated'); 
                 res.send(accessCache); 
             } 
         }); 
     }); 
 } 
 
 exports.deleteaccessCache = function(req, res) { 
     var id = req.params.id; 
     console.log('Deleting accessCache: ' + id); 
     db.collection('accessCache', function(err, collection) { 
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
 
     var accessCache = [ 
     {
	Access_Cache_ID : 11,
	User_ID : 8,
	Resource_ID : 27,
	Virtual_Account_ID : 11,
	Smart_Account_ID : 3	
     },	 
     {
	Access_Cache_ID : 12,
	User_ID : 7,
	Resource_ID : 28,
	Virtual_Account_ID : 12,
	Smart_Account_ID : 3 
     }]; 
 
     db.collection('accessCache', function(err, collection) { 
         collection.insert(accessCache, {safe:true}, function(err, result) {}); 
     }); 
 
 }; 

