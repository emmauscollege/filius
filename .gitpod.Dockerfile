FROM gitpod/workspace-full-vnc

RUN apt-get update
RUN yes y | sudo apt install default-jre
RUN curl -o /tmp/filius.deb https://www.lernsoftware-filius.de/downloads/Setup/filius_1.13.2_all.deb
RUN dpkg -i /tmp/filius.deb
RUN ln -s /usr/share/filius/filius.jar '/home/gitpod/Desktop/Filius openen'
