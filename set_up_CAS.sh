#!/bin/bash

getKeyValue () {
  echo `grep $1 $PWD/db.ini | cut -d\= -f2 | sed -e 's/"//g'`
}

PWD=`pwd`
# Verify the Omeka db.ini file exists
if [ -f "$PWD/db.ini" ] 
then

  # Get the database connection info from the db.ini file
  MHOST=$(getKeyValue "host")
  MUSER=$(getKeyValue "username")
  MPASS=$(getKeyValue "password")
  MDB=$(getKeyValue "dbname")
  #echo "$MHOST,$MUSER,$MPASS,$MDB"
  
  # change into the plugins directory and check out the plugin code
  cd plugins
  git clone https://github.com/BGSU-LITS/omeka-plugin-CentralAuth.git CentralAuth
  
  # change into the CentralAuth plugin directory, fix version number and build
  cd CentralAuth
  sed -i 's/~0.8/dev-master#15c5b0f7dcaec5bf206b445d80f71192684b26ee/' composer.json
  composer install
  composer update
  
  # insert the necessary plugin values to activate CAS
  mysql -u $MUSER --password=$MPASS -h $MHOST $MDB < /home/whitmanarchives/scripts/casInstallConfig/set_up_CAS.sql
  echo ""
  echo "Setup complete!"

else
  echo "ERROR: Not in root directory of an Omeka site. Currently in:"
  echo "  $PWD"
  echo ""
  echo "Must be in root directory of Omeka site. Example:"
  echo "  /home/whitmanarchives/whitmanarchives.org/sandbox2" 
fi

