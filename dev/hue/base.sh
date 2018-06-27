#!/usr/bin/env bash

set -e
set -x

docker pull gethue/hue:latest

docker save gethue/hue:latest | gzip -c > tmp/hue.base.tgz


