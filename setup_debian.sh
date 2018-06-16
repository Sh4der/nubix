# debian-setup script
# install linux kernel and some required packages
#
# this Script is part of nubix-toolchain Version 1
# author: Jan-Frederic Kurzweil
# version: 0.1.1
# license: GNU/GPL V2

#!/bin/sh


echo "nubix-live" > /etc/hostname
apt update
apt install -y --no-install-recommends linux-image-686 live-boot systemd-sysv
apt install -y --no-install-recommends  network-manager net-tools wireless-tools wpagui curl openssh-client xserver-xorg-core xserver-xorg xinit xterm nano
apt clean

exit 0