#/bin/bash
echo "configuring frontend:"
USER_ID=$(id -u)
echo "user id is : $USER_ID"
if [ $USER_ID -ne 0 ] ; then
    echo -e "\e[33m You need install frontend as root user!!\e[0m "
    exit 1
fi
echo -e "\e[32m installing nginx.....please wait \e[0m"
yum install nginx -y &>> /tmp/frontend.log
if [$? -eq 0]; then
    echo -e "\e[32m ngnix installed successfully!! \e[0m"

else
    echo -e "\e[31m ngnix installation failed \e[0m"
fi
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

