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



#--------------------jdk1.8--------------------------
RUN mkdir /usr/local/jdk
ADD jdk /usr/local/jdk
ENV JAVA_HOME /usr/local/jdk/jdk1.8.0_251
ENV JRE_HOME /usr/local/jdk/jdk1.8.0_251/jre
ENV PATH $JAVA_HOME/bin:$PATH



ENV CRYPTO_DIR=/usr/local/openresty/openssl/
ENV OPENSSL_DIR=/usr/local/openresty/openssl/
ENV LAPIS_OPENRESTY=/usr/local/openresty/nginx/sbin/nginx



#----------------------lpais -----------------------------
RUN yum install -y yum-utils \
    && yum-config-manager --add-repo ${RESTY_YUM_REPO} \
    && yum install -y \
        dnsmasq \
        bind-utils \
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
	&& /usr/local/openresty/luajit/bin/luarocks install lua-resty-timer \
	&& /usr/local/openresty/luajit/bin/luarocks install lua-resty-lrucache \
	&& /usr/local/openresty/luajit/bin/luarocks install lua-resty-mlcache \
	&& /usr/local/openresty/luajit/bin/luarocks install lua-resty-qless \
	&& /usr/local/openresty/luajit/bin/luarocks install lua-resty-http2 \
	&& /usr/local/openresty/luajit/bin/luarocks install lua-resty-shcache \
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


#----------------------dnsmasq------------------------
RUN mkdir -p /etc/default/
RUN echo -e "ENABLED=1\nIGNORE_RESOLVCONF=yes" > /etc/default/dnsmasq
#https://github.com/jpillora/webproc, need complie
COPY ./webproc/webproc  /usr/local/bin/webproc
RUN chmod +x /usr/local/bin/webproc



#---------------------python pip----------------------
RUN yum -y install python-devel.x86_64
RUN yum -y install python-pip
RUN yum -y install mysql-devel
RUN pip install --upgrade pip
RUN pip install MySQL-python
RUN pip install kafka-python==1.4.4 -i https://mirrors.aliyun.com/pypi/simple \
  && pip install redis==3.5.2 -i https://mirrors.aliyun.com/pypi/simple \
  && pip install protobuf==2.5.0 -i https://mirrors.aliyun.com/pypi/simple \
  && pip install requests -i https://mirrors.aliyun.com/pypi/simple \
  && pip install openpyxl -i https://mirrors.aliyun.com/pypi/simple \
  && pip install et-xmlfile -i https://mirrors.aliyun.com/pypi/simple \
  && pip install query-string -i https://mirrors.aliyun.com/pypi/simple \
  && pip install urllib3 -i https://mirrors.aliyun.com/pypi/simple \
  && pip install redis-py-cluster==1.3.6 -i https://mirrors.aliyun.com/pypi/simple \
  && pip install wheel -i https://mirrors.aliyun.com/pypi/simple \
  && pip install supervisor==${SUPERVISOR_VERSION} -i https://mirrors.aliyun.com/pypi/simple \
  && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ADD container-files /
VOLUME ["/data"]

#---------------------sshd 22----------------------
RUN yum -y install openssh-server epel-release && \
    yum -y install pwgen && \
    ssh-keygen -t rsa -f /etc/ssh/ssh_host_rsa_key && \
    ssh-keygen -t ecdsa -f /etc/ssh/ssh_host_ecdsa_key && \
    ssh-keygen -t ed25519 -f /etc/ssh/ssh_host_ed25519_key
RUN ["chmod", "+x", "/sshd/run.sh"]
RUN ["chmod", "+x", "/sshd/set_root_pw.sh"]
EXPOSE 22


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


