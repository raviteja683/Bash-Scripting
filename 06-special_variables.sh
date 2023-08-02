#!/bin/bash
# Special variables gives special properties to your variables 

# Here are few of the special variabes :  $0 to $9 , $? ,  $#,  $* , $@ 
a=10
b=20
echo a values is : a
echo The current execution script is : $0 # $0 prints the script name you're executin
echo First alphabet is : $1
echo First alphabet is : $2
echo First alphabet is : $3
echo First alphabet is : $4
echo First alphabet is : $5
echo First alphabet is : $6
echo First alphabet is : $7
echo First alphabet is : $8
echo First alphabet is : $9 #maximum of 9 arguments from the command line
echo First alphabet is : $10 # if you provide above 9th argument it will take 1st argument followed by 0,1,2 etc
echo First alphabet is : $11 # ravi a b c ... 10th = ravi0, 11th= ravi1

echo $$    # $$ is going to print the PID of the current proces 
echo $#    # $# is going to print the number of arguments
echo $?    # $? is going to print the exit code of the last command.
echo $*    # $* is going to print the used arguments
echo $@    # $* is going to print the used arguments

