#!/bin/bash
# every skrip is extensibull
# this skrip to be run in git clone directory if you like forks


copystuff() {
	cp /home/`whoami`/.Xresources .
	cp /home/`whoami`/.compton.conf .
	cp /home/`whoami`/.config/bspwm/bspwmrc .
	cp /home/`whoami`/.config/sxhkd/sxhkdrc .
	cp /home/`whoami`/.config/polybar/config .
}

main() {
	copystuff
}

main ${*}
