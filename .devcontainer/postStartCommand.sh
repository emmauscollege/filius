# executed each time the container is (re)started
# commands should terminate, use nohup otherwise

# dirty fix not tested: wait 5 seconds to prevent filius to abort with an error that it cannot connect to DISPLAY :1
sleep 5

# set language of Filius
sudo sed -i 's/# locale=en_GB/locale=en_GB/' /etc/filius/filius.ini 

# link 'filius bestanden'
ln -sf '/workspaces/filius/filius bestanden' '/home/codespace/filius bestanden'

# start filius and leave it running in background
cd /workspaces/filius/.devcontainer
nohup bash -c 'filius > .nohup_filius.out 2>&1 & rm nohup.out &'

# wait for FILIUS window
while ! wmctrl -l| grep -q FILIUS ; do sleep 1; echo "wait for FILIUS window"; done

# maximize filius window
wmctrl -r 'FILIUS' -b add,maximized_horz,maximized_vert
