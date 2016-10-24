echo 'killing existing process on port 9050 if any'
sudo kill -9 $(sudo lsof -i :9050 | grep LISTEN) >> /var/log/processkill-test.log 2>&1 &

echo 'Removing existing docker instances' >> /var/log/runforecast-docker-test.log 2>&1
docker ps -a | grep 'runforecast_img_test' | awk '{print $1}' | xargs --no-run-if-empty docker stop
docker ps -a | grep 'runforecast_img_test' | awk '{print $1}' | xargs --no-run-if-empty docker rm