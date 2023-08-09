#!/bin/bash
ACTION=$1
echo "if else demo"
if [ "$ACTION" == "start" ];
then
    echo -e "\e[33m Payment start is ready\e[0m"
    exit 0
elif [ $ACTION == "restart" ];
then
    echo -e "\e[34m Payment restart is ready\e[0m"
    exit 1
else
    echo  -e "\e[31m Payment argument is different \e[0m"
    exit 2
fi

