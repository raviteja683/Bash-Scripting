#!/bin/bash
ACTION=$1
echo "if else demo"
if [ $ACTION == "start" ];
then
    echo Payment start is ready
    exit 0

else
    echo Payment argument is different
    exit 1
fi

