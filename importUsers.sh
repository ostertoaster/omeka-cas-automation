#!/bin/bash

# The directory where this script lives
# From: http://stackoverflow.com/a/1482133
SDIR=`dirname $0`

getKeyValue () {
  echo `grep $1 $PWD/db.ini | cut -d\= -f2 | sed -e 's/"//g'`
}

# Check to see if we've actually gotten an file name

if [ -z $1 ] 
then
  echo "No filename passed as arguement to script. Exiting..."
  exit 1
fi 

if [ -z $2 ] 
then
  echo "No user role ("admin" or "researcher") passed as arguement to script. Exiting..."
  exit 1
fi 



# Validate that file in argument $1 exists
if [ ! -f "$1" ] 
then
  echo "File $1 specified does not exist. Exiting..."
  exit 1
fi

### TODO - validate the argument passed (researcher, admin) is correct

# Validate that file provided has no more than max number of fields
MAXFIELDS="2"
OUTOFBOUNDS=$((MAXFIELDS+1))
EXTRACOMMASCHECK=`cut -d, -f$OUTOFBOUNDS $1 | sort | uniq`

if [ "$EXTRACOMMASCHECK" != "" ]
then
  echo ""
  echo "$EXTRACOMMASCHECK"
  echo "More fields in file than maximum of $MAXFIELDS!"
  echo "  Please ensure that your file is comma separated"
  echo "  and contains $MAXFIELDS fields per record."
  echo "  Exiting..."
  exit 1
fi

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
  
  #### TODO - Parse the file and create a temporary SQL file 
  # insert the necessary plugin values to activate CAS
  #mysql -u $MUSER --password=$MPASS -h $MHOST $MDB < $SDIR/set_up_CAS.sql
  echo ""
  echo "Done."
  ### TODO - Remove the temporary SQL file
else
  echo "ERROR: Not in root directory of an Omeka site. Currently in:"
  echo "  $PWD"
  echo ""
  echo "Must be in root directory of Omeka site. Example:"
  echo "  /home/whitmanarchives/whitmanarchives.org/sandbox2" 
fi

