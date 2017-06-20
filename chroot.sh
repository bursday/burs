#!/bin/bash

echo "Please enter your timezone frome /usr/share/zoneinfo/foo/bar\n"
echo "Enter it in the form of 'foo/bar'\n"
read ZONE
echo "Thank you. Such appreciate."

ln -sf /usr/share/zoneinfo/${ZONE} /etc/localtime
hwclock --systohc
echo "en_US.UTF-8 UTF-8" > /etc/locale.gen
echo "LANG=en_US.UTF-8" > /etc/locale.conf
locale-gen
echo "Please enter the name of the most honorable host san, kindly."
read usersan
echo $usersan > /etc/hostname
echo "#<ip-address>	<hostname.domain.org>	<hostname>" >> /etc/hosts
echo "127.0.0.1	localhost.localdomain	localhost" >> /etc/hosts
echo "::1 localhost.localdomain	localhost" >> /etc/hosts
echo "127.0.0.1	$usersan.localdomain	$usersan" >> /etc/hosts

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
