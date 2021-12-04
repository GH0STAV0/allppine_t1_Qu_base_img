#!/bin/bash
export USER="root"

### every exit != 0 fails the script
set -e




echo "export PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '" >> /root/.bashrc

echo "nameserver 8.8.8.8" > /etc/resolv.conf
echo "nameserver 8.8.4.4" >> /etc/resolv.conf
#RUN echo - "ControlPort 9051\nHashedControlPassword 16:A72E5A7AE45381ED60125365E2AA85E09B56ACAEE6B6536D8DF63A2B01\nCookieAuthentication 1\nRunAsDaemon 1" >> /etc/tor/torrc


#python3 --version
echo "Install Package - on  based ubuntu 20.04 LTS"
# DEBIAN_FRONTEND=noninteractive apt-get remove python3
# apt autoremove -y
# apt update --fix-missing

# DEBIAN_FRONTEND=noninteractive 

#rm -rf /var/lib/{apt,cache,log}/
# wget https://www.python.org/ftp/python/3.9.4/Python-3.9.4.tgz 
# tar xzf Python-3.9.4.tgz 
# cd Python-3.9.4 
# ./configure --enable-optimizations 
# make altinstall 
clear
python3 --version
echo "Installing ttf-wqy-zenhei"
# cd ..
# apt-get update
# DEBIAN_FRONTEND=noninteractive apt-get install -y --fix-missing  supervisor pwgen openvpn autocutsel xfwm4 python3-pip python3.9-tk python3.9-dev tor

 # python3 python3-dev
# update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.9.4 2
# update-alternatives --config python3
# apt autoremove -y
# apt update --fix-missing
# echo "Installing ttf-wqy-zenhei"


# apt-get upgrade -y && apt-get install -y \
#     xfwm4 xfce4-session xfce4-panel \
#     xfce4-terminal xfce4-appfinder \
#     xfce4-goodies xfce4-pulseaudio-plugin \
#     xfce4-statusnotifier-plugin xfce4-whiskermenu-plugin \
#     thunar tumbler xarchiver \
#     mugshot thunar-archive-plugin
echo "Installing  xfce "

        #uuid-runtime



#apt 
#rm -rf /var/lib/{apt,dpkg,cache,log}/

# echo "Installing  dbus-x11 xauth xinit x11-xserver-utils xdg-utils"
# #apt-get install -y dbus-x11 xauth xinit x11-xserver-utils xdg-utils--no-cache=true
# DEBIAN_FRONTEND=noninteractive apt-get install -y --fix-missing  supervisor

