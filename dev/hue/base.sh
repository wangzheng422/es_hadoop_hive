#!/usr/bin/env bash

set -e
set -x

docker pull gethue/hue:latest

docker save es:base | gzip -c > tmp/hue.tgz


