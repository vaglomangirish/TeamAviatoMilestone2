cd '/home/ec2-user/Gateway'

echo "Installing the dependencies from package.json"

npm install

#echo "starting the application run weather forecast"

PORT=3000 npm start >> debug.log 2>&1 &
