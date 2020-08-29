#!/bin/bash

ppaList=(papirus/papirus dwmw2/openconnect)

### Add PPAs
for i in ${ppaList[@]}
do
    grep -h "^deb.*$i" /etc/apt/sources.list.d/* > /dev/null 2>&1
    if [ $? -ne 0 ]
    then
        echo "Adding ppa:$i"
        add-apt-repository -y ppa:$i  
    fi
done

### Desktop Theming
# gsettings list-recursively org.cinnamon.desktop.interface
# gsettings list-schemas

# Panel
gsettings set org.cinnamon.theme name "Mint-Y-Dark-Aqua"
# Windows
gsettings set org.cinnamon.desktop.interface gtk-theme "Mint-Y-Dark-Aqua"
# Borders
gsettings set org.cinnamon.desktop.wm.preferences theme "Mint-Y-Dark"
# Icons
gsettings set org.cinnamon.desktop.interface icon-theme "Papirus-Dark"
# Curser
gsettings set org.cinnamon.desktop.interface cursor-theme "Breeze_Snow"
# Font
gsettings set org.gnome.desktop.interface monospace-font-name "Hack 11"
# Menu Animation
gsettings set org.cinnamon desktop-effects-on-menus false
# Menu Icon
sed -i -E 's/("value": )"linuxmint-logo[a-z-]+"/\1"linuxmint-logo-badge-symbolic"/g' ~/.cinnamon/configs/menu@cinnamon.org/0.json

## Desktop Power Settings
gsettings set org.cinnamon.desktop.session idle-delay 0
gsettings set org.cinnamon.settings-daemon.plugins.power sleep-inactive-ac-timeout 0
gsettings set org.cinnamon.settings-daemon.plugins.power sleep-display-ac 0

## Text Editor settings
gsettings set org.x.editor.preferences.editor display-line-numbers true
gsettings set org.x.editor.preferences.editor highlight-current-line true
gsettings set org.x.editor.preferences.editor search-highlighting true
gsettings set org.x.editor.preferences.editor bracket-matching true
gsettings set org.x.editor.preferences.editor syntax-highlighting true
gsettings set org.x.editor.preferences.editor scheme oblivion
gsettings set org.x.editor.preferences.editor prefer-dark-theme true
gsettings set org.x.editor.preferences.editor insert-spaces true
gsettings set org.x.editor.preferences.editor tabs-size 4
gsettings set org.x.editor.preferences.editor use-default-font true
gsettings set org.x.editor.preferences.editor syntax-highlighting true

## Sounds
gsettings set org.cinnamon.sounds logout-enabled false
gsettings set org.cinnamon.sounds login-enabled false

## Display Manager
sudo tee /etc/lightdm/slick-greeter.conf <<EOL > /dev/null
[Greeter]
theme-name=Mint-Y-Aqua
icon-theme-name=theme-name=Mint-Y-Aqua
EOL
