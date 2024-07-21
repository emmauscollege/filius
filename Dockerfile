FROM gitpod/workspace-full-vnc

RUN sudo apt-get update
RUN yes y | sudo apt install openjdk-17-jdk openjdk-17-jre

WORKDIR /tmp

RUN curl -o filius.deb https://www.lernsoftware-filius.de/downloads/Setup/filius_2.5.1_all.deb
RUN sudo dpkg -i filius.deb
