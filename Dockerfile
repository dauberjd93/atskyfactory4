FROM  adoptopenjdk:8u242-b08-jdk-hotspot

MAINTAINER dauberjd93

ENV SERVER_MAXHEAP 8192M
ENV SERVER_MINHEAP 8192M
ENV SERVER_OPTS nogui

VOLUME ["/opt/minecraft/server"]

ADD SkyFactory4 /tmp/SkyFactory4
ADD init.sh /root/

RUN apt-get update && apt-get install unzip

EXPOSE 25565
RUN chmod -R 777 /opt/minecraft
CMD ["/bin/bash", "/root/init.sh"]
