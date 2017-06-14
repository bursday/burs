#!/bin/sh
# this script will hopefully grab bspwm, all its deps, build it, build the 
# panel stuff, and copy relevant configs
# things to add:
# ways to not break an existing install


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
	wget https://raw.githubusercontent.com/bursday/burs/master/.config/bspwm/bspwmrc
	bspwmrc ~/.config/bspwm
	chmod +x ~/.config/bspwm/bspwmrc
	wget https://raw.githubusercontent.com/bursday/burs/master/.config/sxhkd/sxhkdrc
	sxhkdrc ~/.config/sxhkd/sxhkdrc
}

echoinitrc() {
	echo "export PANEL_FIFO=\"/tmp/panel-fifo\""
	echo "xrdb merge ./.Xresources &"
	echo "compton --config .compton.conf &"
	echo "sxhkd &"
	echo "exec bspwm"
}

setup_panel () {
	mkdir -p /home/`whoami`/bin
	echo "export PATH=$PATH:/home/`whoami`/bin" >> /home/`whoami`/.zshrc
	cd /bspwm/examples/panel/
	cp panel panel_colors panel_bar /home/`whoami`/bin
	cd ../../..
}

main() {
	gitit
	depit
	buildAndInstallIt
	mkDirs
	copyConfigs
	echoinitrc
	setup_panel
}

main ${*}
