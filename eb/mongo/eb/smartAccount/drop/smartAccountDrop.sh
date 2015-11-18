#*****************************************************#
#Name: smartAccountDrop.sh                            #
#Created:11/07/2015                                   #
#Author:  Sudheer Kondla, sudheer.kondla@gmail.com           #
#*****************************************************#
#!/bin/bash
cd ~/mongoLab/data/eb/smartAccount/drop
CURRDIR=`pwd`
#files=`ls -ltr *.js | awk '{print $9}'`

#echo "Files:
#$files"

#Drop Smart Account Database
/apps/mongodb3/bin/mongo smartAccount2 drop_sa.js
