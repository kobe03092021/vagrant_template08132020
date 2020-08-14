# Install Apache, Git, Unzip
sudo yum -y install httpd zip unzip git vim

# Install PHP with Epel, Remi repository
sudo yum -y install epel-release
sudo yum -y install http://rpms.famillecollet.com/enterprise/remi-release-7.rpm
sudo yum update
sudo yum -y install --enablerepo=remi,remi-php73 php php-devel php-mbstring php-pdo php-gd php-xml php-mcrypt

# Install MySQL
sudo yum -y install http://dev.mysql.com/get/mysql-community-release-el7-5.noarch.rpm
sudo yum -y install mysql-community-server

# Download Composer, Change its directory to the below bin
curl -sS https://getcomposer.org/installer | php
mv composer.phar /usr/local/bin/composer

# Set Apache working with Vagrant on start
sudo systemctl enable httpd.service
sudo systemctl start httpd.service

# Set Vagrant shared folder and Path
sudo rm -rf /var/www/html
sudo ln -fs vagrant/ /var/www/html

# Set MySQL working with Vagrant on start
sudo systemctl enable mysqld.service
sudo systemctl start mysqld.service

# SELinux OFF
cp -p /etc/selinux/config /etc/selinux/config.default
sed -i 's/enforcing/disabled/g' /etc/selinux/config

# Stop FIrewall
sudo systemctl stop firewalld
sudo systemctl disable firewalld

# Change Timezone to Japan Time
cp /etc/php.ini /etc/php.ini.default
sed -i -e "s/date\.timezone =/date\.timezone = Asia\/Tokyo/g" /etc/php.ini

###############################################################
# firewalld
###############################################################
#sudo systemctl start firewalld.service
#sudo systemctl enable firewalld.service
#sudo firewall-cmd --zone=public --add-port=80/tcp --permanent
#sudo firewall-cmd --zone=public --add-port=443/tcp --permanent
#sudo firewall-cmd --reload
