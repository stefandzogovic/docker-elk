#!/bin/sh
sed -i -e s/%STASH%/$STASH/g /etc/filebeat/filebeat.yml
sed -i -e s/%APP%/$APP/g /etc/filebeat/filebeat.yml
sed -i -e s/%ENVIR%/$ENVIR/g /etc/filebeat/filebeat.yml
service filebeat start
echo "$*"
/bin/sh -c "$*"