#!/bin/bash

#what is the current version
CURRENTVER=$(cat current_version.txt)
echo Current Version: $CURRENTVER

#what is the latest version
LATESTVER=$(curl -s https://launchermeta.mojang.com/mc/game/version_manifest.json | jq -r '.latest.release')
echo  Latest Version: $LATESTVER

#check if current version matches latest version
if [ $LATESTVER != $CURRENTVER ]
then
echo this server shit hits different

#start downloading latest version
LATESTURL=$(curl -s https://launchermeta.mojang.com/mc/game/version_manifest.json | jq -r '.versions[] | select(.id=='\"$LATESTVER\"') | .url')
SERVERURL=$(curl -s $LATESTURL | jq -r '.downloads.server.url')
wget -q -O server.jar $SERVERURL
echo up to date now

else
echo \*spiderman pointing meme\* same bro
fi

#write the latest version into current_version
echo $LATESTVER > current_version.txt
