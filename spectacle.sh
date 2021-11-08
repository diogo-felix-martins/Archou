####################################################
#################### SPECTACLE #####################
####################################################
sudo pacman -S --noconfirm spectacle

# Copy config file
cp configs/spectaclerc ~/.config

# Set PRINT SCREEN key to rectangular area #########
sed -i 's/.*RectangularRegionScreenShot.*/RectangularRegionScreenShot=Print\\tMeta+Shift+Print,Meta+Shift+Print,Capture Rectangular Region/' ~/.config/kglobalshortcutsrc
