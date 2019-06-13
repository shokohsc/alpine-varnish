FROM shokohsc/alpine-s6:3.9

ENV VARNISH_BACKEND_PORT 80

# install packages
RUN \
 echo "**** install build packages ****" && \
 apk update && \
 apk add --no-cache \
    logrotate \
	varnish && \
 echo "**** fix logrotate ****" && \
 sed -i "s#/var/log/messages {}.*# #g" /etc/logrotate.conf

# add local files
COPY root/ /

EXPOSE 80
