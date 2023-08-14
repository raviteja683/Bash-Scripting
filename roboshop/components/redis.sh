#/bin/bash
COMPONENT=redis
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
echo -n "Configuring ${COMPONENT} repo: "
curl -L https://raw.githubusercontent.com/stans-robot-project/redis/main/redis.repo -o /etc/yum.repos.d/redis.repo &>> ${LOGFILE}
stat $?
echo -n "installing ${COMPONENT} : "
yum install redis-6.2.12 -y &>> ${LOGFILE}
stat $?

echo -n "Enabling the visibility ${COMPONENT}, so other server can access it (sudo netstat -tulpn): "
sed -ie 's/127.0.0.1/0.0.0.0/g' /etc/redis.conf
sed -ie 's/127.0.0.1/0.0.0.0/g' /etc/redis/redis.conf
stat $?

systemctl daemon-reload ${COMPONENT} &>> ${LOGFILE}
systemctl enable ${COMPONENT} &>> ${LOGFILE}
systemctl start ${COMPONENT} &>> ${LOGFILE}

echo -e "\e[35m ${COMPONENT} Installation Is Completed \e[0m \n"



