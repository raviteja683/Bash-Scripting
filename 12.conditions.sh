#!bin/bash
ACTION=$1
case $ACTION in 
    start)
        echo -e "Payment \e[32m start \e[0m service"
    ;;
    stop)
        echo "Payment stop service"
    ;;
    *)
        echo -e "You should provide stop / start as a agurment \n ex: bash scriptname.sh start"
    ;;
esac