#!/bin/bash
set -e
set -x

# 1️⃣ Install Java 17 non-interactive
sudo apt-get update
sudo DEBIAN_FRONTEND=noninteractive apt-get install -y openjdk-17-jdk
java -version

# 2️⃣ Install XFCE desktop non-interactive
sudo DEBIAN_FRONTEND=noninteractive apt-get install -y xfce4 xfce4-terminal

# 3️⃣ Install wmctrl & curl non-interactive
sudo DEBIAN_FRONTEND=noninteractive apt-get install -y wmctrl curl

# 4️⃣ Remove old Filius leftovers
sudo DEBIAN_FRONTEND=noninteractive apt-get purge -y filius || true

# 5️⃣ Download & install Filius non-interactive
curl -L -o /tmp/filius.deb https://www.lernsoftware-filius.de/downloads/Setup/filius_latest_all.deb
sudo DEBIAN_FRONTEND=noninteractive apt-get install -y /tmp/filius.deb

# 6️⃣ Cleanup
sudo apt-get clean
sudo rm -rf /var/lib/apt/lists/*

# 7️⃣ Copy Filius autostart file from repo
mkdir -p ~/.config/autostart
cp .devcontainer/autostart/filius.desktop ~/.config/autostart/

# --- Automatische herstart na eerste build ---
if [ ! -f /tmp/.restart-needed ]; then
    touch /tmp/.restart-needed
    echo "🔁 Eerste build voltooid. Container wordt nu opnieuw gestart..."
    kill 1
fi