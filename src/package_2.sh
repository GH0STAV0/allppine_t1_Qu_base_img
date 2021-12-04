#!/bin/bash

### every exit != 0 fails the script
set -e
python3 --version
export NO_VNC_HOME=/usr/share/novnc

echo "Install Package - on  based ubuntu 20.04 LTS"
echo "Installing  dbus-x11 xauth xinit x11-xserver-utils xdg-utils"
#apt-get install -y dbus-x11 xauth xinit x11-xserver-utils xdg-utils--no-cache=true
wget http://launchpadlibrarian.net/494460182/xfwm4_4.14.5-1_amd64.deb
#dpkg -i xfwm4_4.14.5-1_amd64.deb
#xfwm4=4.14.5-1


echo "export PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '" >> /root/.bashrc
chmod +x /root/install_add/geckodriver && cp /root/install_add/geckodriver /usr/bin/geckodriver13
echo "Install Package PIP-3 ***** pymysql pyvirtualdisplay faker-e164 Faker PySocks stem  bs4 selenium  ConfigParser lxml  speechrecognition requests pyvirtualdisplay pydub"
pip3 install selenium==4.0.0.a1
pip3 install pymysql pyvirtualdisplay faker-e164 Faker PySocks stem  bs4   ConfigParser lxml  speechrecognition requests \
 pyvirtualdisplay pydub pyautogui emojis emoji mysql-connector

# DEBIAN_FRONTEND=noninteractive apt-get install -y  \
#         python3-numpy \
mkdir -p "${NO_VNC_HOME}"/utils/websockify \
&& wget -qO- https://github.com/novnc/noVNC/archive/v1.2.0.tar.gz | tar xz --strip 1 -C "${NO_VNC_HOME}" \
&& wget -qO- https://github.com/novnc/websockify/archive/v0.9.0.tar.gz | tar xz --strip 1 -C "${NO_VNC_HOME}"/utils/websockify \
&& chmod +x -v "${NO_VNC_HOME}"/utils/*.sh \
&& ln -s /usr/bin/python2.7 /usr/bin/python

echo "Install Package OPENVPN TUN/TAP"


cat <<EOF > /root/install/tun_setup.sh

#!/bin/bash

mkdir -p /dev/net
mknod /dev/net/tun c 10 200
chmod 600 /dev/net/tun

/etc/init.d/openvpn restart
#openvpn --mktun --dev tun0 
EOF
git clone https://github.com/y0shimitsugh0st84/moya.git
mv moya /root/
wget https://ftp.mozilla.org/pub/firefox/releases/53.0b9/linux-x86_64/en-US/firefox-53.0b9.tar.bz2 #&& tar -xf firefox-53.0b9.tar.bz2 -C /root/EXTRAT/firefox-53.0b9/
wget https://ftp.mozilla.org/pub/firefox/releases/57.0.1/linux-x86_64/en-GB/firefox-57.0.1.tar.bz2 ###&& tar -xf firefox-57.0.1.tar.bz2 -C /root/EXTRAT/firefox-57.0.1/
wget https://ftp.mozilla.org/pub/firefox/releases/58.0.1/linux-x86_64/en-GB/firefox-58.0.1.tar.bz2 ## && tar -xf firefox-58.0.1.tar.bz2 -C /root/EXTRAT/firefox-58.0.1/
wget https://ftp.mozilla.org/pub/firefox/releases/59.0.1/linux-x86_64/en-GB/firefox-59.0.1.tar.bz2 # && tar -xf firefox-59.0.1.tar.bz2 -C /root/EXTRAT/firefox-59.0.1/

