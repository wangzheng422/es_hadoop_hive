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



