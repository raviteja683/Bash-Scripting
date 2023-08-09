#/bin/bash
COMPONENT=frontend
echo "configuring ${COMPONENT}:"
USER_ID=$(id -u)
if [ $USER_ID -ne 0 ] ; then
    echo -e "\e[33m You need install ${COMPONENT} as root user!!\e[0m "
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
echo -n "${COMPONENT} (nginx) installation: "
yum install nginx -y  &>> /tmp/${COMPONENT}.log
stat $?
systemctl enable nginx
echo -n "nginx start : "
systemctl start nginx &>> /tmp/${COMPONENT}.log
stat $?
echo -n "${COMPONENT} components downloaded : "
curl -s -L -o /tmp/${COMPONENT}.zip "https://github.com/stans-robot-project/${COMPONENT}/archive/main.zip" &>> /tmp/${COMPONENT}.log
stat $?
cd /usr/share/nginx/html
rm -rf * &>> /tmp/${COMPONENT}.log
echo -n "Extracting ${COMPONENT}: "
unzip /tmp/${COMPONENT}.zip &>> /tmp/${COMPONENT}.log
stat $?
mv ${COMPONENT}-main/* . 
mv static/* . 
rm -rf ${COMPONENT}-main README.md &>> /tmp/${COMPONENT}.log
mv localhost.conf /etc/nginx/default.d/roboshop.conf &>> /tmp/${COMPONENT}.log
echo -n "Restarting ${COMPONENT}:"
systemctl daemon-reload     &>>  /tmp/${COMPONENT}.log
systemctl restart nginx     &>>  /tmp/${COMPONENT}.log
stat $?