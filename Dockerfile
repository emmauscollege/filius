FROM gitpod/workspace-full-vnc

RUN sudo apt-get update
RUN yes y | sudo apt install default-jre

WORKDIR /tmp

RUN curl -o filius.deb https://www.lernsoftware-filius.de/downloads/Setup/filius_1.13.2_all.deb
RUN sudo dpkg -i filius.deb
