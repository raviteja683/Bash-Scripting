#!bin/bash
ACTION=$1
case $ACTION in 
    start)
        echo "Payment start"
    ;;
    stop)
        echo "Payment stop"
    ;;
esac