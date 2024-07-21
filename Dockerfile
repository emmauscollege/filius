FROM gitpod/workspace-full-vnc

RUN sudo apt-get update
# gitpod workspace-full-vnc uses ubuntu 22.04 and java version 11 (why? 17 is recommended for ubuntu 22.04)
# install latest recommended java versions
# we will select this version as the one to be used later
RUN yes y | sudo apt install default-jre
RUN yes y | sudo apt install wmctrl

WORKDIR /tmp

RUN curl -o filius.deb https://www.lernsoftware-filius.de/downloads/Setup/filius_latest_all.deb
#RUN curl -o filius.deb https://www.lernsoftware-filius.de/downloads/Setup/filius_2.4.1_all.deb
RUN sudo dpkg -i filius.deb
