FROM gethue/hue:latest

COPY tmp/pseudo-distributed.ini /hue/desktop/conf/pseudo-distributed.ini
COPY tmp/hive-site.xml /etc/hive/conf/