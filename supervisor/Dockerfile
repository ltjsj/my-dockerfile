FROM centos:7
ENV SUPERVISOR_VERSION=4.0.2
RUN yum -y install epel-release

RUN yum install -y \
        gettext \
		gcc \
		git \
		openssl.x86_64 \
		openssl-devel.x86_64 \
        gzip \
        make \
        tar \
        unzip \
        redis \

RUN yum -y install python-devel.x86_64
RUN yum -y install python-pip
RUN yum -y install mysql-devel && yum clean all
RUN pip install --upgrade pip
RUN pip install PyMySQL && pip install MySQL-python




RUN pip install kafka-python==1.4.4 \
  && pip install redis==3.5.2 \
  && pip install protobuf==2.5.0 \
  && pip install request \
  && pip install requests \
  && pip install openpyxl \
  && pip install et-xmlfile \
  && pip install query-string \
  && pip install urllib3 \
  && pip install wheel \
  && pip install supervisor==${SUPERVISOR_VERSION} \
  && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ADD container-files /
VOLUME ["/data"]

#--------------redis-----------------------
# User
USER root
# Mountable directories
VOLUME ["/var/lib/redis"]
# Set the environment variables
ENV HOME /var/lib/redis
# Working directory
WORKDIR /var/lib/redis

RUN ["chmod", "+x", "/config/bootstrap.sh"]
ENTRYPOINT ["/config/bootstrap.sh"]

EXPOSE 9111