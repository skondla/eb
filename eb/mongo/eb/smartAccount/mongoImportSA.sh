#*****************************************************#
#Created:10/30/2015                                   #
#Author:  Sudheer Kondla, sudheer.kondla@gmail.com           #
#*****************************************************#
#!/bin/bash
mongoimport --db smartAccount2 --collection smartAccount --type json --file smartAccount.json
mongoimport --db smartAccount2 --collection virtualAccount --type json --file virtualAccount.json
mongoimport --db smartAccount2 --collection roles --type json --file roles.json
mongoimport --db smartAccount2 --collection users --type json --file users.json
mongoimport --db smartAccount2 --collection userRole --type json --file userRole.json
mongoimport --db smartAccount2 --collection resourceMaster --type json --file resourceMaster.json
mongoimport --db smartAccount2 --collection roleResource --type json --file roleResource.json
