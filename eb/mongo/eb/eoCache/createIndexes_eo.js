//Author:  Sudheer Kondla, sudheer.kondla@gmail.com , Created:10/30/2015
db.entitlementClass.createIndex({Entitlement_class_ID:1, unique:true})
db.entitlementObject.createIndex({Entitlement_Object_ID:1,unique:true})
db.entitlementObject.createIndex({Entitlement_Class_ID:1})
db.entitlementObject.createIndex({Virtual_Account_ID:1})
db.entitlementOps.createIndex({Entitlement_Ops_ID:1, unique:true})
db.entitlementOps.createIndex({Entitlement_Class_ID:1})

