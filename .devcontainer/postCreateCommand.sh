# executed once after container had been build, before it is started

# install packages
sudo apt-get update
yes y | sudo apt install default-jre
yes y | sudo apt install wmctrl

# download and install filius
cd /tmp
curl -o filius.deb https://www.lernsoftware-filius.de/downloads/Setup/filius_latest_all.deb
sudo dpkg -i filius.deb

# configure novnc
sudo sh -c 'cat << EOF > /usr/local/novnc/noVNC-1.2.0/index.html\n<!DOCTYPE html>\n<html><head><meta http-equiv=\"refresh\" content=\"0; url=/vnc.html?autoconnect=true&password=game&resize=scale\" /></head><body><p>In 0 seconds you will be redirected to /vnc.html?autoconnect=true&password=game&resize=scale</p></body></html>\nEOF'"