#!/bin/bash
export USER="root"

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

apt-get clean autoclean
apt-get autoremove --yes
#rm -rf /var/lib/{apt,cache,log}/
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
apt autoremove -y
apt update --fix-missing
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
clear
echo "clean "

apt-get clean autoclean
apt-get autoremove --yes

echo "Installing  firefox "


whoami

mkdir -p /root/EXTRAT/

mkdir /root/EXTRAT/firefox-53.0.2/
mkdir /root/EXTRAT/firefox-53.0b9/
mkdir /root/EXTRAT/firefox-57.0.1/
mkdir /root/EXTRAT/firefox-58.0.1/
mkdir /root/EXTRAT/firefox-59.0.1/
mkdir /root/EXTRAT/firefox-60.0.1esr/
mkdir /root/EXTRAT/firefox-61.0.1/
mkdir /root/EXTRAT/firefox-63.0.1/
#https://ftp.mozilla.org/pub/firefox/releases/53.0.2/linux-x86_64-EME-free/en-GB/firefox-53.0.2.tar.bz2
echo "Install Package -firefox-53.0b9.tar.bz2"
wget https://ftp.mozilla.org/pub/firefox/releases/53.0.2/linux-x86_64-EME-free/en-GB/firefox-53.0.2.tar.bz2 && tar -xf firefox-53.0.2.tar.bz2 -C /root/EXTRAT/firefox-53.0.2/
wget https://ftp.mozilla.org/pub/firefox/releases/53.0b9/linux-x86_64/en-US/firefox-53.0b9.tar.bz2 && tar -xf firefox-53.0b9.tar.bz2 -C /root/EXTRAT/firefox-53.0b9/
wget https://ftp.mozilla.org/pub/firefox/releases/57.0.1/linux-x86_64/en-GB/firefox-57.0.1.tar.bz2 && tar -xf firefox-57.0.1.tar.bz2 -C /root/EXTRAT/firefox-57.0.1/
wget https://ftp.mozilla.org/pub/firefox/releases/58.0.1/linux-x86_64/en-GB/firefox-58.0.1.tar.bz2 && tar -xf firefox-58.0.1.tar.bz2 -C /root/EXTRAT/firefox-58.0.1/
wget https://ftp.mozilla.org/pub/firefox/releases/59.0.1/linux-x86_64/en-GB/firefox-59.0.1.tar.bz2 && tar -xf firefox-59.0.1.tar.bz2 -C /root/EXTRAT/firefox-59.0.1/
wget https://ftp.mozilla.org/pub/firefox/releases/60.0.1esr/linux-x86_64/en-US/firefox-60.0.1esr.tar.bz2 && tar -xf firefox-60.0.1esr.tar.bz2 -C /root/EXTRAT/firefox-60.0.1esr/
wget https://ftp.mozilla.org/pub/firefox/releases/61.0.1/linux-x86_64/en-US/firefox-61.0.1.tar.bz2 && tar -xf firefox-61.0.1.tar.bz2 -C /root/EXTRAT/firefox-61.0.1/
wget https://ftp.mozilla.org/pub/firefox/releases/63.0.1/linux-x86_64/en-US/firefox-63.0.1.tar.bz2 && tar -xf firefox-63.0.1.tar.bz2 -C /root/EXTRAT/firefox-63.0.1/
rm *.tar.bz2


echo "Install Package -firefox-53.0b9.tar.bz2"
wget https://ftp.mozilla.org/pub/firefox/releases/53.0b9/linux-x86_64/en-US/firefox-53.0b9.tar.bz2 && tar -xf firefox-53.0b9.tar.bz2 -C /root/EXTRAT
echo "Install bash color"

#apt 
#rm -rf /var/lib/{apt,dpkg,cache,log}/

# echo "Installing  dbus-x11 xauth xinit x11-xserver-utils xdg-utils"
# #apt-get install -y dbus-x11 xauth xinit x11-xserver-utils xdg-utils--no-cache=true
# DEBIAN_FRONTEND=noninteractive apt-get install -y --fix-missing  supervisor
