FROM python:2.7.13
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update \
  && apt-get install -y mysql-server --no-install-recommends \
  && apt-get clean \
  && pip install PyMySQL \
  && pip install MySQL-python \
  && pip install kafka-python==1.4.4 \
  && pip install redis==3.5.2 \
  && pip install protobuf==2.5.0 \
  && pip install --upgrade pip \
  && pip install request \
  && pip install requests \
  && pip install openpyxl \
  && pip install et-xmlfile \
  && pip install query-string \
  && pip install urllib3 \
  && pip install wheel \
  && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*