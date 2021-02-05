#!/bin/bash

systembeepoff() { dialog "Get rid of the worse error beep sound I've ever heard..." 10 50
    rmmod pcspkr
    echo "blacklist pcspkr" > /etc/modprobe.d/nobeep.conf ;}

fixsoundissue() { \
    echo "options snd_hda_intel dmic_detect=0" > /etc/modprobe.d/disable_dmic.conf ;}

updateinstallpkgs() {\
    pacman -Syuu
    pacman -Syy vim nextcloutd-cleint base-devel xclip xorg-xinput \
                i3-gaps dmenu i3status xterm ttf-linux-libertine \
                ttf-inconsolata zathura feh xwallpaper nmap xcompmgr ;}

setupgithub() {\
    read -r -p "Enter your github email: " GITHUBEMAIL
    git config --global user.email "$GITHUBEMAIL"
    ssh-keygen -t rsa -b 4096 -C "$GITHUBEMAIL"
    eval "$(ssh-agent -s)"
    ssh-add ~/.ssh/id_rsa
    xclip -sel clip ~/.ssh/id_rsa.pub
    firefox https://github.com/settings/keys 
    read -p "Go enter your new SSH key, Press enter to continue" ;}


updateinstallpkgs
systembeepoff
fixsoundissue
