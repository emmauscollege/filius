# executed each time the container is (re)started
# commands should terminate, use nohup otherwise

# set language of Filius
sudo sed -i 's/# locale=en_GB/locale=en_GB/' /etc/filius/filius.ini
echo $?     

# link 'filius bestanden'
ln -sf '/workspaces/filius/filius bestanden' '/home/codespace/filius bestanden'
echo $?
#sleep 2
#ln -s '/workspace/filius/filius bestanden' '/home/gitpod/Desktop/filius bestanden'

# create filius start icon on desktop
#cp /usr/share/applications/filius.desktop /home/gitpod/Desktop/
#chmod +x /home/gitpod/Desktop/filius.desktop

# start filius and leave it running in background
cd /workspaces/filius/.devcontainer
echo $?
nohup bash -c 'filius > .nohup_filius.out 2>&1 & rm nohup.out &'
echo $?

#show list of windows
wmctrl -l
echo $?
# wait for FILIUS window
while ! wmctrl | grep -q FILIUS ; do sleep 1; echo "wait for FILIUS window"; done
echo $?
#show list of windows
wmctrl -l
echo $?

# maximize filius window
wmctrl -r 'FILIUS' -b add,maximized_horz,maximized_vert
echo $?
# wmctrl -r ':ACTIVE:' -b add,full_screen // alternative