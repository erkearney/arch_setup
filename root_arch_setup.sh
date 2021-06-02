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
		qtile \
		dmenu \
		spectacle \
		nextcloud-client \
		openvpn ;}


configuredellvostro7590() {
    pacman -Syy sof-firmware \
		alsa-utils \
		thermald \
		tlp \
		xorg-xbacklight \
		mesa

    echo '#Disable suspend on laptop lid close

    HandleLidSwitch=ignore' >> /etc/systemd/logind.conf

    #Battery improvements
    systemctl start thermald.service
    systemctl enable thermald.service 
    systemctl start tlp.service
    systemctl enable tlp.service 

    echo 'Section "Device"
	Identifier  "Intel Graphics" 
	Driver      "intel"
	Option      "Backlight"  "intel_backlight"
    EndSection' > /etc/X11/xorg.conf.d/20-intel.conf ;}



systembeepoff
updateinstallpkgs
configuredellvostro7590
