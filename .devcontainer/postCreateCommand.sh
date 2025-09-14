#!/bin/bash
# executed once after container has been built, before it is started
set -e

sudo apt-get update
sudo apt-get install -y wmctrl curl

#sudo apt-get purge -y filius || true

# download and install filius
curl -L -o /tmp/filius.deb https://www.lernsoftware-filius.de/downloads/Setup/filius_latest_all.deb
sudo apt-get install -y /tmp/filius.deb

# clean cache
sudo apt-get clean
sudo rm -rf /var/lib/apt/lists/*

# copy noVNC index.html
WORKSPACE_DIR="$(pwd)"
sudo cp -f "$WORKSPACE_DIR/.devcontainer/noVNC-1.2.0_index.html" /usr/local/novnc/noVNC-1.2.0/index.html || true
