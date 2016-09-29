# copy artifacts to new dir
mkdir '/home/ec2-user/ingestor-microservice'
cp -r /home/ec2-user/api-ingestor/* /home/ec2-user/ingestor-microservice

# delete revision
rm -rf '/home/ec2-user/api-ingestor'

echo 'Installing the Data Ingestor API...'
cd '/home/ec2-user/ingestor-microservice/api-ingestor'

mvn clean install >> /var/log/tomcat.log
mkdir /usr/local/tomcat7/apache-tomcat-7.0.72/webapps/dataingestor
cp server.xml /usr/local/tomcat7/apache-tomcat-7.0.72/conf/server.xml
cp target/*.war /usr/local/tomcat7/apache-tomcat-7.0.72/webapps/dataingestor >> /var/log/tomcat.log
cd  /usr/local/tomcat7/apache-tomcat-7.0.72

sudo sh ./bin/startup.sh >> /var/log/tomcat.log 2>&1 &
