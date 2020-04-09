#!/bin/bash

# if minecraft folder doesnt exist then copy default to host config volume
if [ ! -d "/opt/minecraft/server/SkyFactory4" ]; then
	echo "[info] Minecraft folder doesn't exist, copying default to '/opt/minecraft/server/'..."
	mv /tmp/SkyFactory4 /opt/minecraft/server/
else
	echo "[info] Minecraft folder '/config/minecraft' already exists, rsyncing newer files..."
	rsync -rltp --exclude 'world' --exclude '/server.properties' --exclude '/*.json' /tmp/SkyFactory4 /opt/minecraft/server/SkyFactory4
fi

if [ -f /opt/minecraft/server/forge-*-installer.jar ] ; then 
    echo "Installing needed Lib files"
    cd /opt/minecraft/server/SkyFactory4
    java -server -Xmx${SERVER_MAXHEAP} -Xms${SERVER_MINHEAP} -XX:+UseG1GC -jar /opt/minecraft/server/SkyFactory4/forge-*-installer.jar ${SERVER_OPTS}  --installServer
    echo "Removing Installer"
    rm  /opt/minecraft/server/SkyFactory4forge-*-installer.jar
fi


#Start Server
echo "Starting Skyfactory4"
cd /opt/minecraft/server/SkyFactory4
java -server -Xmx${SERVER_MAXHEAP} -Xms${SERVER_MINHEAP} -XX:+UseG1GC -jar /opt/minecraft/server/SkyFactory4/forge-*-universal.jar ${SERVER_OPT}