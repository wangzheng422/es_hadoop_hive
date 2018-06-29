#!/usr/bin/env bash

set -e
set -x

docker build -f ./base.Dockerfile -t es:base ./

docker save es:base | gzip -c > tmp/es.base.tgz

docker pull docker.elastic.co/kibana/kibana-oss:6.2.3
docker tag docker.elastic.co/kibana/kibana-oss:6.2.3 kibana


docker pull elastichq/elasticsearch-hq 
docker tag elastichq/elasticsearch-hq  elasticsearch-hq

docker save kibana | gzip -c > tmp/kibana.tgz
docker save elasticsearch-hq | gzip -c > tmp/hq.tgz