#!/bin/bash
find eb/ -type f -exec sed -i -e 's/skondla@cisco.com/sudheer.kondla@gmail.com/g' {} \;
#find ./ -type f -exec sed -i -e 's/sudheer.kondla@gmail.com/skondla@cisco.com/g' {} \;
#find . -name "*.*" | xargs grep "sudheer.kondla@gmail.com"
find eb/ -name "*.*" | xargs grep "skondla@cisco.com"
