#!/bin/sh
####################################################
#################### SPECTACLE #####################
####################################################
sudo pacman -S --noconfirm spectacle

# Copy config file
cp configs/spectaclerc ~/.config

# Set PRINT SCREEN key to rectangular area #########
kwriteconfig5 --file ~/.config/kglobalshortcutsrc --group org.kde.spectacle.desktop --key RectangularRegionScreenShot "Print,Meta+Shift+Print,Capture Rectangular Region"
kwriteconfig5 --file ~/.config/kglobalshortcutsrc --group org.kde.spectacle.desktop --key _launch "Launch Spectacle"
