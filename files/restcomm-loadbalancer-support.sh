#!/bin/bash

BASEDIR=/opt/Restcomm-JBoss-AS7

if [ -n "$SIP_BALANCER" ]; then
  echo "SIP_BALANCER ${SIP_BALANCER}"
  mv $BASEDIR/bin/restcomm/autoconfig.d/config-load-balancer.sh $BASEDIR/bin/restcomm/autoconfig.d/config-load-balancer.sh_orign
  mv $BASEDIR/ext/config-load-balancer-support.sh $BASEDIR/bin/restcomm/autoconfig.d/config-load-balancer-support.sh
fi