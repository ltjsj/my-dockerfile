### Lapis web This framework runs in a customized version of Nginx called OpenResty. This docker is built on the centos system, including lapis, luarocks, openresty,git etc

## v1.0 feature 
       #lapis version is 1.7.0-1   
       #openresty version is  1.15.8.3-1   
       #luajit version  luajit-2.1    
       #including  lunitx, ansicolors ,date, etlua, loadkit,mimetypes,pgmoon,lpeg,lua-resty-core ,elasticsearch,lua-cjson,luafilesystem,luasocket,lua-resty-mysql,lua-resty-kafka,
	lua-resty-balancer ,lua-resty-jwt,luaossl,openssl etc.  wait for a sophisticated Lua client library   

## The build script is as follows

```js
 yum install -y yum-utils \
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
```


## How to run 
  
```js
       # docker pull ltjsj/lapis-centos:v1.0    
       # dorcker run  -v /i/workProject/lua/project-name:/data/www/program -p 9444:8010  ltjsj/lapis-centos:v1.0
```

## Explanation   

**/i represents the i disk under windows, such as the location where the i: \, d: \, c: \ disk Your project is stored in the windows environment, just mount it out, 9444 is the port of windows,  8010 is the port in the container**

    
## Mount log directory
```js
 #dorcker run  -v /i/workProject/lua/project-name:/data/www/program -p 9444:8010   -v /i/logs:/data/log/  ltjsj/lapis-centos:v1.0
```
