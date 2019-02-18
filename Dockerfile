# HMCFGUSB
# http://git.zerfleddert.de/cgi-bin/gitweb.cgi/hmcfgusb
FROM alpine:3.9

ARG HMCFGUSB_VERSION=0.102

ADD * /opt/hmcfgusb/

RUN apk add --update git build-base libusb libusb-dev && rm -rf /var/cache/apk/* \
  && cd /opt/hmcfgusb \
  && make \
  && rm *.h *.o *.c *.d \
  && apk del build-base libusb-dev  
  
EXPOSE 1234

WORKDIR /opt/hmcfgusb

CMD ["/opt/hmcfgusb/hmland", "-v", "-p 1234", "-I"]
