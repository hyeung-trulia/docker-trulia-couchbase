From ubuntu:12.04

MAINTAINER Hinling Yeung "hyeung@trulia.com"

ADD http://cbfs-ext.hq.couchbase.com/couchbase-dist/couchbase-server-enterprise_2.2.0_x86_64.deb /tmp/couchbase-server-enterprise_2.2.0_x86_64.deb

RUN export DEBIAN_FRONTEND=noninteractive
RUN apt-get update
RUN apt-get -y install vim curl libssl0.9.8 librtmp0 python
RUN dpkg -i /tmp/couchbase-server-enterprise_2.2.0_x86_64.deb


# remove couchbase install file
RUN rm /tmp/couchbase-server-enterprise_2.2.0_x86_64.deb

# add start scripts
ADD start-couchbase.sh /start-couchbase.sh

# Expose Web Administration Port, Couchbase API Port & Internal/External Bucket Port
EXPOSE 8091 8092 11210

CMD ["/start-couchbase.sh"] 
