#!/bin/bash

#this thing installs yaourt from the AUR

get() {
	wget https://aur.archlinux.org/cgit/aur.git/snapshot/package-query.tar.gz
	wget https://aur.archlinux.org/cgit/aur.git/snapshot/yaourt.tar.gz
}

extract() {
	tar -zxvf yaourt.tar.gz
	tar -zxvf package-query.tar.gz
}

buildnstall() {
	cd package-query
	makepkg -si
	cd ..
	cd yaourt
	makepkg -si
	cd ..
	echo 'alias yort="yaourt -S "' >> ~/.zshrc
	echo "Ye'ourt has bean installd.\n"
}

optionstall() {
	OPTIONSTALL=""
	echo "If you are feeling sassy, you may now enter a list of AUR (or not) programs and we will attempt to install.\
		 press ctrl+c to quit. ofc"
	read OPTIONSTALL
	yaourt -S $OPTIONSTALL
}
main() {
	get
	extract
	buildnstall
	optionstall
}

main ${*}
