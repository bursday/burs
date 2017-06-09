#!/bin/bash

ln -sf /usr/share/zoneinfo/America/Chicago /etc/localtime
hwclock --systohc
echo "en_US.UTF-8 UTF-8" > /etc/locale.gen
echo "LANG=en_US.UTF-8" > /etc/locale.conf
locale-gen
echo trump > /etc/hostname
echo "#<ip-address>	<hostname.domain.org>	<hostname>" >> /etc/hosts
echo "127.0.0.1	localhost.localdomain	localhost" >> /etc/hosts
echo "::1 localhost.localdomain	localhost" >> /etc/hosts
echo "127.0.0.1	trump.localdomain	trump" >> /etc/hosts

#bootloader
pacman -S --noconfirm grub
grub-install /dev/sdb
grub-mkconfig -o /boot/grub/grub.cfg

echo "#####################\n"
echo "##  umount -R /mnt  ###\n"
echo "######  reboot  #######\n"
echo "#####################\n"

pause

echo "press any key to continue"
#todo: add a joke...not that one...this requires a script running AFTER chroot. good luck.
#cant chroot again, because inception

#I'm out...
