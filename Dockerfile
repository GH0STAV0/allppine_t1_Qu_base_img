
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

RUN apt-get update

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

RUN mkdir /root/VPN
ADD ./VPN/ /root/VPN/

###########################################################################
################################## ADD FILES ##################################
ADD ./bidoon/ $ADD_SCRIPTS/
ADD ./src/ $INST_SCRIPTS/
ADD ./addon/ $INST_SCRIPTS/
RUN find $INST_SCRIPTS -name '*.sh' -exec chmod a+x {} +
################## Envrionment config ##########################################
WORKDIR $HOME
RUN $INST_SCRIPTS/package.sh
RUN $INST_SCRIPTS/package_2.sh
RUN $INST_SCRIPTS/package_3.sh
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
#################################################################################
COPY ./src/xfce-startup "${STARTUPDIR}"/
COPY ./xfce/src/home/config /root/.config/
COPY ./xfce/src/home/Desktop /root/Desktop/
COPY ./xfce/src/home/readme*.md "${HOME}"/
RUN chmod 755 -R "${STARTUPDIR}" \
    && "${STARTUPDIR}"/set_user_permissions.sh "${STARTUPDIR}" "${HOME}"
RUN /root/install/tun_setup.sh
#####################################
EXPOSE $VNC_PORT $NO_VNC_PORT $SSH_PORT $SUPER_VISOR__PORT






RUN /dockerstartup/startup.sh



CMD ["/lib/systemd/systemd"]





