# copy files from Gateway to a new folder
mkdir '/home/ec2-user/gateway-microservice'
cp -r '/home/ec2-user/Gateway/*' '/home/ec2-user/gateway-microservice'

#cd '/home/ec2-user/Gateway'

#echo "Installing the dependencies from package.json"


#echo "starting the application run weather forecast"


cd '/home/ec2-user/gateway-microservice/Gateway_Aviato'
nodemon app.js >> debug.log 2>&1 &
