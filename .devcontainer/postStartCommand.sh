#!/bin/bash
# executed each time the container is (re)started
# commands should terminate, use nohup otherwise

set -e  # stop bij fouten

# dirty fix: wait a bit so DISPLAY is ready
sleep 5

# set language of Filius
sudo sed -i 's/# locale=en_GB/locale=en_GB/' /etc/filius/filius.ini 

# link 'filius bestanden' from workspace into home directory
WORKSPACE_DIR="$(pwd)"
ln -sf "$WORKSPACE_DIR/filius bestanden" "$HOME/filius bestanden"

# start filius and leave it running in background
cd "$WORKSPACE_DIR/.devcontainer"
nohup bash -c 'filius > .nohup_filius.out 2>&1 & rm -f nohup.out &' 

# wait for FILIUS window
while ! wmctrl -l | grep -q FILIUS ; do
  sleep 1
  echo "wait for FILIUS window"
done

# maximize filius window
wmctrl -r 'FILIUS' -b add,maximized_horz,maximized_vert
