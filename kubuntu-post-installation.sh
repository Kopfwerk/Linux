#!/bin/bash

# Carry out updates

sudo apt update && sudo apt upgrade

# Install gdebi

dpkg -l | grep -qw gdebi || sudo apt-get install -yyq gdebi

# Install packages from repositories

sudo apt install ubuntu-restricted-extras flatpak thunderbird thunderbird-locale-de gimp gimp-help-de language-pack-gnome-de libreoffice libreoffice-l10n-de libreoffice-help-de git krita krita-l10n simple-scan kdenlive obs-studio virtualbox virtualbox-qt virtualbox-dkms virtualbox-guest-additions-iso  -yy

sudo adduser $USER vboxusers 

# Remove Firefox and Skanlite

sudo apt purge firefox skanlite

# Purge not used packages

sudo apt autoremove

# Aktivate Flatpak

sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

# Install Dropbox as Flatpak

flatpak install flathub com.dropbox.Client

# Download and install Google Chrome

wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb

sudo gdebi google-chrome-stable_current_amd64.deb

rm google-chrome-stable_current_amd64.deb

# Download and install Teamviewer

wget https://download.teamviewer.com/download/linux/teamviewer_amd64.deb

sudo gdebi teamviewer_amd64.deb

rm teamviewer_amd64.deb

# Download and install Skype

wget https://go.skype.com/skypeforlinux-64.deb

sudo gdebi skypeforlinux-64.deb

rm skypeforlinux-64.deb

# Brother Printer-/Scanner-Driver for my Brother MFC-J5320DW

https://support.brother.com/g/b/downloadhowto.aspx?c=de&lang=de&prod=mfcj5320dw_eu_as&os=128&dlid=dlf006893_000&flang=4&type3=625

# Deaktive bootsplash

sudo cp /etc/default/grub /etc/default/grub.save

sudo nano /etc/default/grub

# Change the following line: GRUB_CMDLINE_LINUX_DEFAULT=""

sudo update-grub
