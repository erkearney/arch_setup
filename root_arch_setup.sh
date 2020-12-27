#!/bin/bash

systembeepoff() { dialog "Get rid of the worse error beep sound I've ever heard..." 10 50
    rmmod pcspkr
    echo "blacklist pcspkr" > /etc/modprobe.d/nobeep.conf ;}

updateconfigfiles() { \
    echo "options snd_hda_intel dmic_detect=0" > /etc/modprobe.d/disable_dmic.conf ;}

pacman -Syuu
pacman -S vim yay base-devel xclip xorg-xinput i3-gaps dmenu i3status
systembeepoff
updateconfigfiles
