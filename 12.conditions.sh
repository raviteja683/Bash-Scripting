#!bin/bash
ACTION=$1
case $ACTION in 
    start)
        echo "Payment start service"
    ;;
    stop)
        echo "Payment stop service"
    ;;
    *)
        echo -e "You should provide stop / start as a agurment \n ex: bash scriptname.sh start"
    ;;
esac