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

# export ONE_BOX=11.11.174.85
# export REGION=datelake
# export SPACE_NAME=global
# export REGISTRY=11.11.157.144:5000
# export ALB_IP=11.11.157.144
# export GIT_HOST=10.11.0.5:9988
# export NGINX=haproxy-11-11-157-144
# export AUTH_TOKEN=97898f42b8c95098df3f82037f43bf13fa33ff53