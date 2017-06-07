#!/bin/sh


#check network, set time
ping -c 3 archlinux.org
timedatectl set-ntp true
#todo: write algo to find disk size...using 128gb right now
#done...you are a complete moron...thats what the -1 is for


#create partitions
parted -s -a optimal /dev/sdb mklabel gpt
parted -s -a optimal /dev/sdb mkpart primary 1 3
parted -s -a optimal /dev/sdb name 1 grub
parted -s -a optimal /dev/sdb set 1 bios_grub on
parted -s -a optimal /dev/sdb mkpart primary 3 131
parted -s -a optimal /dev/sdb name 2 boot
parted -s -a optimal /dev/sdb mkpart primary 131 2179
parted -s -a optimal /dev/sdb name 3 swap
parted -s -a optimal /dev/sdb mkpart primary 2179 100%
parted -s -a optimal /dev/sdb name 4 rootfs
parted -s -a optimal /dev/sdb set 2 boot on


