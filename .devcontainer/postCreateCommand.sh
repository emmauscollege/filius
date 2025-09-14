#!/bin/bash
set -e
set -x

# 1️⃣ Install Java 17
sudo apt-get update
sudo apt-get install -y openjdk-17-jdk
java -version

# 2️⃣ Install XFCE desktop
sudo apt-get install -y xfce4 xfce4-terminal

# 3️⃣ Install wmctrl & curl
sudo apt-get install -y wmctrl curl

# 4️⃣ Remove old Filius leftovers
sudo apt-get purge -y filius || true

# 5️⃣ Download & install Filius
curl -L -o /tmp/filius.deb https://www.lernsoftware-filius.de/downloads/Setup/filius_latest_all.deb
sudo apt-get install -y /tmp/filius.deb

# 6️⃣ Cleanup
sudo apt-get clean
sudo rm -rf /var/lib/apt/lists/*