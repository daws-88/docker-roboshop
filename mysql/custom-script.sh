#!/bin/bash
if [ -f /tmp/mysql-root-pass.txt ]; then
   PASSWORD=$(cat tmp/mysql-root-pass.txt) ## init-container put password 
   echo "MYSQL root password is accesed"
else 
   echo "MYSQL root password is not accesed"
   exit 1
fi

export MYSQL_ROOT_PASSWORD=$PASSWORD
rm -rf /tmp/mysql-root-pass.txt

## run actual script
exec /entrypoint.sh mysqld
