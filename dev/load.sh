#!/usr/bin/env bash

set -e
set -x

zcat es/tmp/es.base.tgz | docker load
zcat es/tmp/hq.tgz | docker load
zcat es/tmp/kibana.tgz | docker load

zcat hadoop/tmp/hadoop.base.tgz | docker load
zcat hadoop/tmp/mysql.5.7.tgz | docker load

zcat hue/tmp/hue.base.tgz | docker load

