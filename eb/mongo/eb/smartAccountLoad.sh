#*****************************************************#
#Name: smartAccountLoad.sh                            #
#Created:10/30/2015                                   #
#Author:  Sudheer Kondla, sudheer.kondla@gmail.com           #
#*****************************************************#
#!/bin/bash
cd ~/mongoLab/data/load/bulkLoad
CURRDIR=`pwd`
#files=`ls -ltr *.js | awk '{print $9}'`

#echo "Files:
#$files"

for files in `ls -ltr *.js | awk '{print $9}'` 
do
/apps/mongodb3/bin/mongo smartAccount $files
echo "Loading $files completed"
done
