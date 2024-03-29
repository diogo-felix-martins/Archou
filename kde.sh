#!/bin/sh
####################################################
#################### KDE THEME #####################
####################################################
sudo pacman -S --noconfirm papirus-icon-theme materia-kde kvantum-theme-materia plasma5-applets-window-buttons ksysguard
lookandfeeltool -a com.github.varlesh.materia-dark

### Install systemloadviewer #######################
git clone --branch main --single-branch https://gitlab.com/hkanjal/kdeplasma-addons.git
cd kdeplasma-addons
chmod u+x install.sh
./install.sh
cd ..
sudo rm -R kdeplasma-addons

### Install Menu 11 ################################
git clone https://github.com/prateekmedia/Menu11.git ~/.local/share/plasma/plasmoids/menu11;

### Wallpapers #####################################
## Copy wallpapers to Pictures #####################
mkdir ~/Pictures/Wallpapers
cp wallpapers/* ~/Pictures/Wallpapers

## Select rancom wallpaper #########################
sh ./change-wallpaper.sh

## Copy Window Rules ###############################
cp configs/kwinrulesrc ~/.config

### Change login screen theme ######################
sudo mkdir /etc/sddm.conf.d
sudo cp -r configs/sddm/* /etc/sddm.conf.d

####################################################
################### KDE SETTINGS ###################
####################################################

### Enable autologin ###############################
sudo kwriteconfig5 --file ~/.config/kcminputrc --group Autologin --key User diogom
sudo touch /etc/sddm.conf.d/autologin.conf
sudo kwriteconfig5 --file /etc/sddm.conf.d/autologin.conf --group Autologin --key User diogom
sudo kwriteconfig5 --file /etc/sddm.conf.d/autologin.conf --group Autologin --key Session plasma

### Disable 5min logout timer ######################
kwriteconfig5 --file ~/.config/kcminputrc --group Daemon --key Autolock false
kwriteconfig5 --file ~/.config/kcminputrc --group Daemon --key LockOnResume false

### Disable KDE Wallet #############################
kwriteconfig5 --file ~/.config/kcminputrc --group Wallet --key Enabled false

### Disable mouse acceleration #####################
kwriteconfig5 --file ~/.config/kcminputrc --group Mouse --key XLbInptAccelProfileFlat true

### Disable single click opens files/folders #######
kwriteconfig5 --file ~/.config/kcminputrc --group KDE --key SingleClick false

### Change cursor theme ############################
kwriteconfig5 --file ~/.config/kcminputrc --group Mouse --key cursorTheme Breeze_Snow

### Disable cursor animation when opening programs
kwriteconfig5 --file ~/.config/klaunchrc --group BusyCursorSettings --key Bouncing false
kwriteconfig5 --file ~/.config/klaunchrc --group FeedbackStyle --key TaskbarButton false

### Disable shutdown popup options #################
kwriteconfig5 --file ~/.config/ksmserverrc --group General --key confirmLogout false
kwriteconfig5 --file ~/.config/ksmserverrc --group General --key offerShutdown false
kwriteconfig5 --file ~/.config/ksmserverrc --group General --key loginMode emptySession

### Change date/clock format #######################
kwriteconfig5 --file ~/.config/ktimezonedrc --group TimeZones --key LocalZone Atlantic/Madeira

### Window decorations on the left ################
kwriteconfig5 --file ~/.config/kwinrc --group org.kde.kdecoration2 --key ButtonsOnLeft XAIM
kwriteconfig5 --file ~/.config/kwinrc --group org.kde.kdecoration2 --key ButtonsOnRight ""

### Change compositor to OpenGL 3.1 ################
kwriteconfig5 --file ~/.config/kwinrc --group Compositing --key GLCore true
kwriteconfig5 --file ~/.config/kwinrc --group Compositing --key OpenGLIsUnsafe false

### Hide maxized window title bar ##################
kwriteconfig5 --file ~/.config/kwinrc --group Windows --key BorderlessMaximizedWindows true
