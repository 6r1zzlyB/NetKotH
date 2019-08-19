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

# Install BlaB! chatroom server
mysql -uroot -e "create database db_blab"
mysql -uroot -e "create user user_blab"
mysql -uroot -e "GRANT ALL PRIVILEGES ON db_blab.* TO 'user_blab'@'localhost';"
wget -O /tmp/blab.zip https://justblab.com/downloads/blab94.zip
unzip /tmp/blab.zip -d /var/www/html
mv /var/www/html/blab* /var/www/html/blab
rm -rf /tmp/blab.zip
chmod 666 /var/www/html/blab/config.php
chmod 666 /var/www/html/blab/errors.txt
chmod 777 /var/www/html/blab/paintings
IP_Address=$(hostname -I)
read -p "The Server is about to reboot. Press enter to continue"
read -p "After it reboots, navigate to $IP_Address:8000"
read -p "Log in with the default username/password (root/admin)"
read -p "Reset password for root account"
read -p "Navigate to $IP_Address/blab/"
read -p "Follow the install instructions. Use the database "db_blab" & account "user_blab""
read -p "Run the command "rm -r /var/www/html/blab/install""
read -p "Navigate to $IP_Address/blab/admin.php"
read -p "Use the ACP Key you just created to log in"
read -p "Change the time settings, how log the history is saved, style, & disable guest accounts"
read -p "Copy and paste the testin /opt/NetKotH/Files/button.html into the Logo/Banner field, on the 'Style' tab"
reboot now
