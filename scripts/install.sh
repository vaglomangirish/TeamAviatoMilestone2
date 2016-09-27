cd '/home/ec2-user/Gateway'

#echo "Installing the dependencies from package.json"


#echo "starting the application run weather forecast"



nodemon app.js >> debug.log 2>&1 &
