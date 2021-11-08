####################################################
##################### YAKUAKE ######################
####################################################
sudo pacman -S --noconfirm yakuake zsh

## Configs + Theme #################################
# KDE Theme used in yakuake
sudo pacman -S --noconfirm materia-kde kvantum-theme-materia

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

# Copy config files
cp configs/terminal/agnoster.zsh-theme ~/.oh-my-zsh/themes
cp configs/terminal/MateriaDark.colorscheme ~/.local/share/konsole
cp configs/terminal/zsh.profile ~/.local/share/konsole
cp configs/terminal/.zshrc ~/
