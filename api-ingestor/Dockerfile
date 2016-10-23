FROM tomcat:8-jre8

#Add WAR file to docker
ADD target/dataingestor.war /usr/local/tomcat/webapps/

#Exposing port
EXPOSE 8080

#Run TOMCAT
CMD ["catalina.sh", "run"]
