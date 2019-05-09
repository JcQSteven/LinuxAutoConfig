#!/bin/sh
## green to echo 
function green(){
    echo -e "\033[32m[ $1 ]\033[0m"
}
## Error
function red(){
    echo -e "\033[31m\033[01m[ $1 ]\033[0m"
}
## warning
function yellow(){
    echo -e "\033[33m\033[01m[ $1 ]\033[0m"
}

echo "              _______ ______   ______            ______   _        "
echo "             (  ____ Y ___  \ / ___  \ |\     /|/ ___  \ ( (    /| "
echo "             | (    \|/   )  )\/   \  \| )   ( |\/   \  \|  \  ( | "
echo "             | (____     /  /    ___) /| |   | |   ___) /|   \ | | "
echo "             (_____ \   /  /    (___ ( ( (   ) )  (___ ( | (\ \) | "
echo "                   ) ) /  /         ) \ \ \_/ /       ) \| | \   | "
echo "             /\____) )/  /    /\___/  /  \   /  /\___/  /| )  \  | "
echo "             \______/ \_/     \______/    \_/   \______/ |/    )_) "
                                                                  

until
        sys=$(cat /etc/redhat-release)
        if [ "$sys" == "" ]
        then
            red "[!]Can't detect System"
        else
            yellow "[*]Your System is "$sys
        fi
        green "Please Choose :"
        green "1.centos7 x86_64"
        green "2.ubuntu 1404"
        green "3.ubuntu 1604"
        green "4.ubuntu 1804"
        # echo "5.删除文件"
        green "0.exit"
        read input
        test $input = 0 #change this number to exit menu
        do
            case $input in
            1)green "[+]Start Installing...Do Not Break"
            rpm -ivh wget-x86_64.rpm
            cp /etc/yum.repos.d/CentOS-Base.repo /etc/yum.repos.d/CentOS-Base.repo.bak
            wget -O /etc/yum.repos.d/CentOS-Base.repo http://mirrors.aliyun.com/repo/Centos-7.repo
            wget -P /etc/yum.repos.d/ http://mirrors.aliyun.com/repo/epel-7.repo
            yum clean all
            yum update
            yum makecache;;

            2)green "[+]Start Installing...Do Not Break"
            mv /etc/apt/sources.list /etc/apt/sources.list_backup
            touch /etc/apt/sources.list
            cat>/etc/apt/sources.list<<EOF
#aliyun
deb http://mirrors.aliyun.com/ubuntu/ trusty main restricted universe multiverse
deb http://mirrors.aliyun.com/ubuntu/ trusty-security main restricted universe multiverse
deb http://mirrors.aliyun.com/ubuntu/ trusty-updates main restricted universe multiverse
deb http://mirrors.aliyun.com/ubuntu/ trusty-proposed main restricted universe multiverse
deb http://mirrors.aliyun.com/ubuntu/ trusty-backports main restricted universe multiverse
deb-src http://mirrors.aliyun.com/ubuntu/ trusty main restricted universe multiverse
deb-src http://mirrors.aliyun.com/ubuntu/ trusty-security main restricted universe multiverse
deb-src http://mirrors.aliyun.com/ubuntu/ trusty-updates main restricted universe multiverse
deb-src http://mirrors.aliyun.com/ubuntu/ trusty-proposed main restricted universe multiverse
deb-src http://mirrors.aliyun.com/ubuntu/ trusty-backports main restricted universe multiverse
EOF
                aptget update
;;
                
            3)green "[+]Start Installing...Do Not Break"
            mv /etc/apt/sources.list /etc/apt/sources.list_backup
            touch /etc/apt/sources.list
            cat>/etc/apt/sources.list<<EOF
#aliyun
deb-src http://archive.ubuntu.com/ubuntu xenial main restricted
deb http://mirrors.aliyun.com/ubuntu/ xenial main restricted
deb-src http://mirrors.aliyun.com/ubuntu/ xenial main restricted multiverse universe
deb http://mirrors.aliyun.com/ubuntu/ xenial-updates main restricted
deb-src http://mirrors.aliyun.com/ubuntu/ xenial-updates main restricted multiverse universe
deb http://mirrors.aliyun.com/ubuntu/ xenial universe
deb http://mirrors.aliyun.com/ubuntu/ xenial-updates universe
deb http://mirrors.aliyun.com/ubuntu/ xenial multiverse
deb http://mirrors.aliyun.com/ubuntu/ xenial-updates multiverse
deb http://mirrors.aliyun.com/ubuntu/ xenial-backports main restricted universe multiverse
deb-src http://mirrors.aliyun.com/ubuntu/ xenial-backports main restricted universe multiverse
deb http://archive.canonical.com/ubuntu xenial partner
deb-src http://archive.canonical.com/ubuntu xenial partner
deb http://mirrors.aliyun.com/ubuntu/ xenial-security main restricted
deb-src http://mirrors.aliyun.com/ubuntu/ xenial-security main restricted multiverse universe
deb http://mirrors.aliyun.com/ubuntu/ xenial-security universe
deb http://mirrors.aliyun.com/ubuntu/ xenial-security multiverse
EOF
            apt-get update
             ;;
             
            4)green "[+]Start Installing...Do Not Break"
            mv /etc/apt/sources.list /etc/apt/sources.list_backup
            touch /etc/apt/sources.list
            cat>/etc/apt/sources.list<<EOF
deb http://mirrors.aliyun.com/ubuntu/ bionic main restricted universe multiverse
deb http://mirrors.aliyun.com/ubuntu/ bionic-security main restricted universe multiverse
deb http://mirrors.aliyun.com/ubuntu/ bionic-updates main restricted universe multiverse
deb http://mirrors.aliyun.com/ubuntu/ bionic-proposed main restricted universe multiverse
deb http://mirrors.aliyun.com/ubuntu/ bionic-backports main restricted universe multiverse
deb-src http://mirrors.aliyun.com/ubuntu/ bionic main restricted universe multiverse
deb-src http://mirrors.aliyun.com/ubuntu/ bionic-security main restricted universe multiverse
deb-src http://mirrors.aliyun.com/ubuntu/ bionic-updates main restricted universe multiverse
deb-src http://mirrors.aliyun.com/ubuntu/ bionic-proposed main restricted universe multiverse
deb-src http://mirrors.aliyun.com/ubuntu/ bionic-backports main restricted universe multiverse
EOF
            apt-get update
;;

            0)echo "请输入选择（1-6）"
            esac
            done
        green "[+]All is done.Welcome"


