#/bin/bash
COMPONENT=mongodb
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
echo -n "Configuring ${COMPONENT} repo: "
curl -s -o /etc/yum.repos.d/mongodb.repo https://raw.githubusercontent.com/stans-robot-project/mongodb/main/mongo.repo
stat $?
echo -n "installing ${COMPONENT} : "
yum install -y mongodb-org
stat $?
systemctl enable mongod
systemctl start mongod



