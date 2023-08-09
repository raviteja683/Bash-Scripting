#/bin/bash
set -e
echo "configuring frontend:"
USER_ID= $(id -u)
if [ $USER_ID -ne 0 ] ;then
    echo "You need install frontend as root user!! "
    exit 1
fi
echo "installing nginx.....please wait"
yum install nginx -y
# systemctl enable nginx
# systemctl start nginx
# curl -s -L -o /tmp/frontend.zip "https://github.com/stans-robot-project/frontend/archive/main.zip"
# cd /usr/share/nginx/html
# rm -rf *
# unzip /tmp/frontend.zip
# mv frontend-main/* .
# mv static/* .
# rm -rf frontend-main README.md
# mv localhost.conf /etc/nginx/default.d/roboshop.conf

