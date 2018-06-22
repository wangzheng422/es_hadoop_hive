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
export NODE_IPS=10.11.0.7,10.11.0.8,10.11.0.9,10.11.0.10
export NAME_NODE_ADDR=10.11.0.7

# export ONE_BOX=11.11.174.85
# export REGION=datelake
# export SPACE_NAME=global
# export REGISTRY=11.11.157.144:5000
# export ALB_IP=11.11.157.144
# export GIT_HOST=10.11.0.5:9988
# export NGINX=haproxy-11-11-157-144
# export AUTH_TOKEN=97898f42b8c95098df3f82037f43bf13fa33ff53