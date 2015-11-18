//Author: Sudheer Kondla
//email: sudheer.kondla@gmail.com
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
         console.log("Connected to 'smartAccount2' database. Ready for CRUD on 'roleResource'"); 
         db.collection('roleResource', {strict:true}, function(err, collection) { 
             if (err) { 
                 console.log("The 'roleResource' collection doesn't exist. Creating it with sample data..."); 
                 populateDB(); 
             } 
         }); 
     } 
 }); 
 
 
exports.findById = function(req, res) { 
     var id = req.params.id; 
     console.log('Retrieving roleResource: ' + id); 
     db.collection('roleResource', function(err, collection) { 
     collection.findOne({'_id':new BSON.ObjectId(id)}, function(err, item) { 
     res.send(item); 
         }); 
    }); 
}; 
 
exports.findAll = function(req, res) { 
     db.collection('roleResource', function(err, collection) { 
         collection.find().toArray(function(err, items) { 
             res.send(items); 
         }); 
     }); 
 }; 
 
 exports.addroleResource = function(req, res) { 
     var roleResource = req.body; 
     console.log('Adding roleResource: ' + JSON.stringify(roleResource)); 
     db.collection('roleResource', function(err, collection) { 
         collection.insert(roleResource, {safe:true}, function(err, result) { 
             if (err) { 
                 res.send({'error':'An error has occurred'}); 
             } else { 
                 console.log('Success: ' + JSON.stringify(result[0])); 
                 res.send(result[0]); 
             } 
         }); 
    }); 
 } 
 
exports.updateroleResource = function(req, res) { 
     var id = req.params.id; 
     var roleResource = req.body; 
     console.log('Updating roleResource: ' + id); 
     console.log(JSON.stringify(roleResource)); 
     db.collection('roleResource', function(err, collection) { 
         collection.update({'_id':new BSON.ObjectId(id)}, roleResource, {safe:true}, function(err, result) { 
             if (err) { 
                 console.log('Error updating roleResource: ' + err); 
                 res.send({'error':'An error has occurred'}); 
             } else { 
                 console.log('' + result + ' document(s) updated'); 
                 res.send(roleResource); 
             } 
         }); 
     }); 
 } 
 
 exports.deleteroleResource = function(req, res) { 
     var id = req.params.id; 
     console.log('Deleting roleResource: ' + id); 
     db.collection('roleResource', function(err, collection) { 
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
 
     var roleResource = [ 
     { 
	"Role_Resource_ID" : 21,
	"Role_ID" : 1,
	"Resource_ID" : 20,
	"Created_On" : "10/26/15",
	"Created_By" : "Tom McKincey"
     }, 
     { 
	"Role_Resource_ID" : 22,
	"Role_ID" : 1,
	"Resource_ID" : 20,
	"Created_On" : "10/26/15",
	"Created_By" : "Sudheer Kondla"
     }]; 
 
     db.collection('roleResource', function(err, collection) { 
         collection.insert(roleResource, {safe:true}, function(err, result) {}); 
     }); 
 
 }; 

