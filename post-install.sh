#!/bin/sh
### Keyboard layout ################################
# TODO: Validate which instruction works
localectl set-keymap --no-convert pt-latin1
cp /etc/X11/xinit/xinitrc .xinitrc # Check if this does anything
sudo echo setxkbmap -layout pt >> /etc/X11/xinit/xinitrc # Check if this does anything
sed -i 's/\"us\"/\"pt\"/g' /etc/X11/xorg.conf.d/00-keyboard.conf

####################################################
##################### PACKAGES #####################
####################################################

### Copy Dolphin config file #######################
cp configs/dolphinrc ~/.config

### Yakuake installation + configuration ###########
sh ./yakuake.sh

### Spectacle installation + configuration #########
sh ./spectacle.sh

### General packages ###############################
sudo pacman -S --noconfirm nvidia nvidia-utils nvidia-settings discord ntfs-3g git


####################################################
####################### YAY ########################
####################################################
git clone https://aur.archlinux.org/yay-git
cd yay-git
makepkg --noconfirm -si
cd ..
sudo rm -R yay-git

### General packages ###############################
yay -S --noconfirm runelite google-chrome

### Disable kdewallet in chrome ####################
sudo kwriteconfig5 --file /usr/share/applications/google-chrome.desktop --group "Desktop Entry" --key Exec "/usr/bin/google-chrome-stable --password-store=basic %U2"

### Steam ##########################################
## Enable pacman multilib
sudo kwriteconfig5 --file /etc/pacman.conf --group multilib --key Include "/etc/pacman.d/mirrorlist"
sudo pacman -Syyu --noconfirm
yay -S --noconfirm lib32-fontconfig
sudo pacman -S --noconfirm lib32-nvidia-utils ttf-liberation wqy-zenhei
sudo pacman -S --noconfirm steam


####################################################
##################### STARTUP ######################
####################################################

### Add applications to startup ####################
mkdir ~/.config/autostart
cp /usr/share/applications/org.kde.yakuake.desktop ~/.config/autostart
cp /usr/share/applications/discord.desktop ~/.config/autostart
cp /usr/share/applications/steam.desktop ~/.config/autostart
kwriteconfig5 --file ~/.config/autostart/steam.desktop --group "Desktop Entry" --key Exec "/usr/bin/steam-runtime %U -silent"

####################################################
####################### KDE ########################
####################################################
sh ./kde.sh

