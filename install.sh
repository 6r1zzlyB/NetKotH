#!/bin/bash

# if not root, run as root
if (( $EUID != 0 )); then
  sudo install.sh
  exit
fi

# Install Prereqs
apt-get install -y python zip git curl open-vm-tools apt-transport-https

# Install LAMP stack
apt-get install -y apache2 apache2-utils
sudo chown www-data:www-data /var/www/html/ -R
apt-get install -y mariadb-server mariadb-client
mysql_secure_installation
apt-get install -y php libapache2-mod-php php-mysql php-common php-cli php-json php-opcache php-readline php-fpm php-gd php-xml php-cgi php-apcu php-zip
a2enmod php7.0
systemctl restart apache2

# Install Ajenti web admin panel
wget http://repo.ajenti.org/debian/key -O- | apt-key add -
echo "deb http://repo.ajenti.org/debian main main debian" >> /etc/apt/sources.list.d/ajenti.list
apt-get update
apt-get install -y ajenti
sed -i 's/("Access-Control-Max-Age", 3600)/("Access-Control-Max-Age", "3600")/g' /usr/share/pyshared/socketio/transports.py
sed -i 's/("Access-Control-Max-Age", 3600)/("Access-Control-Max-Age", "3600")/g' /usr/share/pyshared/socketio/handler.py
systemctl restart apache2

# Create netkoth folder in opt folder
mkdir /opt/NetKotH

# Clone GitHub
git clone https://github.com/6r1zzlyB/NetKotH.git /opt/NetKotH

# Change the permissions of the netkoth directory
chown root /opt/NetKotH
chgrp root /opt/NetKotH
chmod 755 /opt/NetKotH
chmod +x /opt/NetKotH/*.sh
chmod +x /opt/NetKotH/*.py

# Creat cgi-bin symbolic link
ln -s  /usr/lib/cgi-bin/ /var/www/html/cgi-bin

# Copy NetKotH files
cp /opt/NetKotH/Files/template.htm /var/www/html/index.html
cp /opt/NetKotH/Files/how_to_play.html /var/www/html/how_to_play.html
cp /opt/NetKotH/Files/resources.html /var/www/html/resources.html
cp /opt/NetKotH/Files/style.css /var/www/html/style.css
cp /opt/NetKotH/Files/netkoth.png /var/www/html/netkoth.png
cp /opt/NetKotH/Files/smily.png /var/www/html/smily.png
cp /opt/NetKotH/Files/netkoth.py /etc/netkoth.py
cp /opt/NetKotH/Files/netkothconfig.ini /etc/netkothconfig.ini
cp /opt/NetKotH/Files/template.htm /etc/template.htm
cp /opt/NetKotH/Files/netkothscores.txt /var/log/netkothscores.txt

# Set netkoth.py to start at boot
( crontab -l ; echo "@reboot /etc/netkoth.py &" ) | crontab -

reboot now
