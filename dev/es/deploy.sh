#!/usr/bin/env bash

set -e
set -x

source config.sh


cat k8s.yml | \
sed "s/{{ALB_IP}}/${ALB_IP}/g" | \
sed "s/{{GIT_HOST}}/${GIT_HOST}/g" | \
sed "s/{{REGISTRY}}/${REGISTRY}/g" | \
sed "s/{{REGION}}/${REGION}/g" | \
sed "s/{{NGINX}}/${NGINX}/g"  \
> k8s-tmp.yml

echo "use k8s-tmp.yaml to deploy the app"

docker build -t ${REGISTRY}/es ./

docker push ${REGISTRY}/es

docker pull docker.elastic.co/kibana/kibana-oss:6.2.3
docker tag docker.elastic.co/kibana/kibana-oss:6.2.3 ${REGISTRY}/kibana
docker push ${REGISTRY}/kibana

docker pull elastichq/elasticsearch-hq 
docker tag elastichq/elasticsearch-hq  ${REGISTRY}/elasticsearch-hq
docker push ${REGISTRY}/elasticsearch-hq

docker save ${REGISTRY}/es | gzip -c > tmp/es.tgz
docker save ${REGISTRY}/kibana | gzip -c > tmp/kibana.tgz
docker save elastichq/elasticsearch-hq | gzip -c > tmp/hq.tgz

