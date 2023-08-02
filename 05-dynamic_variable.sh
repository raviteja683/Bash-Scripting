#!/bin/bash
#print current date
#DATE=$(date +%F)
DATE=$(date +%F)
SESSION_COUNT=$(who | wc -l)
echo -e "today's date is \e[43;32m $DATE \e[0m"
echo -e "No. of session count is \e[43;32m $SESSION_COUNT \e[0m"