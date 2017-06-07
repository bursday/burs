#!/bin/sh
# this script will hopefully grab bspwm, all its deps, build it, build the 
# panel stuff, and copy relevant configs
# things to add:
# actual panel support
# ways to not break an existing install
# rofi support
# change term to xterm if it isnt?
# add rice to bspwm, boiling intensifies
# add some fucking logic for christs sake


gitit() {
	git clone https://github.com/baskerville/bspwm.git
	git clone https://github.com/baskerville/sxhkd.git
	git clone https://github.com/baskerville/xdo.git
	git clone https://github.com/baskerville/sutils.git
	git clone https://github.com/baskerville/xtitle.git
	git clone https://github.com/LemonBoy/bar.git
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
	cd xdo
		GB
	cd ..
	cd sutils
		GB
	cd ..
	cd xtitle
		GB
	cd ..
	cd bar
		GB
	cd ..
}

mkDirs() {
	mkdir -p ~/.config/bspwm
	mkdir -p ~/.config/sxhkd
}

copyConfigs() {
	cp bspwm/examples/bspwmrc ~/.config/bspwm
	chmod +x ~/.config/bspwm/bspwmrc
	cp bspwm/examples/sxhkdrc ~/.confing/sxhkd/sxhkdrc
}

main() {
	gitit
	depit
	GB #generic build
	buildAndInstallIt
	mkDirs
	copyConfigs
}

main ${*}
