cd ~/Downloads
sudo pacman -Syu --noconfirm

localectl set-keymap --no-convert pt-latin1

### KDE Theme
sudo pacman -S --noconfirm papirus-icon-theme
sudo pacman -S --noconfirm materia-kde kvantum-theme-materia
lookandfeeltool -a com.github.varlesh.materia-dark


####################################################
##################### PACKAGES #####################
####################################################

### Yakuake ########################################
sudo pacman -S --noconfirm yakuake
## Configs #########################################
# Add to startup ###################################
mkdir ~/.config/autostart
cp /usr/share/applications/org.kde.yakuake.desktop ~/.config/autostart
# Alt+T keyboard shortcut
echo >> ~/.config/kglobalshortcutsrc # empty line
echo [yakuake] >> ~/.config/kglobalshortcutsrc
echo _k_friendly_name=Yakuake >> ~/.config/kglobalshortcutsrc
echo toggle-window-state=Alt+T,Alt+T,Open/Retract Yakuake >> ~/.config/kglobalshortcutsrc
# Close on lose focus ##############################
echo [Dialogs] >>  ~/.config/yakuakerc
echo FirstRun=false >>  ~/.config/yrakuakerc
echo  >>  ~/.config/yakuakerc  # empty line
echo [Window] >>  ~/.config/yakuakerc
echo KeepOpen=false >> ~/.config/yakuakerc
# Apply theme (Installed materia-kde package) ######
echo  >>  ~/.config/yakuakerc
echo  [Appearance] >>  ~/.config/yakuakerc
echo  Skin=materia-dark >>  ~/.config/yakuakerc

sudo pacman -S --noconfirm nvidia nvidia-utils discord zsh

### zsh (terminal)
## Configs
# Install configurations manager
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
Add plugins
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
sed -i 's/plugins=(git)/plugins=(git zsh-syntax-highlighting)/' ~/.zshrc
# Change theme
sed -i 's/ZSH_THEME="robbyrussell"/ZSH_THEME="agnoster"/' ~/.zshrc



####################################################
####################### YAY ########################
####################################################

sudo pacman -S --noconfirm git
git clone https://aur.archlinux.org/yay-git
cd yay-git
makepkg --noconfirm -si
sudo rm -R yay-git

yay -S --noconfirm google-chrome


echo source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh >> ~/.zshrc
