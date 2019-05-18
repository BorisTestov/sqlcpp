#!/bin/bash
COLOR='\033[1;36m'
NC='\033[0m'
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
echo -e "${COLOR}This script will install LAMP${NC}"
echo -e "${COLOR}Installing Apache2${NC}"
sudo apt update
sudo apt-get install apache2 apache2-bin -y
sudo ufw allow in "Apache Full"
sudo service apache2 restart
echo -e "${COLOR}Installing MySQL${NC}"
sudo apt install mysql-server
sudo mysql_secure_installation
echo -e "${COLOR}Installing PHP${NC}"
sudo apt install php libapache2-mod-php php-mysql
sudo apt install sudo apt-get install php-{bcmath,bz2,intl,gd,mbstring,mysql,zip,fpm,cli} -y
sudo bash -c 'echo "<IfModule mod_dir.c>" > /etc/apache2/mods-enabled/dir.conf'
sudo bash -c 'echo "    DirectoryIndex index.php index.html index.cgi index.pl index.xhtml index.htm" >> /etc/apache2/mods-enabled/dir.conf'
sudo bash -c 'echo "</IfModule>" >> /etc/apache2/mods-enabled/dir.conf'
sudo a2enmod proxy_fcgi setenvif
sudo a2enconf php7.2-fpm
sudo systemctl restart apache2
sudo bash -c 'echo "<?php" >> /var/www/html/info.php'
sudo bash -c 'echo "phpinfo();" >> /var/www/html/info.php'
sudo bash -c 'echo "?>" >> /var/www/html/info.php'
sudo apt install libmysql++*
echo -e "${COLOR}............${NC}"
echo -e "${COLOR}Done!${NC}"

