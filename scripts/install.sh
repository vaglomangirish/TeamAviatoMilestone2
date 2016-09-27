cd '/home/ec2-user/Gateway'

#echo "Installing the dependencies from package.json"


#echo "starting the application run weather forecast"

rm -rf /home/ec2-user/Gateway/Gateway_Aviato/node_modules/*

nodemon app.js >> debug.log 2>&1 &
