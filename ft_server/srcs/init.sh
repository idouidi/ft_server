#!/bin/bash

#booting
sh ./ssl.sh
service nginx restart
service php7.3-fpm start
service mysql restart
mysql -u root < db
bash