echo 'Installing the Data Ingestor API...'
cd '/home/ec2-user/api-ingestor/api-ingestor'
mvn clean install >> /var/log/tomcat.log
cp target/*.war /usr/local/tomcat7/apache-tomcat-7.0.72/webapps/ >> /var/log/tomcat.log
cd  /usr/local/tomcat7/apache-tomcat-7.0.72
sudo sh ./bin/startup.sh >> /var/log/tomcat.log 2>&1 &