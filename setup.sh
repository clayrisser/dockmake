#!/bin/bash

DM_USER=$USER
DM_FULL_NAME="First Last"
DM_PROJECT=$(echo "${PWD##*/}")

# gather information
read -p "User ($DM_USER): " DM_USER_NEW
if [ $DM_USER_NEW ]; then
    DM_USER=$DM_USER_NEW
fi
read -p "Full Name ($DM_FULL_NAME): " DM_FULL_NAME
if [ $DM_FULL_NAME_NEW ]; then
    DM_FULL_NAME=$DM_FULL_NAME_NEW
fi
read -p "Project ($DM_PROJECT): " DM_PROJECT_NEW
if [ $DM_PROJECT_NEW ]; then
    DM_PROJECT=$DM_PROJECT_NEW
fi

curl -oL https://raw.githubusercontent.com/jamrizzi/dockmake/master/Dockerfile
curl -oL https://raw.githubusercontent.com/jamrizzi/dockmake/master/Makefile

sed -i -e s/\${user\}/$DM_USER/g Makefile
sed -i -e s/\${user\}/$DM_USER/g Dockerfile

sed -i -e s/\${full_name\}/$DM_FULL_NAME/g Makefile
sed -i -e s/\${full_name\}/$DM_FULL_NAME/g Dockerfile

sed -i -e s/\${project\}/$DM_PROJECT/g Makefile
sed -i -e s/\${project\}/$DM_PROJECT/g Dockerfile
