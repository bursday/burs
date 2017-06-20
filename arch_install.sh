#!/bin/sh

safet_firs() {
	curl -O https://raw.githubusercontent.com/bursday/burs/master/iptables.sh
	source iptables.sh
	iptables -nvL
}

checknet() {
	#check network, set time
	ping -c 3 archlinux.org
	timedatectl set-ntp true
	#todo: write algo to find disk size...using 128gb right now
	#done...you are a complete moron...thats what the -1 is for
}

mkparts() {
	#create partitions
	lsblk
	echo "Please enter most honorable block device name for skrip to think wit\n"
	echo "for example: /dev/sdx"
	read thething
	parted -s -a optimal ${thething} mklabel gpt
	parted -s -a optimal ${thething} mkpart primary 1 3
	parted -s -a optimal /dev/sdb name 1 grub
	parted -s -a optimal /dev/sdb set 1 bios_grub on
	parted -s -a optimal /dev/sdb mkpart primary 3 131
	parted -s -a optimal /dev/sdb name 2 boot
	parted -s -a optimal /dev/sdb mkpart primary 131 2179
	parted -s -a optimal /dev/sdb name 3 swap
	parted -s -a optimal /dev/sdb mkpart primary 2179 100%
	parted -s -a optimal /dev/sdb name 4 rootfs
	parted -s -a optimal /dev/sdb set 2 boot on
}

mkfses() {
	#make file systems!
	mkfs.ext2 /dev/sdb2
	mkfs.ext4 /dev/sdb4
}

mount_parts() {
	#mount partitions
	mount /dev/sdb4 /mnt
	mkdir /mnt/boot
	mount /dev/sdb2 /mnt/boot
}

#Edit Mirrors

install_bases() {
	pacstrap /mnt base base-devel
}

tabulate() {
	genfstab -U /mnt >> /mnt/etc/fstab
}

git_files() {
	wget https://raw.githubusercontent.com/bursday/burs/master/chroot.sh
	cp chroot.sh /mnt
}

instructs() {
	echo "#######################################\n"
	echo "###enter: arch-chroot /bin/bash########\n"
	echo "###chmod +x chroot.sh && ./chroot.sh###\n"
	echo "#######################################\n"
}

main() {
	safet_firs
	checkNet
	mkparts
	mkfses
	mount_parts
	install_bases
	tabulate
	git_files
	instructs
}

main ${*}
