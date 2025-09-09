#!/bin/bash
# executed once after container has been built, before it is started

set -e

# install packages
sudo apt-get update
yes y | sudo apt-get install wmctrl

# download and install filius
cd /tmp
curl -L -o filius.deb https://www.lernsoftware-filius.de/downloads/Setup/filius_latest_all.deb
sudo dpkg -i filius.deb || sudo apt-get -f install -y

# configure novnc (relative to workspace root)
WORKSPACE_DIR="$(pwd)"
sudo cp -f "$WORKSPACE_DIR/.devcontainer/noVNC-1.2.0_index.html" /usr/local/novnc/noVNC-1.2.0/index.html
