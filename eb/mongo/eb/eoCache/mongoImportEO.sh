#*****************************************************#
#Created:11/01/2015                                   #
#Author:  Sudheer Kondla, sudheer.kondla@gmail.com    #
#*****************************************************#
#!/bin/bash
mongoexport --db eoCache --collection entitlementClass --type json --file entitlementClass.json
mongoexport --db eoCache --collection entitlementOps --type json --file entitlementOps.json
mongoexport --db eoCache --collection entitlementObject --type json --file entitlementObject.json
