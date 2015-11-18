#*****************************************************#
#Created:11/01/2015                                   #
#Author:  Sudheer Kondla, sudheer.kondla@gmail.com    #
#*****************************************************#
#!/bin/bash
mongoexport --db eoCache --collection entitlementClass --out entitlementClass.json
mongoexport --db eoCache --collection entitlementOps --out entitlementOps.json
mongoexport --db eoCache --collection entitlementObject --out entitlementObject.json
