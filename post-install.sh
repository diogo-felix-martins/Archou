####################################################
################# GENERAL SETTINGS #################
####################################################
### Enable autologin
sudo mkdir /etc/sddm.conf.d
sudo touch /etc/sddm.conf.d/autologin.conf
sudo bash -c 'sudo echo "[Autologin]" >> /etc/sddm.conf.d/autologin.conf'
sudo bash -c 'sudo echo "User=diogom" >> /etc/sddm.conf.d/autologin.conf'
sudo bash -c 'sudo echo "Session=plasma" >> /etc/sddm.conf.d/autologin.conf'
## Auto unlock KDE Wallet
sudo pacman -S --noconfirm kwallet-pam

# Keyboard layout
localectl set-keymap --no-convert pt-latin1
cp /etc/X11/xinit/xinitrc .xinitrc # Check if this does anything
sudo echo setxkbmap -layout pt >> /etc/X11/xinit/xinitrc # Check if this does anything
sed -i 's/\"us\"/\"pt\"/g' /etc/X11/xorg.conf.d/00-keyboard.conf

### KDE Theme
sudo pacman -S --noconfirm papirus-# Enable pacman multilib
sed -i "/\[multilib\]/,/Include/"'s/^#//' /etc/pacman.conf

sudo pacman -Syyu --noconfirmicon-theme
sudo pacman -S --noconfirm materia-kde kvantum-theme-materia
lookandfeeltool -a com.github.varlesh.materia-dark


####################################################
##################### PACKAGES #####################
####################################################

### Yakuake ########################################
sudo pacman -S --noconfirm yakuake zsh
## Configs #########################################
# Copy config file
cp configs/terminal/yakuakerc ~/.config

## zsh
# Install configurations manager
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
# Download plugins
git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:=~/.oh-my-zsh/custom}/plugins/zsh-completions
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-history-substring-search ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-history-substring-search
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
# # Copy config files
cp configs/terminal/agnoster.zsh-theme ~/.oh-my-zsh/themes
cp configs/terminal/MateriaDark.colorscheme ~/.local/share/konsole
cp configs/terminal/zsh.profile ~/.local/share/konsole
cp configs/terminal/.zshrc ~/

sudo pacman -S --noconfirm nvidia nvidia-utils nvidia-settings discord ttf-liberation wqy-zenhei ntfs-3g

####################################################
####################### YAY ########################
####################################################

sudo pacman -S --noconfirm git
git clone https://aur.archlinux.org/yay-git
cd yay-git
makepkg --noconfirm -si
sudo rm -R yay-git

### General packages ###############################
yay -S --noconfirm runelite google-chrome

### Steam ##########################################
## Enable pacman multilib
sed -i "/\[multilib\]/,/Include/"'s/^#//' /etc/pacman.conf
sudo pacman -Syyu --noconfirm

yay -S --noconfirm lib32-fontconfig
sudo pacman -S --noconfirm lib32-nvidia-utils
sudo pacman -S --noconfirm steam

### Add applications to startup ####################
mkdir ~/.config/autostart
cp /usr/share/applications/org.kde.yakuake.desktop ~/.config/autostart
cp /usr/share/applications/discord.desktop ~/.config/autostart
cp /usr/share/applications/steam.desktop ~/.config/autostart
