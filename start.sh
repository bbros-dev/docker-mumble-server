#!/bin/bash

echo Starting mumble-server service
sed -i 's/^INIFILE=.*/INIFILE=\/etc\/mumble-server.ini/' /etc/init.d/mumble-server
service mumble-server start

while true
do
  sleep 3600
done
