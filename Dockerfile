from restcomm/restcomm

MAINTAINER Gennadiy Dubina - hamsterksu@gmail.com

ENV WORK_DIR /opt/Restcomm-JBoss-AS7

#copy loadbalancer configurator
RUN mkdir ${WORK_DIR}/ext
ADD ./files/config-load-balancer-support.sh ${WORK_DIR}/ext

ADD ./files/restcomm-loadbalancer-support.sh /etc/my_init.d/restcommloadbalancersupport.sh
RUN chmod +x /etc/my_init.d/restcommloadbalancersupport.sh