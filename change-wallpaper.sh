#!/bin/sh
# //// CONFIGURABLE VARIABLES ////////////

# location of wallpapers folder
location="/home/diogom/Pictures/Wallpapers"

# ////////////////////////////////////////

array=($(ls $location*)) # populate array with directory contents
( IFS=$'\n'; echo "${array[*]}" ) # list array content for debug

size=${#array[@]}
index=$(($RANDOM % $size))
wallpaper=${array[$index]} # randomly select

echo
echo " || SELLECTED WALLPAPER = "$wallpaper

dbus-send --session --dest=org.kde.plasmashell --type=method_call /PlasmaShell org.kde.PlasmaShell.evaluateScript 'string:
var Desktops = desktops();
for (i=0;i<Desktops.length;i++) {
        d = Desktops[i];
        d.wallpaperPlugin = "org.kde.image";
        d.currentConfigGroup = Array("Wallpaper",
                                    "org.kde.image",
                                    "General");
        d.writeConfig("Image", "file://'''$location'''/'${wallpaper}'");
}'
