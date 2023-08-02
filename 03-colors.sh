#!/bin/bash

# Colors       Foreground          Background
# Red               31                  41
# Green             32                  42
# Yellow            33                  43
# Blue              34                  44
# Magenta           35                  45
# Cyan              36                  46

# Syntax To Print Color Text Is :
# Ex : 
# echo -e "\e[COLORCODEm  Your Msg To Be Printed In Color \e[0m"
# echo -e "\e[33m I am printing YELLOW Color \e[0m"

# To print something with background + foreGround color , here is the syntax: 

echo -e "\e[33m Iam Printing Yellow Color \e[0m"
echo -e "\e[34m Iam Printing another coloer \e[0m"
echo -e "\e[43;34m I am printing both colors \e[0m"