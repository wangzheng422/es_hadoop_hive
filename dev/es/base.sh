#!/usr/bin/env bash

set -e
set -x

docker build -f ./base.Dockerfile -t /es:base ./

docker save es:base | gzip -c > tmp/es.base.tgz


