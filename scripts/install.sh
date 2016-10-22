# copy files from Gateway to a new folder
mkdir '/home/ec2-user/gateway-microservice'
cp -r /home/ec2-user/Gateway/* /home/ec2-user/gateway-microservice

# delete the revision directory
rm -rf '/home/ec2-user/Gateway'

#cd '/home/ec2-user/Gateway'

#echo "Installing the dependencies from package.json"


#echo "starting the application run weather forecast"


cd '/home/ec2-user/gateway-microservice/Gateway_Aviato'

docker build -t gateway . >> /var/log/dockerggateway.log 2>&1 &
docker rmi $(docker images | grep "^<none>" | awk "{print $3}") >> /var/log/dockergatewayimage.log 2>&1 &
docker run -d -p 3000:3000 --name api-g gateway >> /var/log/gateway.log 2>&1 &

#echo "Fixing node-sass"

#npm uninstall --save node-sass
#npm install --save node-sass

#chmod -R 777 public

#node app.js >> debug.log 2>&1 &
