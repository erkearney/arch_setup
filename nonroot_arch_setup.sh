#!/bin/bash
export EDITOR=vim
read -r -p "Enter your github email: " GITHUBEMAIL
ssh-keygen -t rsa -b 4096 -C "$GITHUBEMAIL"
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_rsa
xclip -sel clip ~/.ssh/id_rsa.pub
echo "Add the SSH key to your github account"
firefox https://github.com/settings/keys

wget -O /home/$(logname)/.vimrc https://raw.githubusercontent.com/erkearney/my-vimrc/master/.vimrc

read -r -p "Do you want to install Signal? [y/N] " SIGNAL
if [[ "$SIGNAL" == 'y' ]] 
then
yay -S signal-desktop-beta
signal-desktop-beta
read -n 1 -s -r -p "Scan the QR code in Signal, Press any key to continue"
fi

read -r -p "Do you want to install Minecraft? [y/N] " MINECRAFT
if [[ "$MINECRAFT" == "y" ]] 
then
git clone https://aur.archlinux.org/minecraft-launcher.git
cd minecraft-launcher
makepkg -si
cd ..
rm -r minecraft-launcher
fi


#<property name="xfwm4" type="empty">
#<property name="&lt;Super&gt;Return" type="string" value="exo-open --launch TerminalEmulator"/>
