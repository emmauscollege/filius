# executed once after container had been build, before it is started

# install packages
sudo apt-get update
yes y | sudo apt install wmctrl

# download and install filius
cd /tmp
curl -o filius.deb https://www.lernsoftware-filius.de/downloads/Setup/filius_latest_all.deb
sudo dpkg -i filius.deb

# configure novnc
sudo cp -f /workspaces/filius/.devcontainer/noVNC-1.2.0_index.html /usr/local/novnc/noVNC-1.2.0/index.html
