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
         console.log("Connected to 'smartAccount2' database. Ready for CRUD on 'roles'"); 
         db.collection('roles', {strict:true}, function(err, collection) { 
             if (err) { 
                 console.log("The 'roles' collection doesn't exist. Creating it with sample data..."); 
                 populateDB(); 
             } 
         }); 
     } 
 }); 
 
 
exports.findById = function(req, res) { 
     var id = req.params.id; 
     console.log('Retrieving roles: ' + id); 
     db.collection('roles', function(err, collection) { 
     collection.findOne({'_id':new BSON.ObjectId(id)}, function(err, item) { 
     res.send(item); 
         }); 
    }); 
}; 
 
exports.findAll = function(req, res) { 
     db.collection('roles', function(err, collection) { 
         collection.find().toArray(function(err, items) { 
             res.send(items); 
         }); 
     }); 
 }; 
 
 exports.addroles = function(req, res) { 
     var roles = req.body; 
     console.log('Adding roles: ' + JSON.stringify(roles)); 
     db.collection('roles', function(err, collection) { 
         collection.insert(roles, {safe:true}, function(err, result) { 
             if (err) { 
                 res.send({'error':'An error has occurred'}); 
             } else { 
                 console.log('Success: ' + JSON.stringify(result[0])); 
                 res.send(result[0]); 
             } 
         }); 
    }); 
 } 
 
exports.updateroles = function(req, res) { 
     var id = req.params.id; 
     var roles = req.body; 
     console.log('Updating roles: ' + id); 
     console.log(JSON.stringify(roles)); 
     db.collection('roles', function(err, collection) { 
         collection.update({'_id':new BSON.ObjectId(id)}, roles, {safe:true}, function(err, result) { 
             if (err) { 
                 console.log('Error updating roles: ' + err); 
                 res.send({'error':'An error has occurred'}); 
             } else { 
                 console.log('' + result + ' document(s) updated'); 
                 res.send(roles); 
             } 
         }); 
     }); 
 } 
 
 exports.deleteroles = function(req, res) { 
     var id = req.params.id; 
     console.log('Deleting roles: ' + id); 
     db.collection('roles', function(err, collection) { 
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
 
     var roles = [ 
     { 
	"Role_ID" : 7,
	"Role_Name" : "virtualAccountViewer",
	"Role_Description" : "Virtual Account Viewer",
	"Role_Type" : "Viewer",
	"Created_On" : "10/10/15",
	"Last_Updated_on" : "10/11/15",
	"Created_By" : "Tom McKincey"
     }, 
     { 
	"Role_ID" : 8,
	"Role_Name" : "virtualAccountUser",
	"Role_Description" : "Virtual Account User",
	"Role_Type" : "User",
	"Created_On" : "10/10/15",
	"Last_Updated_on" : "10/11/15",
	"Created_By" : "Tom McKincey"
     }]; 
 
     db.collection('roles', function(err, collection) { 
         collection.insert(roles, {safe:true}, function(err, result) {}); 
     }); 
 
 }; 

