####################################################
################# GENERAL SETTINGS #################
####################################################

### Enable autologin ###############################
sudo mkdir /etc/sddm.conf.d
sudo touch /etc/sddm.conf.d/autologin.conf
sudo bash -c 'sudo echo "[Autologin]" >> /etc/sddm.conf.d/autologin.conf'
sudo bash -c 'sudo echo "User=diogom" >> /etc/sddm.conf.d/autologin.conf'
sudo bash -c 'sudo echo "Session=plasma" >> /etc/sddm.conf.d/autologin.conf'

### Disable KDE Wallet #############################
sudo rm -R ~/.config/kwalletrc
sudo touch ~/.config/kwalletrc
sudo bash -c 'sudo echo "[Wallet]" >> ~/.config/kwalletrc'
sudo bash -c 'sudo echo "Enabled=false" >> ~/.config/kwalletrc'

### Keyboard layout ################################
localectl set-keymap --no-convert pt-latin1
cp /etc/X11/xinit/xinitrc .xinitrc # Check if this does anything
sudo echo setxkbmap -layout pt >> /etc/X11/xinit/xinitrc # Check if this does anything
sed -i 's/\"us\"/\"pt\"/g' /etc/X11/xorg.conf.d/00-keyboard.conf

### Disable mouse acceleration #####################
sudo bash -c 'sudo echo "" >> ~/.config/kcminputrc'
sudo bash -c 'sudo echo "[Mouse]" >> ~/.config/kcminputrc'
sudo bash -c 'sudo echo "XLbInptAccelProfileFlat=true" >> ~/.config/kcminputrc'

### Disable single click opens files/folders #######
sed -i 's/\[KDE\]/\[KDE\]\\\nSingleClick=false/g' ~/.config/kdeglobals


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
sudo sed -i 's/Exec=\/usr\/bin\/google-chrome-stable %U/Exec=\/usr\/bin\/google-chrome-stable --password-store=basic %U/g' /usr/share/applications/google-chrome.desktop


### Steam ##########################################
## Enable pacman multilib
sed -i "/\[multilib\]/,/Include/"'s/^#//' /etc/pacman.conf
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
sed -i 's/Exec=\/usr\/bin\/steam-runtime %U/Exec=\/usr\/bin\/steam-runtime -silent %U/g' ~/.config/autostart/steam.desktop

####################################################
####################### KDE ########################
####################################################
sh ./kde.sh

