#/bin/bash
COMPONENT=catalogue
LOGFILE="/tmp/${COMPONENT}.log"
echo "configuring ${COMPONENT}:"
USER_ID=$(id -u)
APPUSER="roboshop"
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

echo -e "\e[35m Congiguring the repo \e[0m...."
curl --silent --location https://rpm.nodesource.com/setup_16.x | sudo bash - &>> ${LOGFILE}
stat $?

echo -n "Node Js installation: "
yum install nodejs -y  &>> ${LOGFILE}
stat $?

id ${APPUSER} &>>${LOGFILE}
if [ $? -ne 0 ]; then
     echo -n "create a new user account:"
     useradd roboshop   &>> ${LOGFILE}
     stat $? 
fi

# Switching to User account  sudo su - roboshop
echo -n "Downloading the ${COMPONENT} : "
curl -s -L -o /tmp/${COMPONENT}.zip "https://github.com/stans-robot-project/${COMPONENT}/archive/main.zip" 
stat $? 

cd /home/${APPUSER}
rm -rf ${COMPONENT} >> ${LOGFILE}
unzip -o /tmp/${COMPONENT}.zip >> ${LOGFILE}
# [ roboshop@catalogue ~ ]$ ls -ltr
# total 0
# drwxr-xr-x 2 root root 83 Jun 22  2022 catalogue-main to roboshop account
# Need to update the ownership of the file
echo -n "Changing Ownership to user account: ..."
echo -n "Changing the ownership :"
mv  ${COMPONENT}-main ${COMPONENT} 
chown -R ${APPUSER}:${APPUSER} /home/${APPUSER}/${COMPONENT}/
stat $?

echo -n "Generating the ${COMPONENT} artifacts :"
cd /home/${APPUSER}/${COMPONENT}/
npm install     &>> ${LOGFILE}
stat $? 
#$ vim systemd.servce
# mv /home/roboshop/catalogue/systemd.service /etc/systemd/system/catalogue.service
# systemctl daemon-reload
# systemctl start catalogue
# systemctl enable catalogue
# systemctl status catalogue -l

# vim /etc/nginx/default.d/roboshop.conf
# systemctl restart nginx