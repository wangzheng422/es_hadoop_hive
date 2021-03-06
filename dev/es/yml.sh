#!/usr/bin/env bash

set -e
set -x

export ONE_BOX=10.11.0.4
export REGION=alauda01
export SPACE_NAME=global
export REGISTRY=10.11.0.6:5000
export ALB_IP=10.11.0.6
export GIT_HOST=10.11.0.5:9988
export NGINX=nginx-10-11-0-6
export AUTH_TOKEN=97898f42b8c95098df3f82037f43bf13fa33ff53
export DIR_ES_DATA="\/alauda_data\/es_data"
export DIR_ES_LOG="\/alauda_data\/es_log"

cat k8s.yml | \
sed "s/{{ALB_IP}}/${ALB_IP}/g" | \
sed "s/{{GIT_HOST}}/${GIT_HOST}/g" | \
sed "s/{{REGISTRY}}/${REGISTRY}/g" | \
sed "s/{{REGION}}/${REGION}/g" | \
sed "s/{{DIR_ES_DATA}}/${DIR_ES_DATA}/g" | \
sed "s/{{DIR_ES_LOG}}/${DIR_ES_LOG}/g" | \
sed "s/{{NGINX}}/${NGINX}/g"  \
> tmp/k8s.yml

echo "use k8s-tmp.yaml to deploy the app"



