echo 'starting installation process' >> /var/log/sga-teamaviato-StormDetector-install.log
#cd '/home/ec2-user/stormdetection'

rm -r /home/ec2-user/stormDetector-test
mv /home/ec2-user/StormDetector-test  /home/ec2-user/stormDetector-test
cd /home/ec2-user/stormDetector-test/
chmod 777 stormdetection
cd stormdetection

setup bridge network
docker network ls | grep 'mynet123'
if [ $? ne 0 ]; then
  docker network create --subnet=172.18.0.0/16 mynet123
fi

docker build -t sdetect_img_test .
docker run -d --net mynet123 --ip 172.18.0.41 -p 9000:9000 --name api-sdetect-test sdetect_img_test >> sga-teamaviato-StormDetector-test-docker-server.log 2>&1 &


