echo "killing any pre existing processes at port"

fuser -k 3000/tcp

sleep 10

echo "checking if node is installed"

node -v
if [ "$?" -ne 0 ]; then
    echo "installing node.js --version 4.x"
        curl --silent --location https://rpm.nodesource.com/setup_4.x | bash -
        yum -y install nodejs
        yum -y install gcc-c++ make
        npm install npm -g
        node -v
fi
rm -rf /home/ec2-user/Gateway

mongo --version
if [ "$?" -ne 0 ]; then
    echo "Installing MongoDB"
    cp mongodb-org-3.0.repo /etc/yum.repos.d
    yum install -y mongodb-org
    mkdir /var/lib/mongodb
    mkdir /var/lib/mongodb/data
    mkdir /var/lib/mongodb/data/db
    mongod --dbpath /var/lib/mongodb/data/db --smallfiles > /dev/null 2>&1
fi
