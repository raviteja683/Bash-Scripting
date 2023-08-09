#!bin/bash
ACTION=$1
case $ACTION in 
    start)
        echo -e "Payment \e[32m start \e[0m service"
    ;;
    stop)
        echo -e "\e[33m Payment stop service \e[0m"
    ;;
    *)
        echo -e "You should provide stop / start as a agurment \n \e[34m ex: bash scriptname.sh start \e[0m"
    ;;
esac