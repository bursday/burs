#/bin/bash

echo 'VIDEO_CARDS="nvidia"' >> /etc/portage/make.conf
useradd -m -G wheel,audio -s /bin/bash bill
gpasswd -a bill video

