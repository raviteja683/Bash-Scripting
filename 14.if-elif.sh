#!/bin/bash
ACTION=$1
echo "if else demo"
if ($ACTION =="start")
then
    echo Payment start is ready

else
    echo Payment argument is different
fi

