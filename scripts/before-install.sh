echo 'killing existing process on port 8000 if any'
sudo kill -9 $(sudo lsof -i :9000 | grep LISTEN) >> /var/log/processkill-test.log 2>&1 &

echo 'Removing existing docker instances' >> /var/log/sdetector-test-docker.log 2>&1
docker ps -a | grep 'sdetect_img_test' | awk '{print $1}' | xargs --no-run-if-empty docker stop
docker ps -a | grep 'sdetect_img_test' | awk '{print $1}' | xargs --no-run-if-empty docker rm