#!/bin/sh
####################################################
#################### KDE THEME #####################
####################################################
sudo pacman -S --noconfirm papirus-icon-theme materia-kde kvantum-theme-materia
lookandfeeltool -a com.github.varlesh.materia-dark

### Wallpapers #####################################
## Copy wallpapers to Pictures #####################
mkdir ~/Pictures/Wallpapers
cp wallpapers/* ~/Pictures/Wallpapers

## Select rancom wallpaper #########################
sh ./change-wallpaper.sh

## Copy Window Rules ###############################
cp configs/kwinrulesrc ~/.config
