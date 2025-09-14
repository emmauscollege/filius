#!/bin/bash
set -e
set -x

export DISPLAY=:1

# 1️⃣ Start XFCE desktop
startxfce4 &

# 2️⃣ Start Filius
filius &