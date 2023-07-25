#!/bin/bash
screen -S zomboid -X stuff "checkModsNeedUpdate\n"

tail -f ~/Zomboid/Logs/*DebugLog-server.txt -n 0 | while read line; do

if echo $line | grep -q "updated"
then echo Zomboid  mods are up to date && break
fi

if echo $line | grep -q "need update"
then echo updating Zomboid
~/Documents/Updates/PZupdate.sh && break
fi
done
