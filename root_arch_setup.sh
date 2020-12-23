#!/bin/bash
pacman -Syuu
pacman -S vim yay base-devel xclip xorg-xinput i3-gaps dmenu
echo "options snd_hda_intel dmic_detect=0" > /etc/modprobe.d/disable_dmic.conf
rmmod pcspkr
echo "blacklist pcspkr" > /etc/modprobe.d/nobeep.conf
