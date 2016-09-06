#!/bin/bash

while [ true ]; do
 address=$(ip route get 1 | awk '{print $NF;exit}')
 name=$(hostname | cut -d"." -f1)
 echo ${name}
 curl http://${ETCD_SERVICE}:2379/v2/keys/services/cachet/upstream/${name} -d value="${address}" -d ttl=60 -X PUT
 sleep 30
done
