#!/bin/bash

_USER=$USER
_FULL_NAME="First Last"
_PROJECT=$(echo "${PWD##*/}")

# gather information
read -p "User ($_USER): " _USER_NEW
if [ $_USER_NEW ]; then
    _USER=$_USER_NEW
fi
read -p "Full Name ($_FULL_NAME): " _FULL_NAME
if [ $_FULL_NAME_NEW ]; then
    _FULL_NAME=$_FULL_NAME_NEW
fi
read -p "Project ($_PROJECT): " _PROJECT_NEW
if [ $_PROJECT_NEW ]; then
    _PROJECT=$_PROJECT_NEW
fi

curl -L https://raw.githubusercontent.com/jamrizzi/dockmake/master/Dockerfile
curl -L https://raw.githubusercontent.com/jamrizzi/dockmake/master/Makefile

sed -i -e 's/${user\}/$_USER/g' Makefile
sed -i -e 's/${user\}/$_USER/g' Dockerfile

sed -i -e 's/${full_name\}/$_FULL_NAME/g' Makefile
sed -i -e 's/${full_name\}/$_FULL_NAME/g' Dockerfile

sed -i -e 's/${project\}/$_PROJECT/g' Makefile
sed -i -e 's/${project\}/$_PROJECT/g' Dockerfile
