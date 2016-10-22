echo 'starting installation process' >> /var/log/sga-teamaviato-RunForecast-install.log
#cd '/home/ec2-user/runforecast'

rm -r /home/ec2-user/runForecast
mv /home/ec2-user/RunForecast  /home/ec2-user/runForecast
cd /home/ec2-user/runForecast/
chmod 777 runforecast
cd runforecast

docker build -t runforecast_img .
docker run -d -p 8050:8050 --name api-runforecast runforecast_img >> sga-teamaviato-RUnForecast-docker-server.log 2>&1 &
