#!/bin/bash

systembeepoff() { 
    rmmod pcspkr
    echo "blacklist pcspkr" > /etc/modprobe.d/nobeep.conf ;}

updateinstallpkgs() {
    pacman -Syuu
    pacman -Syy vim \
		nextcloud-client \
		base-devel \
		xclip \
		xorg-xinput \
		spectacle \
                i3-gaps \
		dmenu \
		i3status \
		xterm \
		ttf-linux-libertine \
		sof-firmware \
                ttf-inconsolata \
		zathura \
		feh \
		xwallpaper \
		nmap \
		xcompmgr \
		alsa-utils ;}


updateinstallpkgs
systembeepoff
