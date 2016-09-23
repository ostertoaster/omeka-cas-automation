# omeka-cas-automation
Scripts used to ease installation and configuration of the Omeka CAS plugin:
https://github.com/BGSU-LITS/omeka-plugin-CentralAuth

## set_up_CAS.sh

This script and its companion, set_up_CAS.sql, get installed in the root of your Omeka site.

Usage:

sh set_up_CAS.sh

That's it! No configuration needed, as it reads the needed database parameters from db.ini

## importUsers.sh

This is not ready for use yet, but the idea is you supply a delimited file to the script, and the users will get set up via SQL inserts.
