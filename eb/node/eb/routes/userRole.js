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
         console.log("Connected to 'smartAccount2' database. Ready for CRUD on 'userRole'"); 
         db.collection('userRole', {strict:true}, function(err, collection) { 
             if (err) { 
                 console.log("The 'userRole' collection doesn't exist. Creating it with sample data..."); 
                 populateDB(); 
             } 
         }); 
     } 
 }); 
 
 
exports.findById = function(req, res) { 
     var id = req.params.id; 
     console.log('Retrieving userRole: ' + id); 
     db.collection('userRole', function(err, collection) { 
     collection.findOne({'_id':new BSON.ObjectId(id)}, function(err, item) { 
     res.send(item); 
         }); 
    }); 
}; 
 
exports.findAll = function(req, res) { 
     db.collection('userRole', function(err, collection) { 
         collection.find().toArray(function(err, items) { 
             res.send(items); 
         }); 
     }); 
 }; 
 
 exports.adduserRole = function(req, res) { 
     var userRole = req.body; 
     console.log('Adding userRole: ' + JSON.stringify(userRole)); 
     db.collection('userRole', function(err, collection) { 
         collection.insert(userRole, {safe:true}, function(err, result) { 
             if (err) { 
                 res.send({'error':'An error has occurred'}); 
             } else { 
                 console.log('Success: ' + JSON.stringify(result[0])); 
                 res.send(result[0]); 
             } 
         }); 
    }); 
 } 
 
exports.updateuserRole = function(req, res) { 
     var id = req.params.id; 
     var userRole = req.body; 
     console.log('Updating userRole: ' + id); 
     console.log(JSON.stringify(userRole)); 
     db.collection('userRole', function(err, collection) { 
         collection.update({'_id':new BSON.ObjectId(id)}, userRole, {safe:true}, function(err, result) { 
             if (err) { 
                 console.log('Error updating userRole: ' + err); 
                 res.send({'error':'An error has occurred'}); 
             } else { 
                 console.log('' + result + ' document(s) updated'); 
                 res.send(userRole); 
             } 
         }); 
     }); 
 } 
 
 exports.deleteuserRole = function(req, res) { 
     var id = req.params.id; 
     console.log('Deleting userRole: ' + id); 
     db.collection('userRole', function(err, collection) { 
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
 
     var userRole = [ 
     { 
	"User_ID" : 11,
	"User_Name" : "Michael S.",
	"User_Type" : "Viewer",
	"Created_by" : "Jill Wagner",
	"Created_On" : "10/10/15",
	"Last_updated_on" : "10/11/15"
     }, 
     { 
	"User_ID" : 12,
	"User_Name" : "Timothy Smith.",
	"User_Type" : "Viewer",
	"Created_by" : "Jill Wagner",
	"Created_On" : "10/10/15",
	"Last_updated_on" : "10/11/15"
     }]; 
 
     db.collection('userRole', function(err, collection) { 
         collection.insert(userRole, {safe:true}, function(err, result) {}); 
     }); 
 
 }; 

