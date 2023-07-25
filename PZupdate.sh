#!/bin/bash
echo "telling the server its updating"
screen -S zomboid -X stuff "servermsg \"Server will be restarting in 30 seconds\"\n"
sleep 30
screen -S zomboid -X stuff "servermsg \"Restarting Server\"\n"
sleep 3

echo "stopping zomboid server"
screen -S zomboid -X stuff "quit\n"

while  pgrep ProjectZomboid > /dev/null ; do
sleep 1
done
echo process stopped


echo "updating project zomboid"
steamcmd +runscript PZupdate

echo "starting zomboid server"
screen -S zomboid -X stuff "./start.sh\n"
