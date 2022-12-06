#!/bin/sh
docker network create --driver bridge influxdb-net
mkdir /home/vagrant/influx-data && cd /home/vagrant/influx-data influx-data

docker run \
	--name influxdb \
	-p 8086:8086 \
	--volume $PWD:/var/lib/influxdb2 \
	--net=influxdb-net \
	-d \
	influxdb:2.1.1