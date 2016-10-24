echo 'starting installation process' >> /var/log/sga-teamaviato-RunForecast-install.log
#cd '/home/ec2-user/runforecast'

rm -r /home/ec2-user/runForecast-test
mv /home/ec2-user/RunForecast-test  /home/ec2-user/runForecast-test
cd /home/ec2-user/runForecast-test/
chmod 777 runforecast
cd runforecast

setup bridge network
docker network ls | grep 'mynet123'
if [ $? ne 0 ]; then
  docker network create --subnet=172.18.0.0/16 mynet123
fi

docker build -t runforecast_img_test .
docker run -d --net mynet123 --ip 172.18.0.44 -p 9050:9050 --name api-runforecast-test runforecast_img_test >> sga-teamaviato-RUnForecast-docker-test-server.log 2>&1 &
