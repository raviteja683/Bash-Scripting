#/bin/bash
echo "configuring frontend:"
USER_ID=$(id -u)
if [ $USER_ID -ne 0 ] ; then
    echo -e "\e[33m You need install frontend as root user!!\e[0m "
    exit 1
fi
# stat() {
#     if [ $1 -eq 0 ]; then 
#         echo -e "\e[32m success \e[0m"
#     else 
#         echo -e "\e[31m failure \e[0m"
#         exit 2
#     fi
# }
stat() {
    if [ $1 -eq 0 ]; then 
        echo -e "\e[32m success \e[0m"
    else 
        echo -e "\e[31m failure \e[0m"
        exit 2
    fi
}
yum install nginxdffgfkgjfd -y  &>> /tmp/frontend.log
echo -n "Frontend (nginx) installation : "
stat $?
systemctl enable nginx
systemctl start nginx &>> /tmp/frontend.log
echo -n "nginx start : "
stat $?
curl -s -L -o /tmp/frontend.zip "https://github.com/stans-robot-project/frontend/archive/main.zip" &>> /tmp/frontend.log
echo -n "frontend components downloaded : "
stat $?
cd /usr/share/nginx/html
rm -rf * &>> /tmp/frontend.log
unzip /tmp/frontend.zip &>> /tmp/frontend.log
mv frontend-main/* . &>> /tmp/frontend.log
mv static/* . &>> /tmp/frontend.log
rm -rf frontend-main README.md &>> /tmp/frontend.log
mv localhost.conf /etc/nginx/default.d/roboshop.conf &>> /tmp/frontend.log

