#!/bin/bash

# if not root, run as root
if (( $EUID != 0 )); then
    sudo reset.sh
    exit
fi

## Stop Services
/etc/init.d/cron stop
service apache2 stop

## Update files
git clone https://github.com/6r1zzlyB/NetKotH.git /opt/NetKotH
chown root /opt/NetKotH
chgrp root /opt/NetKotH
chmod 755 /opt/NetKotH
chmod +x /opt/NetKotH/*.sh
chmod +x /opt/NetKotH/*.py
cp /opt/NetKotH/Files/how_to_play.html /var/www/html/how_to_play.html
cp /opt/NetKotH/Files/resources.html /var/www/html/resources.html
cp /opt/NetKotH/Files/style.css /var/www/html/style.css
cp /opt/NetKotH/Files/netkoth.py /etc/netkoth.py
cp /opt/NetKotH/Files/netkothconfig.ini /etc/netkothconfig.ini
cp /opt/NetKotH/Files/template.htm /etc/template.htm

## Remove any current Scores
rm /var/log/netkothscores.txt

## Edit the config files for the targets
nano /etc/netkothconfig.ini
nano /etc/template.htm

## Reboot the server
reboot now
