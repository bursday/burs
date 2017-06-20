#!/bin/sh
# this script will hopefully grab bspwm, all its deps, build it, build the 
# panel stuff, and copy relevant configs
# things to add:
# ways to not break an existing install

gitit() {
	git clone https://github.com/bursday/bspwm.git
	git clone https://github.com/bursday/sxhkd.git
}

depit() {
	sudo pacman -S libxcb xcb-util xcb-util-keysyms xcb-util-wm
}

GB() {
	make
	sudo make install
}

buildAndInstallIt() {
	cd bspwm
		GB
	cd ..
	cd sxhkd
		GB
	cd ..
}

mkDirs() {
	mkdir -p ~/.config/bspwm
	mkdir -p ~/.config/sxhkd
}

copyConfigs() {
	wget https://raw.githubusercontent.com/bursday/burs/master/.config/bspwm/bspwmrc
	bspwmrc ~/.config/bspwm
	chmod +x ~/.config/bspwm/bspwmrc
	wget https://raw.githubusercontent.com/bursday/burs/master/.config/sxhkd/sxhkdrc
	sxhkdrc ~/.config/sxhkd/sxhkdrc
}

echoinitrc() {
	echo "xrdb merge ./.Xresources &"
	echo "compton --config .compton.conf &"
	echo "sxhkd &"
	echo "exec bspwm"
}

main() {
	gitit
	depit
	buildAndInstallIt
	mkDirs
	copyConfigs
	echoinitrc
}

main ${*}
