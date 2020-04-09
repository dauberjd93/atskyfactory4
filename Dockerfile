FROM  adoptopenjdk:8u242-b08-jdk-hotspot

MAINTAINER dauberjd93

ENV SERVER_MAXHEAP 8192M
ENV SERVER_MINHEAP 8192M
ENV SERVER_OPTS nogui

VOLUME ["/opt/minecraft/"]

ADD SkyFactory4/* /opt/minecraft/
ADD init.sh /opt/minecraft/

RUN apt-get update && apt-get install unzip
#RUN curl --silent -o /opt/minecraft/minecraft_server.1.12.2.jar 'http://s3.amazonaws.com/Minecraft.Download/versions/1.12.2/minecraft_server.1.12.2.jar'
#RUN curl --silent -o /tmp/server.zip "`curl --silent 'https://atlauncher.com/pack/SkyFactory4' | grep "Download Server" | sed 's/.*href="\([^"]*\)".*/\1/'`" && cd /opt/minecraft && unzip /tmp/server.zip && rm /tmp/server.zip

EXPOSE 25565
WORKDIR /opt/minecraft/
RUN chmod -R 777 /opt/minecraft
CMD ["./init.sh"]
