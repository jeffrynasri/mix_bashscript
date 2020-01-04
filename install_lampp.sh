#source : https://www.digitalocean.com/community/tutorials/how-to-install-linux-apache-mysql-php-lamp-stack-ubuntu-18-04
#Login In Root First

#Step 1 Install Apache
apt update
apt install apache2
ufw allow in "Apache Full"

#step 2 Install Mysql with default user root/password
apt install mysql-server
mysql -e "SELECT user,authentication_string,plugin,host FROM mysql.user;ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'password';FLUSH PRIVILEGES;SELECT user,authentication_string,plugin,host FROM mysql.user;"


#Step 3 Install PHP
apt install php libapache2-mod-php php-mysql
chmod -R 755 /var/www/html