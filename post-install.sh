####################################################
################# GENERAL SETTINGS #################
####################################################
### Enable autologin
sudo mkdir /etc/sddm.conf.d
sudo touch /etc/sddm.conf.d/autologin.conf
sudo bash -c 'sudo echo "[Autologin]" >> /etc/sddm.conf.d/autologin.conf'
sudo bash -c 'sudo echo "User=diogom" >> /etc/sddm.conf.d/autologin.conf'
sudo bash -c 'sudo echo "Session=plasma" >> /etc/sddm.conf.d/autologin.conf'

## Disable KDE Wallet
sudo touch ~/.config/kwalletrc # TODO: test if file needs to be created on fresh install
sudo bash -c 'sudo echo "[Wallet]" >> ~/.config/kwalletrc'
sudo bash -c 'sudo echo "Enabled=false" >> ~/.config/kwalletrc'

# Keyboard layout
localectl set-keymap --no-convert pt-latin1
cp /etc/X11/xinit/xinitrc .xinitrc # Check if this does anything
sudo echo setxkbmap -layout pt >> /etc/X11/xinit/xinitrc # Check if this does anything
sed -i 's/\"us\"/\"pt\"/g' /etc/X11/xorg.conf.d/00-keyboard.conf


####################################################
##################### PACKAGES #####################
####################################################

### Yakuake installation + configuration ###########
sh ./yakuake.sh

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

### Steam ##########################################
## Enable pacman multilib
sed -i "/\[multilib\]/,/Include/"'s/^#//' /etc/pacman.conf
sudo pacman -Syyu --noconfirm
yay -S --noconfirm lib32-fontconfig
sudo pacman -S --noconfirm lib32-nvidia-utils ttf-liberation wqy-zenhei
sudo pacman -S --noconfirm steam


### Add applications to startup ####################
mkdir ~/.config/autostart
cp /usr/share/applications/org.kde.yakuake.desktop ~/.config/autostart
cp /usr/share/applications/discord.desktop ~/.config/autostart
cp /usr/share/applications/steam.desktop ~/.config/autostart
sed -i 's/Exec=\/usr\/bin\/steam-runtime %U/Exec=\/usr\/bin\/steam-runtime -silent %U/g' ~/.config/autostart/steam.desktop
