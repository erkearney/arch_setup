#!/bin/bash

setupgithub() {\
    read -r -p "Enter your github email: " GITHUBEMAIL
    git config --global user.email "$GITHUBEMAIL"
    ssh-keygen -t rsa -b 4096 -C "$GITHUBEMAIL"
    eval "$(ssh-agent -s)"
    ssh-add ~/.ssh/id_rsa
    xclip -sel clip ~/.ssh/id_rsa.pub
    firefox https://github.com/settings/keys 
    read -p "Go enter your new SSH key, Press enter to continue" ;}

setupconfigfiles() {\
    git clone git@github.com:erkearney/config-files.git $HOME/Documents/
    ln $HOME/Documents/Config-files/Xresouces $HOME/.Xresources
    xrdb -merg $HOME/.Xresources
    ln $HOME/Documents/Config-files/i3-config $HOME/.config/i3/config
    ln $HOME/Documents/Config-files/vimrc $HOME/.vimrc
    ln $HOME/Document/Config-files/login_profile $HOME/.profile
    ln $HOME/Documents/Config-files/bashrc $HOME/.bashrc
    ln $HOME/Documents/Config-files/50-mouse-acceleration.conf /etc/X11/xorg.conf.d/50-mouse-acceleration.conf
    export EDITOR=vim ;}

downloadwallpapers() {\
    shufflecommand='mv "$(find ~/Wallpapers -name "*.jpg" -type f | shuf -n 1)"'
    mkdir $HOME/Wallpapers/
    cd $HOME/Wallpapers/
    wget -O waterfall.jpg https://www.hdwallpapers.in/download/waterfall_between_rock_pouring_on_river_4k_hd_nature-1920x1080.jpg
    wget -O autumn_road.jpg https://www.hdwallpapers.in/download/road_with_leaves_between_autumn_trees_hd_nature-1920x1080.jpg
    wget -O autumn_tree.jpg https://www.hdwallpapers.in/download/red_autumn_trees_in_forest_hd_nature-1920x1080.jpg
    wget -O river_waterfall.jpg https://www.hdwallpapers.in/download/beautiful_background_green_river_waterfall_in_kanchanaburi_thailand_4k_hd_nature-1920x1080.jpg
    wget -O seashore_sunset.jpg https://www.hdwallpapers.in/download/seashore_with_colorful_sunset_background_hd_sunset-1920x1080.jpg
    echo "#!/bin/bash" >> ~/.xprofile
    echo "$shufflecommand" ~/.config/wall.png >> ~/.xprofile
    echo xwallpaper --zoom ~/.config/wall.png >> ~/.xprofile ;}

installmiscprograms() {\
    git clone https://aur.archlinux.org/packages/transset-df/
    cd transset-df
    makepkg -si
    cd ..
    rm -r transset-df
    read -r -p "Do you want to install Signal? [y/N] " SIGNAL

    git clone https://aur.archlinux.org/protonmail-bridge.git
    cd protonmail-bridge
    makepkg -si
    cd ..
    rm -r protonmail-brdige
    thunderbird
    read -n 1 -s -r -p "Setup email, Press any key to continue"

    if [[ "$SIGNAL" == 'y' ]] 
    then
        git clone https://aur.archlinux.org/signal-desktop-beta.git
        cd signal-desktop-beta
        makepkg -si
        cd ..
        rm -r signal-desktop-beta
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
    fi ;}

setupgithub
setupconfigfiles
installmiscprograms
downloadwallpapers
