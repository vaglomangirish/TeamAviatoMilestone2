echo 'starting installation process' >> /var/log/sga-teamaviato-ForecastTrigger-test-install.log
#cd '/home/ec2-user/forecasttrigger'

rm -r /home/ec2-user/forecastTrigger-test
mv /home/ec2-user/ForecastTrigger-test  /home/ec2-user/forecastTrigger-test
cd /home/ec2-user/forecastTrigger-test/
chmod 777 forecasttrigger
cd forecasttrigger

setup bridge network
docker network ls | grep 'mynet123'
if [ $? ne 0 ]; then
  docker network create --subnet=172.18.0.0/16 mynet123
fi

docker build -t ftrigger_img_test .
#docker run -d -p 32000:32000 --name api-ftrigger ftrigger_img >> sga-teamaviato-ForecastTrigger-docker-server.log 2>&1 &
docker run -d --net mynet123 --ip 172.18.0.43 -p 42000:42000 --name api-ftrigger-test ftrigger_img_test >> sga-teamaviato-ForecastTrigger-docker-test-server.log 2>&1 &
