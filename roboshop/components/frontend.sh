#/bin/bash
COMPONENT=frontend
LOGFILE="/tmp/${COMPONENT}.log"
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
yum install nginx -y  &>> ${LOGFILE}
stat $?
systemctl enable nginx
echo -n "nginx start : "
systemctl start nginx &>> ${LOGFILE}
stat $?
echo -n "${COMPONENT} components downloaded : "
curl -s -L -o /tmp/${COMPONENT}.zip "https://github.com/stans-robot-project/${COMPONENT}/archive/main.zip" &>> ${LOGFILE}
stat $?
cd /usr/share/nginx/html
rm -rf * &>> ${LOGFILE}
echo -n "Extracting ${COMPONENT}: "
unzip /tmp/${COMPONENT}.zip &>> ${LOGFILE}
stat $?
mv ${COMPONENT}-main/* . 
mv static/* . 
rm -rf ${COMPONENT}-main README.md &>> ${LOGFILE}
mv localhost.conf /etc/nginx/default.d/roboshop.conf &>> ${LOGFILE}
echo -n "Restarting ${COMPONENT}:"
systemctl daemon-reload     &>>  ${LOGFILE}
systemctl restart nginx     &>>  ${LOGFILE}
stat $?
echo -e "\e[35m ${COMPONENT} Installation Is Completed \e[0m \n"