echo 'killing existing flask process if any'
sudo kill -9 $(sudo lsof -i :8000 | grep LISTEN) >> processkill.log 2>&1 &