#!/bin/bash
wget https://www.adminer.org/latest.php
sudo mv latest.php /var/www/html/sql.php
sudo chown apache:root /var/www/html/sql.php
