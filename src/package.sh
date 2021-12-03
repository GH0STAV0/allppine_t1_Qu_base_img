#!/bin/bash

### every exit != 0 fails the script
set -e
#python3 --version
echo "Install Package - on  based ubuntu 20.04 LTS"
DEBIAN_FRONTEND=noninteractive apt-get remove python3
apt autoremove -y
apt update --fix-missing

DEBIAN_FRONTEND=noninteractive apt-get -f install  -y \
        jq \
        nano \
        psmisc \
        sudo \
        tini \
        software-properties-common python3 python3-dev \
        wget openssh-server locate nano 

# wget https://www.python.org/ftp/python/3.9.4/Python-3.9.4.tgz 
# tar xzf Python-3.9.4.tgz 
# cd Python-3.9.4 
# ./configure --enable-optimizations 
# make altinstall 
python3 --version
# cd ..

 # python3 python3-dev
# update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.9.4 2
# update-alternatives --config python3
echo "Installing ttf-wqy-zenhei"
apt-get install -y ttf-wqy-zenhei software-properties-common \

apt-get upgrade -y && apt-get install -y \
    xfwm4 xfce4-session xfce4-panel \
    xfce4-terminal xfce4-appfinder \
    xfce4-goodies xfce4-pulseaudio-plugin \
    xfce4-statusnotifier-plugin xfce4-whiskermenu-plugin \
    thunar tumbler xarchiver \
    mugshot thunar-archive-plugin
echo "Installing  xfce "
apt-get install -y  task-xfce-desktop dbus-x11 xauth xinit x11-xserver-utils xdg-utils \
        xfce4 tightvncserver novnc websockify \
        python3-numpy build-essential net-tools curl git \
        software-properties-common xfce4-terminal xvfb gedit screen 
        #uuid-runtime


# echo "Installing  dbus-x11 xauth xinit x11-xserver-utils xdg-utils"
# #apt-get install -y dbus-x11 xauth xinit x11-xserver-utils xdg-utils--no-cache=true
# DEBIAN_FRONTEND=noninteractive apt-get install -y --fix-missing  supervisor
