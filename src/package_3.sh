#!/bin/bash

### every exit != 0 fails the script
git clone https://github.com/GH0STAV0/SDA_ALL.git
cp /root/install_add/geckodriver22 /usr/bin/
export NO_VNC_HOME=/usr/share/novnc
rm /headless/*.bz2*

git clone https://github.com/GH0STAV0/ALL_HCL.git
service tor restart

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
clear
df
echo "Install bash color"