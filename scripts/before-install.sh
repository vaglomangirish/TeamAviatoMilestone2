echo 'killing existing tomcat process if any'
cd /usr/local/tomcat7/apache-tomcat-7.0.72
sudo sh ./bin/shutdown.sh
sleep 20
export JAVA_HOME=/usr/lib/jvm/jre-1.7.0-openjdk.x86_64
echo 'check if maven is installed'
mvn --version
if [ "$?" -ne 0 ]; then
    echo 'Installing Maven...'
	sudo wget http://repos.fedorapeople.org/repos/dchen/apache-maven/epel-apache-maven.repo -O /etc/yum.repos.d/epel-apache-maven.repo
	sudo sed -i s/\$releasever/6/g /etc/yum.repos.d/epel-apache-maven.repo
	sudo yum install -y apache-maven
	mvn --version
fi

#Check if MySQL is already installed
rpm -qa | grep mysql

#Install MySQL
sudo yum install mysql mysql-server

#Change directory to that of MySQL
cd /etc/rc.d/init.d/
sudo service mysqld status
sudo service mysqld start
mysql -u root -p
echo "root"

#Drop existing database
echo "DROP DATABASE IF EXISTS registry;"

#Create database
echo "CREATE DATABASE IF NOT EXISTS registry;"

#Use database
echo "use registry;"

#Create table
echo "CREATE TABLE logservice
(
timestamp VARCHAR(45) NOT NULL,
requestid TINYTEXT NOT NULL,
username VARCHAR(45) NOT NULL,
servicename VARCHAR(45) NOT NULL,
description MEDIUMTEXT NOT NULL,
PRIMARY KEY (timestamp)
);"

#Exit from database
echo "exit;"

