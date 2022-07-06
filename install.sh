#!/bin/bash

# Video Guide: https://youtu.be/-NwWE9YFFIg 

# Update and Enable RPM Fusion
echo "-----UPDATING-----"
sudo dnf update -y

echo "-----ENABLE RPM FUSION-----"
# https://docs.fedoraproject.org/en-US/quick-docs/setup_rpmfusion/
sudo dnf install -y \
    https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm \
    https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

# Codecs
echo "-----INSTALLING CODECS-----"
# https://docs.fedoraproject.org/en-US/quick-docs/assembly_installing-plugins-for-playing-movies-and-music/
sudo dnf install -y gstreamer1-plugins-{bad-\*,good-\*,base} gstreamer1-plugin-openh264 gstreamer1-libav --exclude=gstreamer1-plugins-bad-free-devel
sudo dnf install -y lame\* --exclude=lame-devel
sudo dnf group upgrade -y --with-optional Multimedia

# DNF
echo "-----INSTALLING DNF PACKAGES-----"
sudo dnf install -y \
    sway \
    dunst \
    chromium \
    discord \
    flameshot \
    gimp \
    google-chrome \
    hugo \
    kitty \
    liberation-narrow-fonts \
    lxappearance \
    mpv \
    npm \
    neofetch \
    newsboat \
    ranger \
    stow \
    vim \
    zsh

# AppImages
echo "-----INSTALLING APPIMAGES-----"
mkdir ~/AppImages

# Pomotroid
echo "getting pomotroid..."
curl -s https://api.github.com/repos/Splode/pomotroid/releases/latest \
    | grep "browser_download_url.*AppImage" \
    | cut -d : -f 2,3 \
    | tr -d \" \
    | wget -qi -

chmod +x *.AppImage
mv *.AppImage ~/AppImages

# NPM and RPM Packages
echo "-----INSTALLING NPM/RPM PACKAGES-----"

# taskbook
echo "getting taskbook..."
sudo npm install --global taskbook

echo "Downloading RPMs..."

# onlyoffice
#wget https://download.onlyoffice.com/install/desktop/editors/linux/onlyoffice-desktopeditors.x86_64.rpm

# bitwarden
curl -s https://api.github.com/repos/bitwarden/desktop/releases/latest \
    | grep "browser_download_url.*rpm" \
    | cut -d : -f 2,3 \
    | tr -d \" \
    | wget -qi -

# marktext
curl -s https://api.github.com/repos/marktext/marktext/releases/latest \
    | grep "browser_download_url.*rpm" \
    | cut -d : -f 2,3 \
    | tr -d \" \
    | wget -qi -

# kuro
curl -s https://api.github.com/repos/davidsmorais/kuro/releases/latest \
    | grep "browser_download_url.*x86_64.rpm" \
    | cut -d : -f 2,3 \
    | tr -d \" \
    | wget -qi -

echo "Installing RPMs..."
sudo rpm -i *.rpm

# vscodium
echo "getting vscodium..."
sudo rpmkeys --import https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/-/raw/master/pub.gpg
printf "[gitlab.com_paulcarroty_vscodium_repo]\nname=download.vscodium.com\nbaseurl=https://download.vscodium.com/rpms/\nenabled=1\ngpgcheck=1\nrepo_gpgcheck=1\ngpgkey=https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/-/raw/master/pub.gpg\nmetadata_expire=1h" | sudo tee -a /etc/yum.repos.d/vscodium.repo
sudo dnf install -y codium

# librewolf
echo "getting librewolf..."
sudo rpm --import https://keys.openpgp.org/vks/v1/by-fingerprint/034F7776EF5E0C613D2F7934D29FBD5F93C0CFC3
sudo dnf config-manager --add-repo https://rpm.librewolf.net
sudo dnf install -y librewolf

# brave
echo "getting brave..."
sudo dnf config-manager --add-repo https://brave-browser-rpm-release.s3.brave.com/x86_64/
sudo rpm --import https://brave-browser-rpm-release.s3.brave.com/brave-core.asc
sudo dnf install -y brave-browser


# Re-checking updates one final time
echo "-----UPDATING-----"
sudo dnf update -y

echo "-----INSTALLING FONTS & Theme-----"

# Meslo Fonts
echo "installing meslo fonts..."
sudo mkdir /usr/share/fonts/meslolgs-nf
wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Regular.ttf
wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold.ttf
wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Italic.ttf
wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold%20Italic.ttf
sudo mv MesloLGS* /usr/share/fonts/meslolgs-nf

# GTK Theme
echo "installing GTK theme..."
wget https://github.com/dracula/gtk/archive/master.zip
wget https://github.com/dracula/gtk/files/5214870/Dracula.zip
unzip \*
mv gtk-master/ dracula/
sudo mv dracula/ /usr/share/themes
sudo mv Dracula/ /usr/share/icons

# Stow Dotfiles
echo "-----SYMBOLICALLY LINK DOTFILES-----"
mkdir ~/screenshots
rm *.zip
rm *.rpm
rm ~/.bashrc
stow .

# Things I can't wget
echo "Install Script Complete!"
echo "https://www.webex.com/downloads.html"
echo "https://www.microsoftedgeinsider.com/en-us/download?platform=linux-rpm"
echo "https://brew.sh/"
echo "https://github.com/romkatv/powerlevel10k"

# zsh
echo "Switch shell to zsh:"
echo "sudo lchsh $USER"
echo "/bin/zsh"

#git
echo "Git Creds:"
echo "git config --global user.name"
echo "git config --global user.email"
echo "git config --global credential.helper store"
echo "git push or pull"