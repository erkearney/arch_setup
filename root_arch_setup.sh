#!/bin/bash

systembeepoff() { 
    rmmod pcspkr
    echo "blacklist pcspkr" > /etc/modprobe.d/nobeep.conf ;}

updateinstallpkgs() {
    pacman-mirrors --fasttrack
    pacman -Syuu
    pacman -Syy vim \
		base-devel \
		nmap \
		xclip \
		xorg-xinput \
		xterm \
		xcompmgr \
		xwallpaper \
		ttf-linux-libertine \
                ttf-inconsolata \
                i3-gaps \
		i3status \
		dmenu \
		zathura \
		feh \
		spectacle \
		nextcloud-client ;}


configuredellvostro7590() {
    pacman -Syy sof-firmware \
		alsa-utils \
		thermald \
		tlp 

    systemctl start thermald.service
    systemctl enable thermald.service 
    systemctl start tlp.service
    systemctl enable tlp.service ;}


systembeepoff
updateinstallpkgs
configuredellvostro7590
