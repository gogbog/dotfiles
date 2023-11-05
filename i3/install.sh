#! /bin/sh

############### i3 ############
apt install i3 -y
apt install i3status -y
apt install i3lock -y
apt install i3-wm -y
apt install i3blocks -y
apt install suckless-tools -y
apt install feh -y
apt install nemo -y

apt-get install acpi -y


#install i3lock-color

sudo apt install autoconf gcc make pkg-config libpam0g-dev libcairo2-dev libfontconfig1-dev libxcb-composite0-dev libev-dev libx11-xcb-dev libxcb-xkb-dev libxcb-xinerama0-dev libxcb-randr0-dev libxcb-image0-dev libxcb-util-dev libxcb-xrm-dev libxkbcommon-dev libxkbcommon-x11-dev libjpeg-dev -y

git clone https://github.com/Raymo111/i3lock-color.git
cd i3lock-color
chmod +x build.sh
./build.sh
chmod +x install-i3lock-color.sh
./install-i3lock-color.sh
