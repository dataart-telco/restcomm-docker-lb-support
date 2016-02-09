#!/bin/bash

WORKSPACE=~/docker_volumes/restcomm_workspace
RESTCOMM_DIR=/opt/Restcomm-JBoss-AS7

docker rm -f restcomm-lb

docker run \
-e VOICERSS_KEY="29b2d893df9f454abbfae94df6cff95b" \
-e STATIC_ADDRESS="10.0.0.102" \
-e SIP_BALANCER="10.0.0.102:5065" \
--name=restcomm-lb \
-d \
-p 8080:8080 \
-p 5080:5080 \
-p 5081:5081 \
-p 5082:5082 \
-p 5083:5083 \
-p 5080:5080/udp \
-p 65000-65535:65000-65535/udp \
-p 4447:4447 \
-p 9999:9999 \
-p 9990:9990 \
-p 2427:2427/udp \
-p 2727:2727/udp \
-v $WORKSPACE/restcomm/log:${RESTCOMM_DIR}/standalone/log -v $WORKSPACE/restcomm/recordings:${RESTCOMM_DIR}/standalone/deployments/restcomm.war/recordings -v $WORKSPACE/restcomm/cache:${RESTCOMM_DIR}/standalone/deployments/restcomm.war/cache -v $WORKSPACE/restcomm/data:${RESTCOMM_DIR}/standalone/deployments/restcomm.war/WEB-INF/data/hsql -v $WORKSPACE/mms/log:${RESTCOMM_DIR}/mediaserver/log -v $WORKSPACE/rvd/workspace:${RESTCOMM_DIR}/standalone/deployments/restcomm-rvd.war/workspace restcomm-lb:latest
