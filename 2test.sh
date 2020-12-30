#!/bin/bash
mv "$(find ~/Documents/Wallpapers -name "*.jpg" -type f | shuf -n 1)" /home/e/.config/wall.png
xwallpaper --zoom /home/e/.config/wall.png
