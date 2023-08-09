#/bin/bash
COMPONENT=frontend
LOG_FILE="/tmp/${COMPONENT}.log"
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
yum install nginx -y  &>> ${LOG_FILE}
stat $?
systemctl enable nginx
echo -n "nginx start : "
systemctl start nginx &>> ${LOG_FILE}
stat $?
echo -n "${COMPONENT} components downloaded : "
curl -s -L -o /tmp/${COMPONENT}.zip "https://github.com/stans-robot-project/${COMPONENT}/archive/main.zip" &>> ${LOG_FILE}
stat $?
cd /usr/share/nginx/html
rm -rf * &>> ${LOG_FILE}
echo -n "Extracting ${COMPONENT}: "
unzip /tmp/${COMPONENT}.zip &>> ${LOG_FILE}
stat $?
mv ${COMPONENT}-main/* . 
mv static/* . 
rm -rf ${COMPONENT}-main README.md &>> ${LOG_FILE}
mv localhost.conf /etc/nginx/default.d/roboshop.conf &>> ${LOG_FILE}
echo -n "Restarting ${COMPONENT}:"
systemctl daemon-reload     &>>  ${LOG_FILE}
systemctl restart nginx     &>>  ${LOG_FILE}
stat $?
echo -e "\e[35m ${COMPONENT} Installation Is Completed \e[0m \n"