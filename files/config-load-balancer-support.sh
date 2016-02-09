#! /bin/bash

##copy of https://github.com/RestComm/juju-charms/blob/master/mobicents-restcomm-charm/trusty/mobicents-restcomm/lib/mobicents/configuration/config-load-balancer.sh

##
## Description: Support external load balancer
## Author     : Gennadiy Dubina
##

##
## FUNCTIONS
##

configSipStack() {
	FILE="$RESTCOMM_HOME/standalone/configuration/mss-sip-stack.properties"

	echo "Will change mss-sip-stack.properties using $1"

	sed -e 's|^#org.mobicents.ha.javax.sip.BALANCERS=|org.mobicents.ha.javax.sip.BALANCERS=|' $FILE > $FILE.bak
	mv $FILE.bak $FILE
	sed -e "s|org.mobicents.ha.javax.sip.BALANCERS=.*|org.mobicents.ha.javax.sip.BALANCERS=$1|" $FILE > $FILE.bak
	mv $FILE.bak $FILE
	echo "Activated Load Balancer on SIP stack configuration file with $1"

	sed -e 's|^#org.mobicents.ha.javax.sip.REACHABLE_CHECK=|org.mobicents.ha.javax.sip.REACHABLE_CHECK=false|' $FILE > $FILE.bak
	mv $FILE.bak $FILE

	echo 'Removed reachable checks and specified HTTP Port 8080'
}

configStandalone() {
	FILE=$RESTCOMM_HOME/standalone/configuration/standalone-sip.xml

	sed -e "s|path-name=\".*\" \(app-dispatcher-class=.*\)|path-name=\"org.mobicents.ha.balancing.only\" \1|g" $FILE > $FILE.bak
	mv -f $FILE.bak $FILE
	echo "changed the MSS Path Setting to org.mobicents.ha.balancing.only" 
}

##
## MAIN
##
configSipStack ${SIP_BALANCER}
configStandalone
