#*****************************************************#
#Name: accessCache.sh                                 #
#Created:10/30/2015                                   #
#Author:  Sudheer Kondla, sudheer.kondla@gmail.com           #
#*****************************************************#
#!/bin/bash
cd ~/mongoLab/data/eb/accessCache
CURRDIR=`pwd`
#files=`ls -ltr *.js | awk '{print $9}'`

#echo "Files:
#$files"

for files in `ls -ltr *.csv | awk '{print $9}'` 
do
/apps/mongodb3/bin/mongoimport -d accessCache -c accessCache --type csv --file $files --headerline
echo "Loading $files completed"
done

#Create Indexes
/apps/mongodb3/bin/mongo accessCache createIndexes_ac.js
