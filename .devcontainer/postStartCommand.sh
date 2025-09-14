#!/bin/bash
set -e
set -x

export DISPLAY=:1

# 1️⃣ Start XFCE desktop
startxfce4 &
while ! xset q >/dev/null 2>&1; do
    sleep 1
done
# 2️⃣ Start Filius
filius &