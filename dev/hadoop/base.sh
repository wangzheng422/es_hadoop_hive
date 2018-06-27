#!/usr/bin/env bash

set -e
set -x

docker build -f ./base.Dockerfile -t /hadoop:base ./

docker save es:base | gzip -c > tmp/hadoop.base.tgz


