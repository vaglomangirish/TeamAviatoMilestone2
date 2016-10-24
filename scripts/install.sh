echo 'starting installation process' >> /var/log/sga-teamaviato-StormClustering-install.log
#cd '/home/ec2-user/stormclustering'

rm -r /home/ec2-user/stormClustering-test
mv /home/ec2-user/StormClustering-test  /home/ec2-user/stormClustering-test
cd /home/ec2-user/stormClustering/
chmod 777 stormclustering
cd stormclustering

setup bridge network
docker network ls | grep 'mynet123'
if [ $? ne 0 ]; then
  docker network create --subnet=172.18.0.0/16 mynet123
fi

docker build -t scluster_img_test .
docker run -d --net mynet123 --ip 172.18.0.42 -p 41000:41000 --name api-sclustering-test scluster_img_test >> sga-teamaviato-StormClustering-test-docker-server.log 2>&1 &
