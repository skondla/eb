#*****************************************************#
#Created:10/30/2015                                   #
#Author:  Sudheer Kondla, sudheer.kondla@gmail.com           #
#*****************************************************#
#!/bin/bash
mongoexport --db smartAccount2 --collection smartAccount --out smartAccount.json
mongoexport --db smartAccount2 --collection virtualAccount --out virtualAccount.json
mongoexport --db smartAccount2 --collection roles --out roles.json
mongoexport --db smartAccount2 --collection users --out users.json
mongoexport --db smartAccount2 --collection userRole --out userRole.json
mongoexport --db smartAccount2 --collection resourceMaster --out resourceMaster.json
mongoexport --db smartAccount2 --collection roleResource --out roleResource.json
