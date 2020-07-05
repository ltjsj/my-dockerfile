# Dockerfile - CentOS 7 - RPM version
# https://github.com/openresty/docker-openresty

ENV SUPERVISOR_VERSION=4.0.2
ARG RESTY_IMAGE_BASE="centos"
ARG RESTY_IMAGE_TAG="7"


FROM ${RESTY_IMAGE_BASE}:${RESTY_IMAGE_TAG}

LABEL maintainer="Evan Wies <evan@neomantra.net>"

ARG RESTY_IMAGE_BASE="centos"
ARG RESTY_IMAGE_TAG="7"
ARG RESTY_LUAROCKS_VERSION="3.2.1"
ARG RESTY_YUM_REPO="https://openresty.org/package/centos/openresty.repo"
ARG RESTY_RPM_FLAVOR=""
ARG RESTY_RPM_VERSION="1.15.8.3-1"
ARG RESTY_RPM_DIST="el7"
ARG RESTY_RPM_ARCH="x86_64"

LABEL resty_image_base="${RESTY_IMAGE_BASE}"
LABEL resty_image_tag="${RESTY_IMAGE_TAG}"
LABEL resty_luarocks_version="${RESTY_LUAROCKS_VERSION}"
LABEL resty_yum_repo="${RESTY_YUM_REPO}"
LABEL resty_rpm_flavor="${RESTY_RPM_FLAVOR}"
LABEL resty_rpm_version="${RESTY_RPM_VERSION}"
LABEL resty_rpm_dist="${RESTY_RPM_DIST}"
LABEL resty_rpm_arch="${RESTY_RPM_ARCH}"


##
## Labels
##
LABEL \
	name="cytopia's MySQL 5.7 Image" \
	image="mysql-5.7" \
	vendor="cytopia" \
	license="MIT" \
	build-date="2017-09-28"

###
### Envs
###

# Version
# Check for Updates:
# https://dev.mysql.com/downloads/repo/yum/
ENV YUM_REPO_URL="https://dev.mysql.com/get/mysql57-community-release-el7-10.noarch.rpm "

# User/Group
ENV MY_USER="mysql"
ENV MY_GROUP="mysql"
ENV MY_UID="48"
ENV MY_GID="48"

# Files
ENV MYSQL_BASE_INCL="/etc/my.cnf.d"
ENV MYSQL_CUST_INCL1="/etc/mysql/conf.d"
ENV MYSQL_CUST_INCL2="/etc/mysql/docker-default.d"
ENV MYSQL_DEF_DAT="/var/lib/mysql"
ENV MYSQL_DEF_LOG="/var/log/mysql"
ENV MYSQL_DEF_PID="/var/run/mysqld"
ENV MYSQL_DEF_SCK="/var/sock/mysqld"

ENV MYSQL_LOG_SLOW="${MYSQL_DEF_LOG}/slow.log"
ENV MYSQL_LOG_ERROR="${MYSQL_DEF_LOG}/error.log"
ENV MYSQL_LOG_QUERY="${MYSQL_DEF_LOG}/query.log"




ENV CRYPTO_DIR=/usr/local/openresty/openssl/
ENV OPENSSL_DIR=/usr/local/openresty/openssl/
ENV LAPIS_OPENRESTY=/usr/local/openresty/nginx/sbin/nginx

RUN yum install -y yum-utils \
    && yum-config-manager --add-repo ${RESTY_YUM_REPO} \
    && yum install -y \
        gettext \
		gcc \
		git \
		openssl.x86_64 \
		openssl-devel.x86_64 \
        gzip \
        make \
        openresty${RESTY_RPM_FLAVOR}-${RESTY_RPM_VERSION}.${RESTY_RPM_DIST}.${RESTY_RPM_ARCH} \
        openresty-opm-${RESTY_RPM_VERSION}.${RESTY_RPM_DIST} \
        openresty-resty-${RESTY_RPM_VERSION}.${RESTY_RPM_DIST} \
        tar \
        unzip \
    && cd /tmp \
    && curl -fSL https://luarocks.github.io/luarocks/releases/luarocks-${RESTY_LUAROCKS_VERSION}.tar.gz -o luarocks-${RESTY_LUAROCKS_VERSION}.tar.gz \
    && tar xzf luarocks-${RESTY_LUAROCKS_VERSION}.tar.gz \
    && cd luarocks-${RESTY_LUAROCKS_VERSION} \
    && ./configure \
        --prefix=/usr/local/openresty/luajit \
        --with-lua=/usr/local/openresty/luajit \
        --lua-suffix=jit-2.1.0-beta3 \
        --with-lua-include=/usr/local/openresty/luajit/include/luajit-2.1 \
    && make build \
    && make install \
    && cd /tmp \
    && rm -rf luarocks-${RESTY_LUAROCKS_VERSION} luarocks-${RESTY_LUAROCKS_VERSION}.tar.gz \
    && yum remove -y make \
    && yum clean all \
    && mkdir -p /var/run/openresty \
    && ln -sf /dev/stdout /usr/local/openresty/nginx/logs/access.log \
    && ln -sf /dev/stderr /usr/local/openresty/nginx/logs/error.log \
	&& /usr/local/openresty/luajit/bin/luarocks install lunitx \
	&& /usr/local/openresty/luajit/bin/luarocks install ansicolors \
	&& /usr/local/openresty/luajit/bin/luarocks install date \
	&& /usr/local/openresty/luajit/bin/luarocks install etlua \
	&& /usr/local/openresty/luajit/bin/luarocks install loadkit \ 
	&& /usr/local/openresty/luajit/bin/luarocks install mimetypes \
	&& /usr/local/openresty/luajit/bin/luarocks install pgmoon \
	&& /usr/local/openresty/luajit/bin/luarocks install lpeg \
	&& /usr/local/openresty/luajit/bin/luarocks install lua-resty-core \
	&& /usr/local/openresty/luajit/bin/luarocks install elasticsearch \
	&& /usr/local/openresty/luajit/bin/luarocks install lua-cjson \
	&& /usr/local/openresty/luajit/bin/luarocks install lua-resty-http \
	&& /usr/local/openresty/luajit/bin/luarocks install luafilesystem \
	&& /usr/local/openresty/luajit/bin/luarocks install luasocket \
	&& /usr/local/openresty/luajit/bin/luarocks install lua-resty-mysql \
	&& /usr/local/openresty/luajit/bin/luarocks install lua-resty-kafka \
	&& /usr/local/openresty/luajit/bin/luarocks install lua-resty-balancer \
	&& /usr/local/openresty/luajit/bin/luarocks install lua-resty-jwt \
	&& /usr/local/openresty/luajit/bin/luarocks install luaossl \ 
	&& /usr/local/openresty/luajit/bin/luarocks install lapis 1.7.0-1 

RUN yum -y install epel-release && yum clean all
RUN yum -y install python-devel.x86_64 && yum clean all
RUN yum -y install python-pip && yum clean all
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
  && pip install supervisor==${SUPERVISOR_VERSION}
  && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*



###
### Install
###
RUN groupadd -g ${MY_GID} -r ${MY_GROUP} && \
	adduser ${MY_USER} -u ${MY_UID} -M -s /sbin/nologin -g ${MY_GROUP}

RUN \
	yum -y install epel-release && \
	rpm -ivh ${YUM_REPO_URL} && \
	yum-config-manager --disable mysql55-community && \
	yum-config-manager --disable mysql56-community && \
	yum-config-manager --enable mysql57-community && \
	yum-config-manager --disable mysql80-community && \
	yum clean all

RUN yum -y update && yum -y install \
	mysql-community-server

RUN \
	yum -y autoremove && \
	yum clean metadata && \
	yum clean all && \
	yum -y install hostname && \
	yum clean all


##
## Configure
##
RUN \
	rm -rf ${MYSQL_BASE_INCL} && \
	rm -rf ${MYSQL_CUST_INCL1} && \
	rm -rf ${MYSQL_CUST_INCL2} && \
	rm -rf ${MYSQL_DEF_DAT} && \
	rm -rf ${MYSQL_DEF_SCK} && \
	rm -rf ${MYSQL_DEF_PID} && \
	rm -rf ${MYSQL_DEF_LOG} && \
	\
	mkdir -p ${MYSQL_BASE_INCL} && \
	mkdir -p ${MYSQL_CUST_INCL1} && \
	mkdir -p ${MYSQL_CUST_INCL2} && \
	mkdir -p ${MYSQL_DEF_DAT} && \
	mkdir -p ${MYSQL_DEF_SCK} && \
	mkdir -p ${MYSQL_DEF_PID} && \
	mkdir -p ${MYSQL_DEF_LOG} && \
	\
	chown -R ${MY_USER}:${MY_GROUP} ${MYSQL_BASE_INCL} && \
	chown -R ${MY_USER}:${MY_GROUP} ${MYSQL_CUST_INCL1} && \
	chown -R ${MY_USER}:${MY_GROUP} ${MYSQL_CUST_INCL2} && \
	chown -R ${MY_USER}:${MY_GROUP} ${MYSQL_DEF_DAT} && \
	chown -R ${MY_USER}:${MY_GROUP} ${MYSQL_DEF_SCK} && \
	chown -R ${MY_USER}:${MY_GROUP} ${MYSQL_DEF_PID} && \
	chown -R ${MY_USER}:${MY_GROUP} ${MYSQL_DEF_LOG} && \
	\
	chmod 0775 ${MYSQL_BASE_INCL} && \
	chmod 0775 ${MYSQL_CUST_INCL1} && \
	chmod 0775 ${MYSQL_CUST_INCL2} && \
	chmod 0775 ${MYSQL_DEF_DAT} && \
	chmod 0775 ${MYSQL_DEF_SCK} && \
	chmod 0775 ${MYSQL_DEF_PID} && \
	chmod 0775 ${MYSQL_DEF_LOG}

RUN \
	echo "[client]"                                         > /etc/my.cnf && \
	echo "socket = ${MYSQL_DEF_SCK}/mysqld.sock"           >> /etc/my.cnf && \
	\
	echo "[mysql]"                                         >> /etc/my.cnf && \
	echo "socket = ${MYSQL_DEF_SCK}/mysqld.sock"           >> /etc/my.cnf && \
	\
	echo "[mysqld]"                                        >> /etc/my.cnf && \
	echo "skip-host-cache"                                 >> /etc/my.cnf && \
	echo "skip-name-resolve"                               >> /etc/my.cnf && \
	echo "datadir = ${MYSQL_DEF_DAT}"                      >> /etc/my.cnf && \
	echo "user = ${MY_USER}"                               >> /etc/my.cnf && \
	echo "port = 3306"                                     >> /etc/my.cnf && \
	echo "bind-address = 0.0.0.0"                          >> /etc/my.cnf && \
	echo "socket = ${MYSQL_DEF_SCK}/mysqld.sock"           >> /etc/my.cnf && \
	echo "pid-file = ${MYSQL_DEF_PID}/mysqld.pid"          >> /etc/my.cnf && \
	echo "general_log_file = ${MYSQL_LOG_QUERY}"           >> /etc/my.cnf && \
	echo "slow_query_log_file = ${MYSQL_LOG_SLOW}"         >> /etc/my.cnf && \
	echo "log-error = ${MYSQL_LOG_ERROR}"                  >> /etc/my.cnf && \
	echo "!includedir ${MYSQL_BASE_INCL}/"                 >> /etc/my.cnf && \
	echo "!includedir ${MYSQL_CUST_INCL1}/"                >> /etc/my.cnf && \
	echo "!includedir ${MYSQL_CUST_INCL2}/"                >> /etc/my.cnf


##
## Bootstrap Scipts
##
COPY ./scripts/docker-entrypoint.sh /


##
## Ports
##
EXPOSE 3306


##
## Volumes
##
VOLUME /var/lib/mysql
VOLUME /var/log/mysql
VOLUME /var/sock/mysqld
VOLUME /etc/mysql/conf.d
VOLUME /etc/mysql/docker-default.d

##
## Entrypoint
##
#ENTRYPOINT ["/docker-entrypoint.sh"]
RUN ["chmod", "+x", "/docker-entrypoint.sh"]


RUN yum -y install openssh-server epel-release && \
    yum -y install pwgen && \
    rm -f /etc/ssh/ssh_host_ecdsa_key /etc/ssh/ssh_host_rsa_key && \
    ssh-keygen -q -N "" -t dsa -f /etc/ssh/ssh_host_ecdsa_key && \
    ssh-keygen -q -N "" -t rsa -f /etc/ssh/ssh_host_rsa_key && \
    sed -i "s/#UsePrivilegeSeparation.*/UsePrivilegeSeparation no/g" /etc/ssh/sshd_config

ADD ./scripts/set_root_pw.sh /set_root_pw.sh
ADD ./scripts/run.sh /run.sh
RUN chmod +x /*.sh

ENV AUTHORIZED_KEYS **None**

EXPOSE 22
#ENTRYPOINT ["/run.sh"]





# Install Redis
RUN yum -y install epel-release && \
	yum -y install redis && \
    yum clean all

# Copy config redis
ADD etc/redis.conf /etc/redis.conf

# User
USER root

# Mountable directories
VOLUME ["/var/lib/redis"]

# Set the environment variables
ENV HOME /var/lib/redis

# Working directory
WORKDIR /var/lib/redis

#ENTRYPOINT ["/usr/bin/redis-server", "/etc/redis.conf"]

# Expose ports.
EXPOSE 6379



# Unused, present for parity with other Dockerfiles
# This makes some tooling/testing easier, as specifying a build-arg
# and not consuming it fails the build.
ARG RESTY_J="1"
 

# Add additional binaries into PATH for convenience
ENV PATH=$PATH:/usr/local/openresty/luajit/bin:/usr/local/openresty/nginx/sbin:/usr/local/openresty/bin

# Add LuaRocks paths
# If OpenResty changes, these may need updating:
#    /usr/local/openresty/bin/resty -e 'print(package.path)'
#    /usr/local/openresty/bin/resty -e 'print(package.cpath)'
ENV LUA_PATH="/usr/local/openresty/site/lualib/?.ljbc;/usr/local/openresty/site/lualib/?/init.ljbc;/usr/local/openresty/lualib/?.ljbc;/usr/local/openresty/lualib/?/init.ljbc;/usr/local/openresty/site/lualib/?.lua;/usr/local/openresty/site/lualib/?/init.lua;/usr/local/openresty/lualib/?.lua;/usr/local/openresty/lualib/?/init.lua;./?.lua;/usr/local/openresty/luajit/share/luajit-2.1.0-beta3/?.lua;/usr/local/share/lua/5.1/?.lua;/usr/local/share/lua/5.1/?/init.lua;/usr/local/openresty/luajit/share/lua/5.1/?.lua;/usr/local/openresty/luajit/share/lua/5.1/?/init.lua"

ENV LUA_CPATH="/usr/local/openresty/site/lualib/?.so;/usr/local/openresty/lualib/?.so;./?.so;/usr/local/lib/lua/5.1/?.so;/usr/local/openresty/luajit/lib/lua/5.1/?.so;/usr/local/lib/lua/5.1/loadall.so;/usr/local/openresty/luajit/lib/lua/5.1/?.so"

# Copy nginx configuration files
COPY ./scripts/nginx-reload.sh /root/nginx-reload.sh
                                     COPY ./scripts/startup.sh /startup.sh

RUN mkdir -p /data/www/program/ && cd /data/www/program && lapis new --lua

#ENTRYPOINT ["/root/nginx-reload.sh"]

RUN ["chmod", "+x", "/root/nginx-reload.sh"]
RUN ["chmod", "+x", "/startup.sh"]
ENTRYPOINT ["/startup.sh"]

# Use SIGQUIT instead of default SIGTERM to cleanly drain requests
# See https://github.com/openresty/docker-openresty/blob/master/README.md#tips--pitfalls
STOPSIGNAL SIGQUIT
