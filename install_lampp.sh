#source : https://www.digitalocean.com/community/tutorials/how-to-install-linux-apache-mysql-php-lamp-stack-ubuntu-18-04
# Tested In Ubuntu Server 18.04
#
#PRESEQUITES :
# 1. Login In Root First
# 2. Change {USER_MYSQL} and {PASSWORD_MYSQL}. it will be your mysql account for login
# 3. Change {USER_SERVER} with your accoutn at server

#Step 1 Install Apache
apt update
apt install apache2 -y
ufw allow in "Apache Full"

#step 2 Install Mysql with default user root/password
apt install mysql-server -y
mysql -e "SELECT user,authentication_string,plugin,host FROM mysql.user;CREATE USER '{USER_MYSQL}'@'%' IDENTIFIED WITH mysql_native_password BY '{PASSWORD_MYSQL}';FLUSH PRIVILEGES;"


#Step 3 Install PHP
apt install php libapache2-mod-php php-mysql -y
chmod -R 777 /var/www/html

# STep 4 Add User to Apache Group
usermod -aG www-data {USER_SERVER}

# Step 5 Enable Remote Database
cp /etc/mysql/mysql.conf.d/mysqld.cnf /etc/mysql/mysql.conf.d/mysqld.cnf.bak
sed -i -e 's/127.0.0.1/0.0.0.0/g' /etc/mysql/mysql.conf.d/mysqld.cnf
service mysql restart

# STEP 5 ENABLE HTACCESS
# FOLLOW INSTRUCTION MANUAL IN https://www.digitalocean.com/community/tutorials/how-to-set-up-mod_rewrite-for-apache-on-ubuntu-14-04
