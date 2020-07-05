# Dockerfile - CentOS 7 - RPM version
# https://github.com/openresty/docker-openresty
FROM centos:7
ENV SUPERVISOR_VERSION=4.0.2
ARG RESTY_IMAGE_BASE="centos"
ARG RESTY_IMAGE_TAG="7"

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
        epel-release \
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


RUN mkdir -p /data/www/program/ && cd /data/www/program && lapis new --lua



RUN yum -y install python-devel.x86_64
RUN yum -y install python-pip
RUN yum -y install mysql-devel
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
RUN yum -y install epel-release
RUN yum -y install redis

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

RUN yum clean all

# Use SIGQUIT instead of default SIGTERM to cleanly drain requests
# See https://github.com/openresty/docker-openresty/blob/master/README.md#tips--pitfalls
STOPSIGNAL SIGQUIT


