
FROM debian:bullseye

ENV container docker
ENV LC_ALL C
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update \
    && apt-get install -y systemd systemd-sysv \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN rm -f /lib/systemd/system/multi-user.target.wants/* \
    /etc/systemd/system/*.wants/* \
    /lib/systemd/system/local-fs.target.wants/* \
    /lib/systemd/system/sockets.target.wants/*udev* \
    /lib/systemd/system/sockets.target.wants/*initctl* \
    /lib/systemd/system/sysinit.target.wants/systemd-tmpfiles-setup* \
    /lib/systemd/system/systemd-update-utmp*


RUN mkdir /root/VPN
ADD ./VPN/ /root/VPN/

RUN apt-get update
ENV _IMG_USERNAME=headless _IMG_PASSWORD=admin

ENV DISPLAY=:1 \
    VNC_PORT=5901 \
    NO_VNC_PORT=6080 \
    SSH_PORT=22 \
    SUPER_VISOR__PORT=9001 \
    DEBIAN_FRONTEND=noninteractive
###########################################################################
ENV HOME=/root \
    TERM=xterm \
    STARTUPDIR=/dockerstartup \
    INST_SCRIPTS=/root/install \
    ADD_SCRIPTS=/root/install_add \
    NO_VNC_HOME=/usr/share/novnc \
    DEBIAN_FRONTEND=noninteractive \
    VNC_COL_DEPTH=24 \
    VNC_RESOLUTION=1360x768 \
    VNC_PW=vncpassword \
    VNC_VIEW_ONLY=false
### Envrionment config


###########################################################################
RUN apt autoremove -y
RUN apt update --fix-missing
RUN apt-get -f install  -y \
        jq \
        nano \
        psmisc \
        sudo \
        tini cron \
        software-properties-common python3 python3-dev python3-numpy \
        openvpn autocutsel  python3-pip python3.9-tk python3.9-dev  pwgen  \
        wget openssh-server locate nano gedit screen  net-tools curl git tor \
        xfce4-goodies xfce4\
        thunar tumbler xarchiver \
        mugshot thunar-archive-plugin \
        dbus-x11 xauth xinit x11-xserver-utils xdg-utils \
        tightvncserver novnc python3-websockify python3-pyvirtualdisplay \
        build-essential \
        xvfb xserver-xephyr ttf-wqy-zenhei python2.7

RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add -
RUN echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list
RUN apt-get update && apt-get install google-chrome-stable -y


RUN pip3 install selenium==4.0.0.a1 pymysql pyvirtualdisplay faker-e164 Faker PySocks stem  bs4   ConfigParser lxml  speechrecognition requests \
 pyvirtualdisplay pydub pyautogui emojis emoji  \
 mysql-connector-python device_detector selenium-stealth

################################## ADD FILES ##################################

ADD ./bidoon/ $ADD_SCRIPTS/
ADD ./src/ $INST_SCRIPTS/
ADD ./addon/ $INST_SCRIPTS/
RUN find $INST_SCRIPTS -name '*.sh' -exec chmod a+x {} +
################## Envrionment config ##########################################
WORKDIR $HOME
RUN $INST_SCRIPTS/package.sh
RUN $INST_SCRIPTS/package_2.sh
# RUN $INST_SCRIPTS/package_3.sh
ADD ./etc/ /etc/
#######################  SSH ###########################################
RUN mkdir -p ~/.ssh
RUN rm /etc/ssh/sshd_config
RUN cp $INST_SCRIPTS/sshd_config /etc/ssh/
###########################################################################

RUN useradd -rm -d /home/ubuntu -s /bin/bash -g root -G sudo -u 1000 test 

RUN  echo 'test:test' | chpasswd

RUN service ssh start

############################ ADD ROOT PASSWORD ###########################
RUN ssh-keygen -q -t rsa -N '' -f /id_rsa

RUN echo "root:1" | /usr/sbin/chpasswd


RUN addgroup headless
RUN useradd -m -s /bin/bash -g root headless
RUN echo "headless:1" | /usr/sbin/chpasswd
RUN echo "headless    ALL=(ALL) ALL" >> /etc/sudoers


#########################################################################




RUN echo  \
"<!DOCTYPE html>\n" \
"<html>\n" \
"    <head>\n" \
"        <title>noVNC</title>\n" \
"        <meta charset=\"utf-8\"/>\n" \
"    </head>\n" \
"    <body>\n" \
"        <p><a href=\"vnc_lite.html\">noVNC Lite Client</a></p>\n" \
"        <p><a href=\"vnc.html\">noVNC Full Client</a></p>\n" \
"    </body>\n" \
"</html>" \
> "${NO_VNC_HOME}"/index.html
RUN cp $INST_SCRIPTS/novnc.pem "${NO_VNC_HOME}"/

RUN cp $INST_SCRIPTS/vncserver@.service /etc/systemd/system/vncserver@.service

#################################################################################
COPY ./src/xfce-startup "${STARTUPDIR}"/
COPY ./xfce/src/home/config /root/.config/
COPY ./xfce/src/home/Desktop /root/Desktop/
COPY ./xfce/src/home/readme*.md "${HOME}"/
RUN chmod 755 -R "${STARTUPDIR}" \
    && "${STARTUPDIR}"/set_user_permissions.sh "${STARTUPDIR}" "${HOME}"
#RUN /root/install/tun_setup.sh

RUN echo "Installing  firefox "
RUN echo "Install Package -firefox-53.0b9.tar.bz2"

RUN mkdir -p /root/EXTRAT/
RUN mkdir /root/EXTRAT/firefox-49.0b9/
RUN mkdir /root/EXTRAT/firefox-53.0.2/
RUN mkdir /root/EXTRAT/firefox-53.0b9/
RUN mkdir /root/EXTRAT/firefox-57.0.1/
RUN mkdir /root/EXTRAT/firefox-58.0.1/
RUN mkdir /root/EXTRAT/firefox-59.0.1/
RUN mkdir /root/EXTRAT/firefox-60.0.1esr/
RUN mkdir /root/EXTRAT/firefox-61.0.1/
RUN mkdir /root/EXTRAT/firefox-63.0.1/
RUN mkdir /root/EXTRAT/firefox-97.0.1/



RUN wget -q https://ftp.mozilla.org/pub/firefox/releases/53.0.2/linux-x86_64-EME-free/en-GB/firefox-53.0.2.tar.bz2 && tar -xf firefox-53.0.2.tar.bz2 -C /root/EXTRAT/firefox-53.0.2/
RUN wget -q https://ftp.mozilla.org/pub/firefox/releases/53.0b9/linux-x86_64/en-US/firefox-53.0b9.tar.bz2 && tar -xf firefox-53.0b9.tar.bz2 -C /root/EXTRAT/firefox-53.0b9/
RUN wget -q https://ftp.mozilla.org/pub/firefox/releases/57.0.1/linux-x86_64/en-GB/firefox-57.0.1.tar.bz2 && tar -xf firefox-57.0.1.tar.bz2 -C /root/EXTRAT/firefox-57.0.1/
RUN wget -q https://ftp.mozilla.org/pub/firefox/releases/58.0.1/linux-x86_64/en-GB/firefox-58.0.1.tar.bz2 && tar -xf firefox-58.0.1.tar.bz2 -C /root/EXTRAT/firefox-58.0.1/
RUN wget -q https://ftp.mozilla.org/pub/firefox/releases/59.0.1/linux-x86_64/en-GB/firefox-59.0.1.tar.bz2 && tar -xf firefox-59.0.1.tar.bz2 -C /root/EXTRAT/firefox-59.0.1/
RUN wget -q https://ftp.mozilla.org/pub/firefox/releases/60.0.1esr/linux-x86_64/en-US/firefox-60.0.1esr.tar.bz2 && tar -xf firefox-60.0.1esr.tar.bz2 -C /root/EXTRAT/firefox-60.0.1esr/
RUN wget -q https://ftp.mozilla.org/pub/firefox/releases/61.0.1/linux-x86_64/en-US/firefox-61.0.1.tar.bz2 && tar -xf firefox-61.0.1.tar.bz2 -C /root/EXTRAT/firefox-61.0.1/
RUN wget -q https://ftp.mozilla.org/pub/firefox/releases/63.0.1/linux-x86_64/en-US/firefox-63.0.1.tar.bz2 && tar -xf firefox-63.0.1.tar.bz2 -C /root/EXTRAT/firefox-63.0.1/
RUN wget -q https://ftp.mozilla.org/pub/firefox/releases/53.0b9/linux-x86_64/en-US/firefox-53.0b9.tar.bz2 && tar -xf firefox-53.0b9.tar.bz2 -C /root/EXTRAT

RUN wget -q https://ftp.mozilla.org/pub/firefox/releases/97.0.1/linux-x86_64/en-US/firefox-97.0.1.tar.bz2 && tar -xf firefox-97.0.1.tar.bz2 -C /root/EXTRAT




RUN $INST_SCRIPTS/package_3.sh
#####################################
EXPOSE $VNC_PORT $NO_VNC_PORT 
#$SSH_PORT $SUPER_VISOR__PORT






# RUN /dockerstartup/startup.sh



CMD ["/lib/systemd/systemd"]





# RUN apt autoremove -y
# RUN apt update --fix-missing
# RUN apt-get -f install  -y \
#         jq \
#         nano \
#         psmisc \
#         sudo \
#         tini \
#         software-properties-common python3 python3-dev python3-numpy \
#         openvpn autocutsel  python3-pip python3.9-tk python3.9-dev  pwgen  \
#         wget openssh-server locate nano gedit screen  net-tools curl git tor \
#         xfwm4 xfce4-session xfce4-panel \
#         xfce4-terminal xfce4-appfinder \
#         xfce4-goodies xfce4-pulseaudio-plugin \
#         xfce4-statusnotifier-plugin xfce4-whiskermenu-plugin \
#         thunar tumbler xarchiver \
#         mugshot thunar-archive-plugin \
#         task-xfce-desktop dbus-x11 xauth xinit x11-xserver-utils xdg-utils \
#         xfce4 tightvncserver novnc websockify \
#         build-essential \
#         xvfb ttf-wqy-zenhei python2.7