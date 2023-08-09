#!/bin/bash
bash components/$1.sh
if [ $? -ne 0 ] ; then
    echo -e " You need to enter correct component name \n \t\t \e[33m ex: sudo bash wrapper.sh frontend \e[0m"
fi