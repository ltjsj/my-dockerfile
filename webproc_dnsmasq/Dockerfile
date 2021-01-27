FROM centos:7
LABEL maintainer="83975256@qq.com"
# webproc release settings
ENV WEBPROC_VERSION 0.4.0
ENV LANG C.UTF-8
# fetch dnsmasq and webproc binary
#configure dnsmasq
RUN yum -y install dnsmasq
RUN yum -y install bind-utils
RUN mkdir -p /etc/default/
RUN echo -e "ENABLED=1\nIGNORE_RESOLVCONF=yes" > /etc/default/dnsmasq
COPY dnsmasq.conf /etc/dnsmasq.conf
#https://github.com/jpillora/webproc, need complie
COPY webproc  /usr/local/bin/webproc
RUN chmod +x /usr/local/bin/webproc
#run!
ENTRYPOINT ["webproc","--configuration-file","/etc/dnsmasq.conf","--","dnsmasq","--no-daemon"]