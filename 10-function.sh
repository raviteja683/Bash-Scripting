#!/bin/bash
rakesh(){
    echo -e "Hi Ravi, I'm in Warangal!! \n you can find the details below"
    echo "Number of sessions opened are $(who | wc -l)"
    echo "Todays date is $(date +%F)"
    echo "Avg CPU Utilization in last 5 minutes $(uptime | awk -F : '{print $NF}' | awk -F , '{print $2}')"
}
ravi(){
    echo "Hi Rakesh,Where are you now? and some stats about this VM"
    sleep 5
    rakesh
}
ravi


