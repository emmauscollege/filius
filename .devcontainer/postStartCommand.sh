# executed each time the container is (re)started
# commands should terminate, use nohup otherwise

# set java version to the latest installed
latest_java=$(sdk list java | awk '/installed/ {print $NF}'|sort -V|tail -n 1)
sdk default java $latest_java

# set language of Filius
sudo sed -i 's/# locale=en_GB/locale=en_GB/' /etc/filius/filius.ini

# link 'filius bestanden'
#ln -s '/workspace/filius/filius bestanden' '/home/gitpod/filius bestanden'
#sleep 2
#ln -s '/workspace/filius/filius bestanden' '/home/gitpod/Desktop/filius bestanden'

# create filius start icon on desktop
#cp /usr/share/applications/filius.desktop /home/gitpod/Desktop/
#chmod +x /home/gitpod/Desktop/filius.desktop

# start filius and leave it running in background
nohup bash -c 'filius > .nohup_filius.out 2>&1 & rm nohup.out &'

sleep 2
# maximize filius window
wmctrl -r 'FILIUS' -b add,maximized_horz,maximized_vert
# wmctrl -r ':ACTIVE:' -b add,full_screen // alternative