sudo PYTHONPATH=/opt/graphite/webapp django-admin.py migrate --settings=graphite.settings

sudo cp files/local_settings.py /opt/graphite/webapp/graphite/

pushd /opt/graphite/conf

	sudo cp aggregation-rules.conf.example aggregation-rules.conf
	sudo cp blacklist.conf.example blacklist.conf
	sudo cp carbon.conf.example carbon.conf
	sudo cp carbon.amqp.conf.example carbon.amqp.conf
	sudo cp relay-rules.conf.example relay-rules.conf
	sudo cp rewrite-rules.conf.example rewrite-rules.conf
	sudo cp storage-schemas.conf.example storage-schemas.conf
	sudo cp storage-aggregation.conf.example storage-aggregation.conf
	sudo cp whitelist.conf.example whitelist.conf

popd

pushd /opt/graphite/bin
	
	sudo ./carbon-cache.py start
popd
#test above
ps -efla | grep carbon-cache
sudo netstat -nap | grep 2003

# create database files
sudo apt install nc -y
echo "carbon.agents.graphite-tutorial.metricsReceived 28198 `date +%s`" | nc localhost 2003
echo "carbon.agents.graphite-tutorial.creates 8 `date +%s`" | nc localhost 2003
echo "PRODUCTION.host.graphite-tutorial.responseTime.p95 0.10 `date +%s`" | nc localhost 2003
#test
/usr/local/bin/whisper-info.py /opt/graphite/storage/whisper/PRODUCTION/host/graphite-tutorial/responseTime/p95.wsp 
