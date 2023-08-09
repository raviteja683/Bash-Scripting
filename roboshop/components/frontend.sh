#/bin/bash
echo "configuring frontend:"
USER_ID=$(id -u)
if [ $USER_ID -ne 0 ] ; then
    echo -e "\e[33m You need install frontend as root user!!\e[0m "
    exit 1
fi
stat() {
    if [ $1 -eq 0 ]; then 
        echo -e "\e[32m success \e[0m"
    else 
        echo -e "\e[31m failure \e[0m"
        exit 2
    fi
}
echo -n "Frontend (nginx) installation: "
yum install nginx80 -y  &>> /tmp/frontend.log
stat $?


systemctl enable nginx
echo -n "nginx start : "
systemctl start nginx &>> /tmp/frontend.log
stat $?
echo -n "frontend components downloaded : "
curl -s -L -o /tmp/frontend.zip "https://github.com/stans-robot-project/frontend/archive/main.zip" &>> /tmp/frontend.log
stat $?
cd /usr/share/nginx/html
rm -rf * &>> /tmp/frontend.log
unzip /tmp/frontend.zip &>> /tmp/frontend.log
mv frontend-main/* . &>> /tmp/frontend.log
mv static/* . &>> /tmp/frontend.log
rm -rf frontend-main README.md &>> /tmp/frontend.log
mv localhost.conf /etc/nginx/default.d/roboshop.conf &>> /tmp/frontend.log