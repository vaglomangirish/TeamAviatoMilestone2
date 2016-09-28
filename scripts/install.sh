echo 'Installing the Data Ingestor API...'
cd '/home/ec2-user/dataIngestor'
mvn -e clean install >> /var/log/tomcat.log
mv target/*.war /usr/local/tomcat7/apache-tomcat-7.0.72/webapps/
sudo mvn -e clean install >> /var/log/api-ingestor.log
cp target/*.war /usr/local/tomcat7/apache-tomcat-7.0.72/webapps/ >> /var/log/tomcat.log
cd  /usr/local/tomcat7/apache-tomcat-7.0.72
sudo sh ./bin/startup.sh >> /var/log/tomcat.log 2>&1 &
