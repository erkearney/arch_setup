#!/bin/bash
pacman -Syuu
pacman -S vim yay base-devel xclip

if [[ $XDG_CURRENT_DESKTOP == "XFCE" ]]
then
read -r -p "Do you want to install the XFCE tasbar plugin? [y/N] " TASKBAR
if [[ "$TASKBAR" == "y" ]] 
then
git clone https://git.mirko.pm/brombinmirko/xfce4-taskbar-plugin.git
cd xfce4-taskbar-plugin
./autogen.sh
make
make install
fi
fi
